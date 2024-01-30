Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571837992E
	for <bugs@lists.linux.dev>; Tue, 30 Jan 2024 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706640913; cv=none; b=lHGEz2qrlWzgLuHxpUmM+yuTz64tYAEGN2p8414v3PypDt8Cg3d4SV72Ks0CzvcbjwYC+xxB7FLRk68Ia+t0TaYYBWeuXcUXr+jz2Pt5S1gt7FlLx6SReAAyLa5TioM82e+GCCo2xFGIILONPydfkBBR/gI0Mrmna4ya95bfwJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706640913; c=relaxed/simple;
	bh=Rlj0+pg0eQe6xEIGarik3VfV6BkGvMIJifXOEhioQkg=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=YDW7vZZLprgXgGicYXUBDkcr/0KCo2rIb9YOGo6d0Z592ZKxyCTgzaZDkRNoxmc7PxouLNVmzmjnNtrc2bZ3YCm6Ra4JasCW+/EqG2GG+a7TvXcx3WzGCcBrLEha4st6n0rWi2JpjKcwmGbEtLpWDQ5dC6rM4/zglmYaMUdEscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn6fEUXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn6fEUXa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0055C433F1;
	Tue, 30 Jan 2024 18:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706640913;
	bh=Rlj0+pg0eQe6xEIGarik3VfV6BkGvMIJifXOEhioQkg=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=Hn6fEUXaEH8GXha87QDzSHp+D+xYBfRxdrxWGX8XMMOXs+GAsz9eVcKa2IcWAGZBB
	 nJCYiDbdinjb22uZdGWdxQpdW2pzm7Q0zQezyECai7rZQEXvqQL35L5ySqDQHEWZRW
	 LceilFmEIc3H/dFHCI0+6xMUpY0uPC/UEQY2z5OZBWK2Dvgu7dGP2jsj4XuitTVGd5
	 KLExS/LJnNmEEZc9JlcRmVTnPNhraolk7KqYwinhyXOZZR7qwwz1WoHc31oBOciytA
	 Mn9QqB8w5bcyz6gv7DSyZcxEgZyBM6T8TL1rjm4HINtiGuSRGGDhoPhi/Sl9O5FmxJ
	 EY2fdQ02hdPMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5E58E3237E;
	Tue, 30 Jan 2024 18:55:12 +0000 (UTC)
Date: Tue, 30 Jan 2024 18:55:19 +0000
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
Message-ID: <20240130-b217334c11-7182e5f921f4@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: linux rockchip gpio2b4 (gpio2b5) gpio2b7 broken
 GRF_GPIO2BL_IOMUX GRF_GPIO2BH_IOMUX 2bits 3bits pinctrl
 rk3328_mux_recalced_data (a fix exists, for a commiter brave enough to
 commit it)
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider added an attachment on Kernel.org Bugzilla:

Created attachment 305795
a program written in c that can be compiled and ran on a rk3328-based device to illustrate the problem which is bad

this program dumps the bits set in the grf for 2bl and 2bh

in comment 7, the otp-out thing is still vital to prove this point without extensive dtb modification

i've got it down to this
fdtput -t x /boot/efi/rockchip/rk3328-roc-cc.dtb /pinctrl/tsadc/otp-out rockchip,pins 02 0d 02 5a
what's being changed in this line is the mode (from 1 to 2) of gpio2b5

otp-out in the rk3328.dtsi is
                                rockchip,pins = <2 RK_PB5 1 &pcfg_pull_none>;
which when dumped by dtc is
                                rockchip,pins = <0x02 0x0d 0x01 0x5a>;
0x5a is the phandle for pcfg_pull_none for me currently, your value may vary
notice that it's using gpio2b5 which exists but doesn't have a listing in chapter 3 of the trm but is described elsewhere in the document


1 run the program and save output
2 fdtput the dtb and reboot
3 run the program again and compare outputs, and notice how the completely wrong register changed

File: poc.c (text/x-csrc)
Size: 1.53 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=305795
---
a program written in c that can be compiled and ran on a rk3328-based device to illustrate the problem which is bad

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

