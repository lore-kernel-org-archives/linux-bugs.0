Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9857AC979
	for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 21:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45E1BC433D2;
	Thu, 30 Mar 2023 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680212354;
	bh=1kI/b9AvfUrt2Qj9Er91iYkg6kE+09X2/7mc2Szq4OA=;
	h=Reply-To:From:To:In-Reply-To:References:Subject:Date:From;
	b=bPFM0qfKifqyaLBcV/GtxuFfSpFeXTIv9dF9VEsa9HHpetXJgONVZhAVfV8m92ZJB
	 o8H6i13XtyEUJnGKkFyq/SkYVGPE+Ld+yjvFVMeSuy0VYLpFU8JD+m40f7RdOo5rHz
	 IvKbUKRdhw4AjQ+/JzbHcfof4o/qwdQnGb7LrN/Jiu7OHDkH04FDaEjzOeksdeIzWR
	 CCPCOdyc8pHN56WTabVQ8WTeouJ+bOp5XQmG+4AIIOhjq0muLn7v0WR1V+ktP2x/R/
	 oGOhuZJUc32UFFmb3WIFYYQdEautlW0mFxa/PmeQKh2kbYSc1Uyg2U9ODMHcSm9tac
	 VkD3eHcP0PXTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A1C3E49FA7;
	Thu, 30 Mar 2023 21:39:14 +0000 (UTC)
Reply-To: mricon@kernel.org
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: acme@kernel.org, linux-perf-users@vger.kernel.org, peterz@infradead.org, 
 pengfei.xu@intel.com, bugs@lists.linux.dev, linux-kernel@vger.kernel.org, 
 mricon@kernel.org, mingo@redhat.com
Message-ID: <20230330-b217267c1-e341c3e6314b@bugzilla.kernel.org>
In-Reply-To: <20230330-b217267c0-15b9c837ad2e@bugzilla.kernel.org>
References: <20230330-b217267c0-15b9c837ad2e@bugzilla.kernel.org>
Subject: Re: [Syzkaller & bisect] There is "soft lockup in
 sys_perf_event_open" BUG in v6.3-rc4 kernel
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu, 30 Mar 2023 21:39:14 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

(In reply to xupengfe from comment #0)
> And bisected found that the first bad commit in tip repo was:
> "
> 79df45731da68772d2285265864a52c900b8c65f
> perf/core: Allow ftrace for functions in kernel/event/core.c
> "

Hi, all:

I'm giving this bug report the inaugural bugbot treatment. It will create a new thread and send messages to the maintainers of "PERFORMANCE EVENTS SUBSYSTEM" (based on kernel/events/core.c reported in the bug). If it's not correct, please follow up and suggest a different subsystem that is responsible for this bug.

Best regards,
Konstantin

(You don't need to touch bugzilla to participate in this discussion, you can just reply to messages as if it were any other mailing list thread. It's possible that bugbot has a few bugs of its own, so please be patient and I will fix them as they happen.)

View: https://bugzilla.kernel.org/show_bug.cgi?id=217267#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

