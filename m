Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2896ADC
	for <bugs@lists.linux.dev>; Wed, 26 Apr 2023 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VIUqXVtUe4bZ8NtmE8a1FAauCd96j6BzSVHyawTA+ZM=; b=aUChelqXkih9JMCYHBk2D9U1QZ
	Z7T9OPKLurxiEsYYr7SWLOPxQH4UVPXEB1oB/76X9BtQyrlNPXoYXi8tNxnqlz3fDz95XQG0C/nf1
	OTug4u9SYK+SsT+18PQy+ZBdOcvLkxIVSYY7ZW7JxTKGTD8pWSX5P7UF3ug7bXHfmvvaEpl6lpjWx
	x18U1NNXj48FCRMX+8hvY1gQ2U4l2BDvPP2LHolKkC1z+mKFFSSiBt4HqST+lUyMgebuJJfN9utwq
	7riZ4uyXqsXGtuHCLwUnR0rlNIFjd718Vw0mnVAfIa4ejzJUZaCnEP1qEawmWv6v4eU9v968ZTvqj
	xAjnWJ/g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1prka9-002lnw-H6; Wed, 26 Apr 2023 19:13:37 +0000
Date: Wed, 26 Apr 2023 20:13:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org,
	linux-fsdevel@vger.kernel.org, bugs@lists.linux.dev
Subject: Re: large pause when opening file descriptor which is power of 2
Message-ID: <ZEl34WthS8UNJnNd@casper.infradead.org>
References: <20230426-b217366c0-53b6841a1f9a@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426-b217366c0-53b6841a1f9a@bugzilla.kernel.org>

On Wed, Apr 26, 2023 at 05:58:06PM +0000, Kernel.org Bugbot wrote:
> When running a threaded program, and opening a file descriptor that
> is a power of 2 (starting at 64), the call takes a very long time to
> complete. Normally such a call takes less than 2us. However with this
> issue, I've seen the call take up to around 50ms. Additionally this only
> happens the first time, and not subsequent times that file descriptor is
> used. I'm guessing there might be some expansion of some internal data
> structures going on. But I cannot see why this process would take so long.

Because we allocate a new block of memory and then memcpy() the old
block of memory into it.  This isn't surprising behaviour to me.
I don't think there's much we can do to change it (Allocating a
segmented array of file descriptors has previously been vetoed by
people who have programs with a million file descriptors).  Is it
causing you problems?
