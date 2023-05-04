Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6910EC
	for <bugs@lists.linux.dev>; Thu,  4 May 2023 11:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 122CFC433D2;
	Thu,  4 May 2023 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683198072;
	bh=GCbNqsULn4kqqYRz3TpLCrpoIO7DZgrmGlreBxukNAU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QYZScNZE2jnTGBHkTp5H2tFb1Vz3Q4iiQO8X8T1J238/Kx1/A6wRVzRJZF2hcMONu
	 kbWfqQ56xdAcpemfI/6UWfnXlXSoyMpDfIgYZtZ+5IhIBe/XApjmt1NiXfk2XTyX5/
	 kDUXPM7wbL71xiWfVdIkv0s5MP3YWcUlHk4dX66K8ZGyWfkKgNSiz30+gRHvVSrx37
	 1XTYnxk46BL6MMbskn66JV7ggzb2JiLsqQRKTyofzlnTuS+sPDdwbzOcMjStYyqVcz
	 UHJPPuInK0zoTfAlKoSHxOgd4GmShRC50LITWf0FKcZBO1JprgvoOWmdnIGUSaaP8s
	 pQozNynB1F+vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0211C41677;
	Thu,  4 May 2023 11:01:11 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de, bugs@lists.linux.dev
Message-ID: <20230504-b217334c5-347147dfa102@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: [PATCH] pinctrl: rockchip: rk3328: rk3328_mux_recalced_data:
 fix bit alignment
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu,  4 May 2023 11:01:11 +0000 (UTC)

antwain.schneider added an attachment on Kernel.org Bugzilla:

Created attachment 304214
both parts of the recalc in one handy patch

david wu's original patch lovingly restored for modern audiences

File: pinctrl-rockchip.diff (text/plain)
Size: 1.61 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=304214
---
both parts of the recalc in one handy patch

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

