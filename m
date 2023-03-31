Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426D8C10
	for <bugs@lists.linux.dev>; Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76957C4339B;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680285589;
	bh=yhCB0mI36C1VXatllcxVdD37VyFTD32kM/CXmmPUDRU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=G1D8nHt7mY4QHYjVSreZwIPtiuLDaabAtWocpbJtrJ2MYaR0gzqFECe7B93cs9Hce
	 AzbGZbY9xUXrJkwcz2Ek8BrtZ2x3/c6l4cM96QxJt8wDa8BoivQVSJfORSLlMcLJF5
	 lg8LvTNlOaQcClUikShZQxd8G54PCm6b0YSdfSM4WxZjz4yRFJZRFe3ar3lBZvt+XX
	 TY0agh7lNUTXJplBLDZbF3uNvpc4lXJXo3a1g06I8H+5GuSzT6GUTfe93xEzix5Gu+
	 lsyMXaRJF7E0M3nkEkeBlpog1f+wMCW5MGV5cS5Cz/XIXAIJgATnZM7IQ/ABurPysP
	 61ffw9d4d1ISg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59DC8C395C3;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: perex@perex.cz, bugs@lists.linux.dev, tiwai@suse.com, 
 alsa-devel@alsa-project.org
Message-ID: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
In-Reply-To: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
References: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
Subject: Re: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 31 Mar 2023 17:59:49 +0000 (UTC)

rakic.iwan writes via Kernel.org Bugzilla:

Any news?

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

