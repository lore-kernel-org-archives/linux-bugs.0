Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A46311F
	for <bugs@lists.linux.dev>; Mon, 29 Jan 2024 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537712; cv=none; b=HADcRDhAVi9s8mpwVOohwG0IUhyTQsLL0Q9fex1OzwfP5C5JVcHeksbBrojtks+Nf+Et/829Dnf9g9DXqT3ytsnPIpFs9x+MPDSZzmoVzlAH+zJFR5d0K/IAcK6GtKnuQdSNqryt/M1oNKJbAhTZAj8BxMNqhxRU3zC1ypudyQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537712; c=relaxed/simple;
	bh=vr3DMYp4IS30j2TMZVX5H2vM2Q0pXkhh7UDGjQYWSu8=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=hoJW0x3CI2HN9c24NJfX4IOqulDjXWSKIQCRs02RG63sFnu2JZknDzycy0PzoZQQ7UEg6X/oS+n/ZySUmvIox6ZPvvB5nCaMMOQbmO03WcuhnopHRlUtL4svbm9YBXt3iUYf9tSfxCvzH9H1cYYM3abcpmyiOET185k1m6bC7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mcvz1uzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mcvz1uzL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E110C433F1;
	Mon, 29 Jan 2024 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706537712;
	bh=vr3DMYp4IS30j2TMZVX5H2vM2Q0pXkhh7UDGjQYWSu8=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=Mcvz1uzLPM5QiA5FAOblFeRfoOuE2rbkuhqWMjuzb1s8GL/WMVcjeS5WHlAhqyDgP
	 +oAF0HYqF3KTl64kInbrIaWBACD7f4WZDXQ7xGtO5vS2UpNMUrqcIOA9+KdeSO9JDS
	 PyZv7oK9dh3u3It506q3blwLBFmpXFmcghXvhs5ckCB1KpLpIzJh87AM85VZWlwoUO
	 AX8y73l0xvO9RdSwWQlhTREw6ldLqViFLd2dHJDo7S1e61vmXCunbX6/Hc2fw1NSSn
	 qXxNAK1JNmMkXDAjiN4K9WylJJ+OVsiIJounBmym8wtOcw1+Ty3LJCfoe/61178kra
	 cEWT5j6I7Iodw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2677DE3237E;
	Mon, 29 Jan 2024 14:15:12 +0000 (UTC)
Date: Mon, 29 Jan 2024 14:15:18 +0000
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
Message-ID: <20240129-b217334c10-a8e85a2041b0@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: linux rockchip gpio2b4 (gpio2b5) gpio2b7 broken
 GRF_GPIO2BL_IOMUX GRF_GPIO2BH_IOMUX 2bits 3bits pinctrl
 rk3328_mux_recalced_data (a fix exists, for a commiter brave enough to
 commit it)
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider writes via Kernel.org Bugzilla:

ping

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c10
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

