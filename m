Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE086FB8
	for <bugs@lists.linux.dev>; Wed, 26 Apr 2023 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/q9fRpVBa83ruvP8VZe4+FEBY0MwrxO7iAUVr6H465A=; b=Ht4Ek+KL1dA94R5fJEsXImODV4
	a+pLE3CmQIi9u3XIJZLzGHI96P3DitibO1VvDMmJgc/QTfwj4sh63rGoAXOgJU1gP5FMBmPVuiP1h
	owA4w5GnzHmADW9MKAlIhDcaBA9Tx3uyOQFyWfl89Ym/sxf0AT6/xNA+okFXF14YjezUrsxd1lGR4
	kNPevmlgBDdM5uFqBia6TmVPXfqd8vpLTg5e3tt4lisWOxGE/SB1bLb6vEwmbRNQ6KUXCETP/j4i4
	Yhv6Hok4fHbGAsS6AeyZjv/1W6RB2irpu2793+PocxO1QlOO9921OgTbPN3gHCt6omPK8A2WSUFM0
	Sa3e3YXA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1prl5w-00CwGr-17;
	Wed, 26 Apr 2023 19:46:28 +0000
Date: Wed, 26 Apr 2023 20:46:28 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Kernel.org Bugbot" <bugbot@kernel.org>, brauner@kernel.org,
	linux-fsdevel@vger.kernel.org, bugs@lists.linux.dev
Subject: Re: large pause when opening file descriptor which is power of 2
Message-ID: <20230426194628.GU3390869@ZenIV>
References: <20230426-b217366c0-53b6841a1f9a@bugzilla.kernel.org>
 <ZEl34WthS8UNJnNd@casper.infradead.org>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEl34WthS8UNJnNd@casper.infradead.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Apr 26, 2023 at 08:13:37PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 26, 2023 at 05:58:06PM +0000, Kernel.org Bugbot wrote:
> > When running a threaded program, and opening a file descriptor that
> > is a power of 2 (starting at 64), the call takes a very long time to
> > complete. Normally such a call takes less than 2us. However with this
> > issue, I've seen the call take up to around 50ms. Additionally this only
> > happens the first time, and not subsequent times that file descriptor is
> > used. I'm guessing there might be some expansion of some internal data
> > structures going on. But I cannot see why this process would take so long.
> 
> Because we allocate a new block of memory and then memcpy() the old
> block of memory into it.  This isn't surprising behaviour to me.
> I don't think there's much we can do to change it (Allocating a
> segmented array of file descriptors has previously been vetoed by
> people who have programs with a million file descriptors).  Is it
> causing you problems?

FWIW, I suspect that this is not so much allocation + memcpy.
        /* make sure all fd_install() have seen resize_in_progress
	 * or have finished their rcu_read_lock_sched() section.
	 */
	if (atomic_read(&files->count) > 1)
		synchronize_rcu();

in expand_fdtable() is a likelier source of delays.
