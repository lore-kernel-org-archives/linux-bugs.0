Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E479882F
	for <bugs@lists.linux.dev>; Sat, 22 Apr 2023 21:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC7CC433EF;
	Sat, 22 Apr 2023 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682197722;
	bh=0/t8qdmuIyeahzMxwLfNy1xLI4yMxcsuUOWqyPFUa3Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Yv5Xf0GQqKPrzJxXORHRvPay4fFytxwoj1RphJ8S2pbMu3WF68Qo/zElgS+USi97J
	 M1SoqMeV2Th59wiDpInFOPO60O6yIW/ZBFcY42Y5mZHLsN4edk+mZPkpIEnhCqgBvi
	 7EoOd/Wm/ZzLCywQZFoCtbk2pdpbseX3kpYRGDpeFXU9z+/cq7OhAzdcjigWpHmxNt
	 BipS1yVTir5/qkiHi1aVS8x70jlDG5/AvqXrKOq5OBkzIS9y99A9rd7XZQiP5JZpB3
	 5aIJE4BxtdF54c0rdOa3hkqU3W4T4x7OyD92SnQLEkO54pVjOaCPRKy+GJUlng6ghw
	 UkLoSLulCugMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 132C6E270DB;
	Sat, 22 Apr 2023 21:08:42 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 bugs@lists.linux.dev, linux-rockchip@lists.infradead.org
Message-ID: <20230422-b217334c4-6b3d3388d529@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: rockchip rk3328 pinctrl overflow
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Sat, 22 Apr 2023 21:08:42 +0000 (UTC)

antwain.schneider writes via Kernel.org Bugzilla:

to try to make it clearer, gpio2b is marked as IOMUX_WIDTH_3BIT

GRF_GPIO2BL_IOMUX
2b0  2b1  2b2  2b3  2b4  2b5  2b6
[xxx][xxx][xxx][xxx][xxx][xxx][xxx] 21 bits without recalc
[xxx][xxx][xxx][xxx][xx ][xxx][xxx] 20 bits with current recalc
[xx ][xx ][xx ][xx ][xx ][xx ][xx ] 14 bits with proposed recalc

iomux sections are divided into 32 bit registers with 16 bits for values and 16 bits for writing, without the proposed recalc, there are just too many bits

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

