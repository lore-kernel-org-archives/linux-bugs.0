Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403F6ADC
	for <bugs@lists.linux.dev>; Wed, 26 Apr 2023 19:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Infua/8SLCu28SekmJ2nH6YHw5hLoO39yRDE2C8ZQ5g=; b=tzEGeyXZ2a/3x8SBdwBJpogVWT
	ncf8KrMBqvcvz2rFkzBKw/A6fqwFAOL2+yTAqEoTEQSMIvvX77a/pAGSimtS9SxFQNx3s8/BACTa4
	kvH+Ord0UFDrYXv8UKoeICb7fYLdUVWbu7nckzcf8WLkToe6CZ1Ycs4OKgnS36THaGYgW9se4LmL5
	wFOFV6E+qIFpMQUM86gsw0CsnCxAVYwZqS78PhOUiiSpkp4U05oRyC1GnZOVaZJxgmWNckBpor8NB
	bpw1asEXAKu2spS8f2nk7POnolRoV19vxGZ9YLVp1xxOHeXGihmsIj3iDNiFn+3zZkVEFcqw8VmKv
	9A3qGPxQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1prlHR-00CwRn-2j;
	Wed, 26 Apr 2023 19:58:21 +0000
Date: Wed, 26 Apr 2023 20:58:21 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Kernel.org Bugbot" <bugbot@kernel.org>, brauner@kernel.org,
	linux-fsdevel@vger.kernel.org, bugs@lists.linux.dev
Subject: Re: large pause when opening file descriptor which is power of 2
Message-ID: <20230426195821.GV3390869@ZenIV>
References: <20230426-b217366c0-53b6841a1f9a@bugzilla.kernel.org>
 <ZEl34WthS8UNJnNd@casper.infradead.org>
 <20230426194628.GU3390869@ZenIV>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426194628.GU3390869@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Apr 26, 2023 at 08:46:28PM +0100, Al Viro wrote:
> On Wed, Apr 26, 2023 at 08:13:37PM +0100, Matthew Wilcox wrote:
> > On Wed, Apr 26, 2023 at 05:58:06PM +0000, Kernel.org Bugbot wrote:
> > > When running a threaded program, and opening a file descriptor that
> > > is a power of 2 (starting at 64), the call takes a very long time to
> > > complete. Normally such a call takes less than 2us. However with this
> > > issue, I've seen the call take up to around 50ms. Additionally this only
> > > happens the first time, and not subsequent times that file descriptor is
> > > used. I'm guessing there might be some expansion of some internal data
> > > structures going on. But I cannot see why this process would take so long.
> > 
> > Because we allocate a new block of memory and then memcpy() the old
> > block of memory into it.  This isn't surprising behaviour to me.
> > I don't think there's much we can do to change it (Allocating a
> > segmented array of file descriptors has previously been vetoed by
> > people who have programs with a million file descriptors).  Is it
> > causing you problems?
> 
> FWIW, I suspect that this is not so much allocation + memcpy.
>         /* make sure all fd_install() have seen resize_in_progress
> 	 * or have finished their rcu_read_lock_sched() section.
> 	 */
> 	if (atomic_read(&files->count) > 1)
> 		synchronize_rcu();
> 
> in expand_fdtable() is a likelier source of delays.

	A bit more background: we want to avoid grabbing ->file_lock in
fd_install() if at all possible.  After all, we have already claimed
the slot (back when we'd allocated the descriptor) and nobody else is
allowed to shove a file reference there.

	Which is fine, except for the fact that expansion of descriptor
table needs to allocate a new array, copy the old one into it and replace
the old one with it.

	Lockless fd_install() might overlap with the "copy" step in
the above and end up getting lost.  So in fd_install() we check if
there's a resize in progress before deciding to go for the lockless path.
Which means that on the resize side we need to mark the descriptor table
as getting resized, then wait long enough for all threads already in
fd_install() to get through.
