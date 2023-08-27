Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C17EE
	for <bugs@lists.linux.dev>; Sun, 27 Aug 2023 14:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EED6BC433C7;
	Sun, 27 Aug 2023 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693147952;
	bh=MgBcWTI2qHDrMRniSgygeVVCKzAF2WYi55HRvxRrsus=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=dLOqAaIRqk09KId/1MMIQ6mePKgERkTSRBn8RXiIC2tGB3Jg0BPGKd/8MTlkXkXuB
	 8VdDtCijdIJld8tPhUHCa5TE8Yg0ad8W/pGOwq85dQ2MWyu7h1YJ+U8/d9fjm/5Ef2
	 DEsx0I5fJFlTLenDf+xfuYui8JSRozafioMm+DJJ+vjc16SXkDyB8fzlDbU6o0X2NQ
	 OgzuGm0cFdxEOjKHylkxnDWcHQqmKzVJ67rSbKqEW3EiwshGyv9UYYy1ss8l7I7raB
	 7TllaST5Cih/1BkBeVI1CynKcnCjiOqYv/wviQk7NdDWiDy1Gn2rA1MWvg8wQ875Lt
	 Ex+NTF6L//9Wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D11BAC595D7;
	Sun, 27 Aug 2023 14:52:31 +0000 (UTC)
Date: Sun, 27 Aug 2023 14:52:37 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, bugs@lists.linux.dev, heiko@sntech.de
Message-ID: <20230827-b217334c9-6a3f67a0880f@bugzilla.kernel.org>
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

for more than 6 years pinctrl had been mishandling hardware preventing usage of gpio pins

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c9
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

