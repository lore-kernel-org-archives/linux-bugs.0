Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37F19D
	for <bugs@lists.linux.dev>; Fri, 28 Apr 2023 00:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86AC3C433EF;
	Fri, 28 Apr 2023 00:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682642260;
	bh=So7KPvg2RhSDgR8qeYDOzTDfqgmy+jmipRRnigXM9Hw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=smzpr0tK5SGpXVeoVcM6Wpm1+23FL70xoQ81MgqiyT85A6xsOOUW/VK2fSliwjBRW
	 tu0uzxA+42SliS3taD4xlv8uqBH+LibMcPrkZgL3zE5s0xJSZNDAvlWtWWc0o1XmYa
	 CfMIoi69GWdtFR5gwK0P4rAA72EhoGFzrhItoCtC2gJQZNNEb9StdIWFJJRkFeYQVR
	 KI73Up6AMILEge5Snzvp/JABCxBqCD8Sm8ECMV5uexrlCV6cXfoEuAPMGAHtKqAQLd
	 rj3xPyIJB3tm9iL2OZLsVwCiWByaCxZ72/6V8E400bocQC+wJo1+3NznlIE+dwwLFu
	 h0nNhT+uSZYZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6876FC39562;
	Fri, 28 Apr 2023 00:37:40 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, 
 bugs@lists.linux.dev, brauner@kernel.org, willy@infradead.org
Message-ID: <20230428-b217366c9-e84e92b8b016@bugzilla.kernel.org>
In-Reply-To: <ZEq8iSl985aqEy4+@casper.infradead.org>
References: <ZEq8iSl985aqEy4+@casper.infradead.org>
Subject: Re: large pause when opening file descriptor which is power of 2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 28 Apr 2023 00:37:40 +0000 (UTC)

phemmer+kernel writes via Kernel.org Bugzilla:

(In reply to Bugbot from comment #8)
> Matthew Wilcox <willy@infradead.org> replies to comment #6:
> 
> On Wed, Apr 26, 2023 at 11:42:01PM +0000, Kernel.org Bugbot wrote:
> > Yes. I'm using using sockets for IPC. Specifically haproxy with its
> > SPOE protocol. Low latency is important. Normally a call (including
> > optional connect if a new connection is needed) will easily complete
> > in under 100us. So I want to set a timeout of 1ms to avoid blocking
> > traffic. However because this issue effectively randomly pops up,
> > that 1ms timeout is too low, and the issue can actually impact
> > multiple in-flight requests because haproxy tries to share that one
> > IPC connection for them all. But if I raise the timeout (and I'd have
> > to raise it to something like 100ms, as I've seen delays up to 47ms in
> > just light testing), then I run the risk of significantly impacting
> > traffic if there is a legitimate slowdown. While a low timeout and
> > the occasional failure is probably the better of the two options,
> > I'd prefer not to fail at all.
> 
> A quick workaround for this might be to use dup2() to open a newfd
> that is larger than you think your process will ever use.  ulimit -n
> is 1024 (on my system), so choosing 1023 might be a good idea.
> It'll waste a little memory, but ensures the fd array will never need to
> expand.

That's a good idea. I was originally considering opening a bunch of file descriptors one by one. But if it will grow even while skipping all the FDs in between, then that seems like it should work. At least for the app which I control. I don't know that it'd be a welcome change on the haproxy side though. And both sides would need it to completely alleviate the issue.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217366#c9
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

