Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208E2CA9
	for <bugs@lists.linux.dev>; Wed, 26 Apr 2023 23:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0621AC433EF;
	Wed, 26 Apr 2023 23:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682552522;
	bh=C5KQ7vzpBxcUOFH/2EXsgfvS3DyI2zJAA2Qs2OssPek=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tccpkzogLScpv+VYVQ09nxbo9zz1EMmP97ljzaKqMwptL9xK5fZpe/BDXzCFuj9Cy
	 yfuSYnf/8ikr+fZU1/x1zm54lfDJAUBGcPARXS4fhK/qWiorpp3WG+rmXI7mJybDuf
	 kMbo10LaS1n6ojjKrBxBvJ61U0uO0x9QK5zaKN8dLnQugL/ASMuRwpLC+W48nYwejl
	 a2tflCDrjrQzo+1qreqe/AD4D0opf0q9zVispM09Ffz9JVb0ITkfbIXQRWLEGbzlvu
	 kJM02/qRDWBdfnu9fNGkVpYqvo7Z2kkW0vXSC3m4SvvSckDFfvm3ErAi5w9YHgat53
	 wMvGPEOMM3Fug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D59EEE5FFC9;
	Wed, 26 Apr 2023 23:42:01 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, willy@infradead.org, brauner@kernel.org, 
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org
Message-ID: <20230426-b217366c6-4f880518247a@bugzilla.kernel.org>
In-Reply-To: <ZEl34WthS8UNJnNd@casper.infradead.org>
References: <ZEl34WthS8UNJnNd@casper.infradead.org>
Subject: Re: large pause when opening file descriptor which is power of 2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Wed, 26 Apr 2023 23:42:01 +0000 (UTC)

phemmer+kernel writes via Kernel.org Bugzilla:

(In reply to Bugbot from comment #1)
> Matthew Wilcox <willy@infradead.org> writes:
> 
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

Yes. I'm using using sockets for IPC. Specifically haproxy with its SPOE protocol. Low latency is important. Normally a call (including optional connect if a new connection is needed) will easily complete in under 100us. So I want to set a timeout of 1ms to avoid blocking traffic. However because this issue effectively randomly pops up, that 1ms timeout is too low, and the issue can actually impact multiple in-flight requests because haproxy tries to share that one IPC connection for them all. But if I raise the timeout (and I'd have to raise it to something like 100ms, as I've seen delays up to 47ms in just light testing), then I run the risk of significantly impacting traffic if there is a legitimate slowdown. While a low timeout and the occasional failure is probably the better of the two options, I'd prefer not to fail at all.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217366#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

