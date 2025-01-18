Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456D273F9
	for <bugs@lists.linux.dev>; Sat, 18 Jan 2025 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737218685; cv=none; b=hMgg6I2ZT2CbAetAlEjnXP/B8x0zA6hyFaQWrT/vav9/xnrygpYrB/qj56eAA1Ki4ONFKh3Sh3hxBm6e22+95Lc+xQVtqAdRWFMPGieOrFJZ6rS3DWBj+PbRNGliLhrTo200TtthVd0dWIqr4wSGQT1yX2KgBHK5ccuuS4PK/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737218685; c=relaxed/simple;
	bh=xEJNQ7UCENEVxsF0BiQrTaWFQl57AAQDyq63yXkGmNo=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=GeTgo6L8Qq2Z8+mXk+f4gzfJwOKKh8na6cyMt5kI93ZRn6pQUc9k/U9ajTkOSl+5zfdMIoM+grcVrVjIbXxcka89kOoQLri4/bzxlSJMGGFHncS9ZtcJlb+8p19xFQOGwetmzdqSJKikH21RU/SZJK9KiLTLzcYwTNN4U8TKLiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpkUkkNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpkUkkNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE501C4CED1;
	Sat, 18 Jan 2025 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737218684;
	bh=xEJNQ7UCENEVxsF0BiQrTaWFQl57AAQDyq63yXkGmNo=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=FpkUkkNqzIsITa81O0crZIsEKz97Fyod1mxFlN3uo6c+wSKKfonbTQ7wTesNFIGLt
	 J0G5XXp5Lr+CiKa2EgnDQ3a+40XK7rMVczL0602M0GRp7CVDdAziC67vfCXNdgMFQB
	 mEDXN6KBJ6fVv2eP+aCWlwrBcbF8B/G7IFKajNDnwUzNvVNGigdH20+VJrAZru/PmY
	 7gohkQZtXMN+jTHS868X6ymjgJdIfIkSilRop7DFcwX8MB2VyRbORp+63Epu18PP3D
	 DlyWGrRqig2gTwztJHo26LyAcfl7fZoqT9eUCFYuQru+s+gcfaD0BlTWKZDXAnpsPg
	 s1BfnmCTl1zsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77861380AA62;
	Sat, 18 Jan 2025 16:45:09 +0000 (UTC)
From: "antwain.schneider via Bugspray Bot" <bugbot@kernel.org>
Date: Sat, 18 Jan 2025 16:45:18 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: bugs@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, heiko@sntech.de
Message-ID: <20250118-b217334c14-2acb03f84910@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: RK3328
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

antwain.schneider added an attachment on Kernel.org Bugzilla:

Created attachment 307504
as best a detailed list on the actual gpio modes for rk3328 socs

for the sake of completeness, a small program to dump the states of the grf iomux modes for each gpio pin on a rk3328-based system, even though some gpios don't exist, it keeps the output aligned

File: poc_4.3.c (text/x-csrc)
Size: 9.16 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=307504
---
as best a detailed list on the actual gpio modes for rk3328 socs

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

