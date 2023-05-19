Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C97F3
	for <bugs@lists.linux.dev>; Fri, 19 May 2023 07:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 641C2C433D2;
	Fri, 19 May 2023 07:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684480242;
	bh=hwde4HciUmdMwEjrQ9U5i75vdExkE0bt/hHunNXbgnw=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=JxBHYRcdPk6IHItjBky+4/VDJsJMIDLY5CmEWa7bfmU1J1w90UJEYp4wIEEd2eCcM
	 hmMV6xdDU6MQkI4H9VjblAeAGCTA2u7Q1vX07pPdo4ufrQiTiu5XGbULzHGKoil0rX
	 CpZ53i+vvLf6f6ULtUec6fXrq5w41zr0ysZFx90YPNG54nU3JZOEDYB1P7HFMHa2oK
	 WGqTYqqdzUTUUK6FrjBz1T0BT8ye62QvFVTH6mrHBwY/hDNDSNEUJHKS+YsPkEHENh
	 AVHXwd39+fJUgKrGwcE6hdC0402up7ieaAVWlu9coFxyO9NICHYj/5fc7Bf/f72Vj4
	 xwk5kB/anUXjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DD95C73FE0;
	Fri, 19 May 2023 07:10:42 +0000 (UTC)
Date: Fri, 19 May 2023 07:10:44 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 bugs@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-ID: <20230519-b217334c6-f82053afb53a@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: [PATCH] pinctrl: rockchip: rk3328: rk3328_mux_recalced_data:
 fix bit alignment
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider writes via Kernel.org Bugzilla:

*** PROOF OF CONCEPT ALERT ***

here is a fun and easy way to prove how broken the current calculation is using both of the bug reports i have made combined together

using a unmodified kernel with an unmodified dtb, take note of the grf iomux gpio2b registers, it should look like this

00000200 00000001

then modifiy the device tree, change the mode of the otp-out pin from 1 to 2 and then reboot and check the registers again, they will look like this

00000200 00000002

now if you've been playing along, you will be aware that the second 32 bit chunk represents the high-side of gpio2b, which is only pin 7, but otp-out is pin 5, which resides in the first 32 bit chunk which represents the low-side of gpio2b

you can try this on any rk3328 based device

*** PROOF OF CONCEPT ALERT ***

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

