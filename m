Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90521F94C
	for <bugs@lists.linux.dev>; Fri,  5 Jul 2024 04:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720153814; cv=none; b=c4a3kVuxGL9IWXOeUrxq6KAldMmbIvPH8585ksUhO6gKmXpoL2Shn+VTNQ+sNdCUDe/zGKTTNnU74t4gldwKlSjnmVF0Z4Grc7WDTT1YQg7fyKNPtJcu86LDbp8sC3BN89vM+gWgrHsLw9tWQ3pZXX3DCED3n7OgfEgsCkkZWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720153814; c=relaxed/simple;
	bh=YaiCw5CY4r8pXM3kxE0waLspkOpuDbbx9IcNWMWxYY8=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=gPqMTAnc+EW+J1onBgqYULQ5rsdtdaAkBv4R2FI6EXhxsFm2tXwVCpiD9+fj2ho/9YFSPebaWEkBta/9RSpK3TPAHOr0XAYEQaPvSJwqfUCQ+xrP2B5Q/ad9PoO1vjvrTZv1hRFr5syxml7UnbVk7t+nkGHAWMlpTSpX2+fRTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEvdoToF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEvdoToF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FFBCC116B1;
	Fri,  5 Jul 2024 04:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720153814;
	bh=YaiCw5CY4r8pXM3kxE0waLspkOpuDbbx9IcNWMWxYY8=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=YEvdoToF9z5R5UJeDfvRiowmNy2sZnRY9593f96PSduxoAx0JsuYAyMYhGvWDZftn
	 o12a+N7h8gL8splK662P0HjRD1v1tV3B+CQoXRTRvkz5AK63XVH7gCmVN5KWMAXwn/
	 PrcHBXPAFvFp1SedFcviLd7LvHtbkAPX+g6e9d78rDsC9MYrqTgBvLy2+WXueyfgqS
	 cGkA9o9lrtCK97M6zNB3A2wjfKBk0wF6HQy0ou+0ttkn5YyDg6Frr6ssGtk4iEe++b
	 nUL9MGHZUl4dnareHAjj+JSzdikK2vliziQVMQ1+C1snAC58ny3F+/OvMBLw7TgUp1
	 3sn5DOp124y/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 436CEC43446;
	Fri,  5 Jul 2024 04:30:14 +0000 (UTC)
Date: Fri, 05 Jul 2024 04:30:24 +0000
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
 linux-rockchip@lists.infradead.org, bugs@lists.linux.dev
Message-ID: <20240705-b217334c13-13d1a8cd7c07@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: RK3328
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider writes via Kernel.org Bugzilla:

thank you Huang-Huang Bao for addressing this problem better than i with commits
commit e8448a6c817c2aa6c6af785b1d45678bd5977e8d
commit 5ef6914e0bf578357b4c906ffe6b26e7eedb8ccf
commit 01b4b1d1cec48ef4c26616c2fc4600b2c9fec05a

GRF_GPIO2BL_IOMUX: 00000600
 2b0 | 2b1 | 2b2 | 2b3 | 2b4 | 2b5 | 2b6 | res
00 01|02 03|04 05|06 07|08 09|10 11|12 13|14 15
 0  0  0  0  0  0  0  0  0  1  1  0  0  0  0  0 
GRF_GPIO2BH_IOMUX: 00000000
   2b7  | reserved.............................
00 01 02|03 04 05 06 07 08 09 10 11 12 13 14 15
 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c13
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

