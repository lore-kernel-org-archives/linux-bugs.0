Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0628C3D
	for <bugs@lists.linux.dev>; Wed,  7 Jun 2023 11:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86B9BC433D2;
	Wed,  7 Jun 2023 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686138919;
	bh=jI5O/m49Hs5eYdLlonYqsERbFwXIPFIDOcbNwUC1NFQ=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=WL9RbN14w9xole2MAxmKk8FGVJMJ71JBCsaXkJSpgqbzi369G1VzjCwInDbCqLPkr
	 uKfEFAOn7KLLYBY8wsYtvTzDFoaR/T5JeNn3TmYX12F/QsRjJk4/6qz/bR10EnZqWD
	 7zAJpFyn82NcgmBLiydAq6wax0YnkI1jty1ngf4vK9uocchk7l91m8HqAPZ8nE0Za4
	 5obE6sFw57oaiOvEvtA77Ufe8ZWcCovVXX3Opx+HS+vBiR7wvASpm/fZ/nZxwaxjYp
	 fGmTcG0SRfNIFgBgXJWSQ6OBmI84O6Iidfs+MS/EMr6Q9SIW+eZpPhmAMIGcPQ0sVn
	 NsGxXgETLgckA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62496E29F39;
	Wed,  7 Jun 2023 11:55:19 +0000 (UTC)
Date: Wed, 07 Jun 2023 11:55:23 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Message-ID: <20230607-b217334c7-66c68c14b31f@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: https://bugzilla.kernel.org/show_bug.cgi?id=217334 arm arm64
 aarch64 pinctrl rockchip rk3328 rk3328_mux_recalced_data bits overflowing
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider writes via Kernel.org Bugzilla:

in hopes of making the problem clear, i will attempt to make this as understandable as possible

firstly, i was using a tool to read memory locations without making it known what it was

ma, or memaccess is available on github katsuster/memaccess

also i was using bcm2835-gpiomem from raspberrypi with an alteration of the device tree and udev to allow unprivileged access to poke memory values without root

github raspberrypi/linux drivers/char/broadcom/bcm2835-gpiomem.c
github RPi-Distro/raspberrypi-sys-mods etc.armhf/udev/rules.d/99-com.rules

--- ./orig/rk3328.dtsi
+++ ./rk3328.dtsi
@@ -281,7 +281,7 @@
	};

	grf: syscon@ff100000 {
-		compatible = "rockchip,rk3328-grf", "syscon", "simple-mfd";
+		compatible = "rockchip,rk3328-grf", "syscon", "simple-mfd", "brcm,bcm2835-gpiomem";
		reg = <0x0 0xff100000 0x0 0x1000>;

		io_domains: io-domains {

or alternatively put

fdtput -t s rk3328-rock64.dtb /syscon@ff100000 compatible "rockchip,rk3328-grf" "syscon" "simple-mfd" "brcm,bcm2835-gpiomem"

but in order to make this more accessible, i realized i should use something more generic and familiar that requires no modification, but requires root access

openwrt packages utils/io/src/io.c

for the sake of transparency, i will with great granularity go over everything again with both of these methods and instead of showing only GRF_GPIO2B{L,H}_IOMUX together, will also show them in their individual 32 bit sections

so currently, with a mainline derived kernel with unmodified pinctrl-rockchip, by default you will see these values

% ma -k /dev/gpiomem dd 0x24 8
00000020  -------- 00000200  00000001

% ma -k /dev/gpiomem dd 0x24 4
00000020  -------- 00000200
% ma -k /dev/gpiomem dd 0x28 4
00000020  -------- --------  00000001

# ./io -4 0xff100024
ff100024:  00000200
# ./io -4 0xff100028
ff100028:  00000001

# ./io -l 4 0xff100024
ff100024:  00 02 00 00
# ./io -l 4 0xff100028
ff100028:  01 00 00 00

section 3.3.2 of the trm defines the reset value for GRF_GPIO2BL_IOMUX (0x24/0xff100024) to be 0x0200, and looking in section 3.3.3 at the layout of the mux, in binary with assignments:

resresres2b4reserved---
00 00 00 10 00 00 00 00

gpio2b4 is explicitly defined, with an alignment of 2 bits, while every other bitfield is reserved, but elsewhere in the trm, other pins in gpio2b are defined as existing
in the trm, section 20.5 defines 2b0, 2b1, 2b2, 2b3, 2b4 (again), and section 19.5 defines 2b5 and 2b6, all making clear they have 2 bit alignment, assuming these are true, this would make the bitfield layout look like this:

res2b62b52b42b32b22b12b0
00 00 00 10 00 00 00 00

all of these fit cleanly into the first 16 bits of a mux register, where pin modes are defined

so it's odd that in rk3328.dtsi, gpio2b5 is in use and set to mode 1, but it isn't reflected in the bitfield, so let us change the value and see what happens

--- ./orig/rk3328.dtsi
+++ ./rk3328.dtsi
@@ -1274,3 +1274,3 @@
			otp_out: otp-out {
-				rockchip,pins = <2 RK_PB5 1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB5 2 &pcfg_pull_none>;
			};

and reboot and check values

% ma -k /dev/gpiomem dd 0x24 8
00000020  -------- 00000200  00000002

% ma -k /dev/gpiomem dd 0x24 4
00000020  -------- 00000200
% ma -k /dev/gpiomem dd 0x28 4
00000020  -------- --------  00000002

# ./io -4 0xff100024
ff100024:  00000200
# ./io -4 0xff100028
ff100028:  00000002

# ./io -l 4 0xff100024
ff100024:  00 02 00 00
# ./io -l 4 0xff100028
ff100028:  02 00 00 00

the fact that changing the iomux value of gpio2b5, which if section 19.5 in the trm is to be believed, part of GRF_GPIO2BL_IOMUX, is clearly modifying the value in GRF_GPIO2BH_IOMUX, of which according to chapter 3, defines only one iomux pin, gpio2b7, beginning at offset 0, clearly indicates that bits are being carried in this current calculation and is wrong

the reason for this is that in pinctrl-rockchip.c, rk3328_pin_banks sets gpio2b as 3 bits per pin (which gpio2b7 is), and while rk3328_mux_recalced_data takes care to realign gpio2b4 as stated in chapter 3, it continues to assume every other pin marked as reserved is 3 bits

the patch in this bug report addresses this, adapting the original submission into the current format for recalculation
if anyone has any questions about this, feel free to ask them here
and also i don't want to keep recompiling the kernel, so please commit this!

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c7
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

