Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E2847F
	for <bugs@lists.linux.dev>; Thu, 27 Apr 2023 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p0yGWz9XwtwnxlJG+iIcspl1aNoYxGcRh5vzES5LHZY=; b=I/d2T4mz16OKCkRiCshveMRc+r
	RakrVkSzrY5zF5e2RzRmLFeKQK6lNyE8bDs+ZPNpn/knhXJZaIzyBPoV0AHdo6WI0wNxMAmnkkvPJ
	Om/EN7mIREoRZwboEEdTXkFw7H6VGaYra9QMxS4lhCdQHwYDwewCLgr6U2ej3pnyq0I1RH1UQ91xy
	E4HiibXtyVmKGNyZnqm75wY1hN6Jrq2Uw9ptdPL3CF3hweYHr/mbz4APvzzrPVCU57hKjvb0cZ6P9
	enbPEqMrOQAGCVL4gcBXBEXZJqMpFCi9KZ8WDIBgbb9ajAZdlRYB0axlekJXw2XG313wKlVZg1dGH
	fPKayhPg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ps6Cf-003oVu-6T; Thu, 27 Apr 2023 18:18:49 +0000
Date: Thu, 27 Apr 2023 19:18:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: bugs@lists.linux.dev, brauner@kernel.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
Subject: Re: large pause when opening file descriptor which is power of 2
Message-ID: <ZEq8iSl985aqEy4+@casper.infradead.org>
References: <ZEl34WthS8UNJnNd@casper.infradead.org>
 <20230426-b217366c6-4f880518247a@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426-b217366c6-4f880518247a@bugzilla.kernel.org>

On Wed, Apr 26, 2023 at 11:42:01PM +0000, Kernel.org Bugbot wrote:
> Yes. I'm using using sockets for IPC. Specifically haproxy with its
> SPOE protocol. Low latency is important. Normally a call (including
> optional connect if a new connection is needed) will easily complete
> in under 100us. So I want to set a timeout of 1ms to avoid blocking
> traffic. However because this issue effectively randomly pops up,
> that 1ms timeout is too low, and the issue can actually impact
> multiple in-flight requests because haproxy tries to share that one
> IPC connection for them all. But if I raise the timeout (and I'd have
> to raise it to something like 100ms, as I've seen delays up to 47ms in
> just light testing), then I run the risk of significantly impacting
> traffic if there is a legitimate slowdown. While a low timeout and
> the occasional failure is probably the better of the two options,
> I'd prefer not to fail at all.

A quick workaround for this might be to use dup2() to open a newfd
that is larger than you think your process will ever use.  ulimit -n
is 1024 (on my system), so choosing 1023 might be a good idea.
It'll waste a little memory, but ensures the fd array will never need to
expand.
