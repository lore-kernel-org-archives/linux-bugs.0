Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD97FC
	for <bugs@lists.linux.dev>; Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9513C433D2;
	Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680683100;
	bh=y/wyS1wybskgY3NT3qvYlhAj/QT7MG9Mf7/tNstaFbg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tEWPde6v5O5Fpb4rSsKWNahmteWdXVmcqIQnoQ4mWFU8EFg3tjnBCjePa1W7YfFW1
	 wOtRDKzzA2vvHSG3hWLcBuWa1j6twfuBpFNOpBfrHcV4poYkgnmaqFOvsfD/spUBv0
	 HC96N8MlsNxk8fVQMucVjiOXEd6c3cwfAN0A/juTC4NR7Ix4U5vCRTbymXQMnhf6mG
	 YcSEWkR+Qoj2frXvxKZz5ssWroCV0jQnIAzq3yB/ZSWCVgan22KJzIRrZQsrqyEfKU
	 ksblnsJxWJ36GRTMQsVgLwTN6BffEL4AdMMU/J4dfwpVvwWpy4RJBB/LkiHwF62Te9
	 Q4n8GwxFFFoOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B9FFC4167B;
	Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, linux-wireless@vger.kernel.org, 
 quic_msinada@quicinc.com, ath11k@lists.infradead.org
Message-ID: <20230405-b217299-ec3c4e9b0c8a@bugzilla.kernel.org>
In-Reply-To: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
Subject: Re: wifi: ath11k: push MU-MIMO configurations to hardware
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Wed,  5 Apr 2023 08:25:00 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217299

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

