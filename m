Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7D7E
	for <bugs@lists.linux.dev>; Sat, 27 May 2023 19:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B184CC433D2;
	Sat, 27 May 2023 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685215699;
	bh=47U77481J8R45xXOIvay+70BtesXIQ5aQ4HfME31dZw=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=iGIh//w1R0aZbi6rkc8qZritYorqCU5chD0p5r/4uyFSRoECVlXCsdnhUcbLwdXDL
	 WGh67k0fcNYUJSVFII2t1HF1ZjwlynBKywpt5ghxPnBds+aW98VlaYih7JZgP5MmmV
	 zu3NLXtpLf5QxuCJohSIwJjuFhzUgp1WCb/E6QJ6Ftsi9yUTDfWUbqsjIw6WbXbPKq
	 cF2U9ZRt8Q6US9zOc8szJSdJbyaXAqLxQD9YFscLOlVB0rxj3wgmXRqLsb8m8NpBe5
	 RlAwVO6TK5IirXWpeeCuYcRGVdaovv7DRTK1RSf//ScqVCzDruiptudSp3ZR/9KwFA
	 f6cdSNdJN+92g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C086C4166F;
	Sat, 27 May 2023 19:28:19 +0000 (UTC)
Date: Sat, 27 May 2023 19:28:18 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, tiwai@suse.com, alsa-devel@alsa-project.org, 
 perex@perex.cz
Message-ID: <20230527-b216392c2-2360e52d040f@bugzilla.kernel.org>
In-Reply-To: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
References: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
Subject: Re: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

mpagano writes via Kernel.org Bugzilla:

(In reply to Ivan from comment #1)
> Any news?

There at least an acknowledgement of the growing problem and a statement that it's being worked on.

https://lore.kernel.org/lkml/1991650.PYKUYFuaPT@fedora/

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

