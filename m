Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1626FA1
	for <bugs@lists.linux.dev>; Mon,  3 Apr 2023 14:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C60D1C4339B;
	Mon,  3 Apr 2023 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680532140;
	bh=1GAeGiLzhhg9kO9BbA811P7zGVpfnCMRVRii0AxeKqQ=;
	h=From:To:Subject:Date:From;
	b=MH3nQOGVHHF/LLX793XZR2UbS8RvP6CbYTCYlyXRjuYh0PBfeLB0ig6XqkGJOpOou
	 g4yAvZJqtD8BSbrkMS/we0saSak093BC55b7MwrvC4Otj9eafvzIAQgDeYhXa7WZQ/
	 fKGkVjYDwmxc06njPSMhy8QuNFSH+xlVyNh8oZ6LaSu3i5Xhyl3EXk6hKGvYJakP5Y
	 lmCqVhGPb/cfvgoophV+sfbNxezZ3v2QLlkwyQK2b+hfooFictLo0fCvYR0ANg2Gro
	 rGFmW7VDu+t7nABnsoTlZTyE3xa8xLtiPQugjlj8Elg1teIieaR/IBiLFRnwPQiCIW
	 cw0VUuupk9YOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A30ACC41670;
	Mon,  3 Apr 2023 14:29:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-kselftest@vger.kernel.org, shuah@kernel.org, bugs@lists.linux.dev, 
 skhan@linuxfoundation.org
Message-ID: <20230403-b217293c0-1e5391e4b7f5@bugzilla.kernel.org>
Subject: Kernel panic, CONFIG_FIPS_SIGNATURE_SELFTEST, missing dependency
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Mon,  3 Apr 2023 14:29:00 +0000 (UTC)

o6irnndpcv7 writes via Kernel.org Bugzilla:

Hello and good day!

I think I found a missing dependency.
In case of setting CONFIG_FIPS_SIGNATURE_SELFTEST, CONFIG_CRYPTO_SHA256 also needs to be set. But not as module.
Failing to do so results in an early kernel panic during boot. 

Tested on linux-6.1.12-gentoo and linux-6.1.19-gentoo.


Thanks,
  sephora

View: https://bugzilla.kernel.org/show_bug.cgi?id=217293#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

