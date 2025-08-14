Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADB1C8604
	for <bugs@lists.linux.dev>; Thu, 14 Aug 2025 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182260; cv=none; b=OXSIxe0frc6l0VomVW1WIeYDhD7EhAvM6ou5UTIOabomVnq5GATmxGr1NO3q0voKwJrQUO6iJhtJ85lXyLuxqyHyKTyQ+8+qkYkRZMUUdnwZ3HvTcAIvEiq7fB5EgczlS1lnvhyH3RXVOXC/kPn7irw9W4V6RZJqSs72GcTTd1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182260; c=relaxed/simple;
	bh=6LgA7GylOuPlAE7lu79YVHTi8yuQPdLDmvIbvtSdQ2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sY3LjXVj3Z1Q9fNTldKBvx2y4cT265tZ98s8aRj6nrzZiSG81EJ2iURjy+te31OQE5971E+yH/xnNb9b3FB6l2pDFJBqetqD1LJKjFqASIm1a3r7NYneJ1N5MMsU/WL5tomfwI8sgQVdrDGutT/3ENJXXVcjYyedlsiA5OPiXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYEHhZwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYEHhZwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF98C4CEFA
	for <bugs@lists.linux.dev>; Thu, 14 Aug 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755182260;
	bh=6LgA7GylOuPlAE7lu79YVHTi8yuQPdLDmvIbvtSdQ2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dYEHhZwaqTvn+JVB6mm4v9XaReY5rHpHmGQOFf8SYbT89bKc7TEtkfLobwZgPwsTh
	 Q8mqteXVXaJIxHbtt3D7w6SLYe2AtH57BH7/ZTAChtlHIaZ5ZBeR1674ZeuNCmKJom
	 Y+mUmJ+7IfSe9+4ltrzqRmXIzvBZ5G1tk5L6osSysjTx2BiTfahYO3OjaiEzLmaXWO
	 TfBMWsMCKqATB3RMznmnAFbtMkM6ABopqhFGae7zzeXfHKYdAi5yA3NpykFWbOcfkH
	 hGesiqofVm88KmuqipturUX6w3ZOPTZNaWGeSkpnk3DfDuK1kvI6KVx3e2DCNMMXbP
	 QCrDE8Tz1qIuA==
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47174c3817so650064a12.2
        for <bugs@lists.linux.dev>; Thu, 14 Aug 2025 07:37:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YysT/zoj5ksMP4yn1Pc34G0sI2lur0bim2VHs+9MMGhfcE5GlKk
	ZXDUp6rDY+F7ZKd3VRkn6kVsF0u2CTXCO6kKm/nH1XAkX+l0tiQP6hdaMXCgiwtMIHudo6eydOL
	5fXHtyDrZnbUFx5UPd1FmnJuFtf++2Q==
X-Google-Smtp-Source: AGHT+IHS0uaP7CItqCto1gKq+ALdXQ8qoYfqn/fWbxiMih47HHTXn0CntaSCOaendxQ0HffHBSsodaKc4ysKqNiLXYU=
X-Received: by 2002:a17:903:2ace:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-244584afbb6mr45180395ad.10.1755182259487; Thu, 14 Aug 2025
 07:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
In-Reply-To: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:38:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
X-Gm-Features: Ac12FXzl572Bk8E1YjFThAkpLtwFo2QIH4KQyj4nJ4VDeDrZEEqFg_h6oT4-G7M
Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
Subject: Re: Commit d6e25b3590 breaks external video (HDMI) on mt8173
 (chromebook oak)
To: andy@chernyak.nl, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Cc: bugs@lists.linux.dev, granquet@baylibre.com, 
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forward to dri-devel and linux-mediatek.

Andy Chernyak <andy.chernyak@gmail.com> =E6=96=BC 2025=E5=B9=B47=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Kernel 6.16 has external video (both hdmi and displayport-over-usbc) brok=
en (black screen) on mt8173-based chromebooks (platform codename "oak", dev=
ice codename "hana"). Bisect points finger to following commit:
>
> From d6e25b3590a0679bca1a1becc04e3999f1dfd461
> From: Guillaume Ranquet <granquet@baylibre.com>
> Date: Tue, 15 Apr 2025 12:43:05 +0200
> Subject: drm/mediatek: hdmi: Use regmap instead of iomem for main registe=
rs
> In preparation for the addition of a new version of the HDMI IP
> which will need to share its iospace between multiple subdrivers,
> and in preparation for moving out the common bits between the two,
> migrate this driver to fully use regmap.
>
> Reverting d6e25b3590 with "patch -R" on top of 6.16-rc4 fixes this.
