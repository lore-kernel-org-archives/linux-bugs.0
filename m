Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0F290B
	for <bugs@lists.linux.dev>; Wed, 28 Jun 2023 09:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41714C433C0;
	Wed, 28 Jun 2023 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687944050;
	bh=xbdGpsaqMy0AVC0EOgunhe2acN7Vu4AxdSX7S3FRUiU=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=g0474YINv3uDNdTbUo8X410vhgAJgPveL++ZAIQAGYaQahMVt8WBpPwUwuRkyVpAN
	 r0CqLPPLWS/AiYEO2DYT6WPFNhGTDX7T625lXQ4PAarDHlta7fro6CvE64IKMXomld
	 D2cV48Cw4UYN5yq8VqXCG4ogo3vclUz8HF/YW3zbdTxQ3UGAq6xEkzrXiQWdJ/g4HZ
	 69KYCgWqKz8nJ2QNH0Sgo3GwiPYC4aJsAjkn/IpaTqoO8zBlNsT6THyotnEsiydwRu
	 bhX+Cf6FS6dmTpvpxoIS+9xTkzF4RCuL+HkPRI7nGw1QjQ3Ow6XgwliDk4gkYpI/As
	 QGXTZjlhx4rvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20613C41671;
	Wed, 28 Jun 2023 09:20:50 +0000 (UTC)
Date: Wed, 28 Jun 2023 09:20:54 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-rockchip@lists.infradead.org, bugs@lists.linux.dev, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org
Message-ID: <20230628-b217334c8-e0d65189aaa7@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: rk3328_mux_recalced_data OVERFLOW noncontiguous CARRIED bits
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider writes via Kernel.org Bugzilla:

for the uninitiated who want to join in, the trm being referenced is here[1]
and since this problem is directly related to the rk3328, other vendor kernels have adopted the related changes, for example the firefly roc-cc kernel[2]
i can't imagine why this bug is allowed to remain open leaving many people unable to experience the joy of completely functional gpio2 b4 and gpio2 b7, unless you think the pins work fine as-is and commiters are randomly applying code to forks

[1] https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
[2] https://gitlab.com/firefly-linux/kernel/-/commit/d69af8ab6534bb28c1556076f08d2a5ab4935d95

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c8
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

