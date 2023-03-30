Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF010E7
	for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 20:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FC40C433D2;
	Thu, 30 Mar 2023 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680209915;
	bh=u+NddLtvWqGoe8icKCzKSeS1BJ41nASCQDaDreHzwIE=;
	h=Reply-To:From:To:In-Reply-To:References:Subject:Date:From;
	b=kOtdeRNVddk4AQN966NnNBXh/syBdqX/px0xRVQofxYnMYOLi9HWhnOc2IT1qCf9W
	 08ZRZpDBtif3uXpHK4Yomp2yQCAuBeHA6235HC7T0LmpzbY+2L9d/kYM1TnczlsaHt
	 /rLJ75jgVus1m/S2p4gfhYojmu5TERXAD7m1Ds/WQp4cAh9PCbILGlgW64daYuqgRM
	 WMwmm24ZW8k7q9rKHXxn7Fd4KswV406Hr+qI8IaVttToOvk2fDHzz5Aqu9NdI9vl9K
	 rBuZyP2wbE9feMTnklO2EgAlRTWm1IvozAQ6tUmsi/vcaZQ18rzmqGOozox4RcLzbI
	 k/OwcSAOWjObA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B2C5E2A03F;
	Thu, 30 Mar 2023 20:58:35 +0000 (UTC)
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
To: mricon@gmail.com, mricon@kernel.org, bugs@lists.linux.dev
Message-ID: <20230330-b217274c5-dbef58101a2c@bugzilla.kernel.org>
In-Reply-To: <20230330-niece-fled-173b602dd253@meerkat>
References: <20230330-niece-fled-173b602dd253@meerkat>
Subject: Re: Test bug for flag setting
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu, 30 Mar 2023 20:58:35 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

(In reply to Bugbot from comment #4)
> This comment was added via replying to the conversation.
> Bugbot should find it.

It did. Now I'm replying inside the bugzilla.

-K

View: https://bugzilla.kernel.org/show_bug.cgi?id=217274#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

