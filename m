Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBC21FF41
	for <bugs@lists.linux.dev>; Mon, 18 Aug 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528187; cv=pass; b=O/5Uju/J+uF+ZJ2SuiMv7tQ4fqUTv+ilcaOgsP57qZRiP151MxOlaK6LnApz/Oyw+Ev33Csb8s4I4/JvKGXpJPhyUpbtD+6tanw+bZnDnCSxyVhhqWHWwLgzYNr8STv78e82wTf6R3cEFIjNJR+C8t3YIdIeXPQW8kqRnadRUV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528187; c=relaxed/simple;
	bh=PZw2Tu1tH3/gQd6qgFBBQxZ2fni1Fda4ZGlkzxnPfAA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kHH/BhT+OeN8YmkqgAFJ3s0zfi8juT/eKMUkqCkTMb4fYd4ILJVv1e1ntcROGY7zGPA893UaaxcIQNRLyJ1NM0YfM9GZV+gveYvUYjS2MJd6ldKaQ5Kuh9dW4FTxWXzCwKoJyol3CU8QG+1Ztk6/KZ/QJ5bNGgfqeof4AItwBsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=OZPfQyL+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="OZPfQyL+"
ARC-Seal: i=1; a=rsa-sha256; t=1755528180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UQELXUHU9grh1MQOj1NGaeoUI+nkaiZhPqsR/ULfhrUktrRGB9GTsxIX8MtJz886D3pJjU028hd4XO8Uy08HWJ+v4OgLLpdqQbfQZIA5Bm/RcWsqcgWJScPF6Qr8V8+zGub3BX4g5nV9UZfVn9F1sLOJz33plg+4c9oOXjQGZbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755528180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PZw2Tu1tH3/gQd6qgFBBQxZ2fni1Fda4ZGlkzxnPfAA=; 
	b=j8IUt2WrK4mP4J8L2xhto981pbprqK0HeRF11tzlXR4C9g48uRsbG5vm2CY5keB8bWtET732WbyJ2V3aIs1zZD12iRrCsN59X6WGIWD6ub12785EOo11pMAVxp+T+xnoI+ezdhrlKZ6tv1+WTfDB9htyCY66nF7rVCcbUAziUjc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755528180;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PZw2Tu1tH3/gQd6qgFBBQxZ2fni1Fda4ZGlkzxnPfAA=;
	b=OZPfQyL+E3WuJ0Y08nQNXX9pwSuLWc42JQu312jPMiC9o41nCye5H/+pYHCovja4
	N8xtuC2N9pBcWacauqJib9BA3RxEYjOTo3eI5xzK4Nko/qE/OX+SpMlYEq7nmJpXb0G
	SJRjKQ75BxWz3RHovQhbyA0V2xsWnKpKrXvL48OA=
Received: by mx.zohomail.com with SMTPS id 1755528177867952.1163424829272;
	Mon, 18 Aug 2025 07:42:57 -0700 (PDT)
Message-ID: <dfb0e47c755f2e055887c421b25dbcf575eb2dbb.camel@collabora.com>
Subject: Re: Commit d6e25b3590 breaks external video (HDMI) on mt8173
 (chromebook oak)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, andy@chernyak.nl, DRI
 Development	 <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support"	 <linux-mediatek@lists.infradead.org>
Cc: bugs@lists.linux.dev, granquet@baylibre.com, 
	angelogioacchino.delregno@collabora.com
Date: Mon, 18 Aug 2025 16:42:54 +0200
In-Reply-To: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
References: 
	<CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
	 <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Andy,

On Thu, 2025-08-14 at 22:38 +0800, Chun-Kuang Hu wrote:
> Forward to dri-devel and linux-mediatek.
>=20
> Andy Chernyak <andy.chernyak@gmail.com> =E6=96=BC 2025=E5=B9=B47=E6=9C=88=
2=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >=20
> > Kernel 6.16 has external video (both hdmi and displayport-over-
> > usbc) broken (black screen) on mt8173-based chromebooks (platform
> > codename "oak", device codename "hana"). Bisect points finger to
> > following commit:
> >=20
> > From d6e25b3590a0679bca1a1becc04e3999f1dfd461
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > Date: Tue, 15 Apr 2025 12:43:05 +0200
> > Subject: drm/mediatek: hdmi: Use regmap instead of iomem for main
> > registers
> > In preparation for the addition of a new version of the HDMI IP
> > which will need to share its iospace between multiple subdrivers,
> > and in preparation for moving out the common bits between the two,
> > migrate this driver to fully use regmap.
> >=20
> > Reverting d6e25b3590 with "patch -R" on top of 6.16-rc4 fixes this.

thank you for the bug report.

By reading and checking this patch changes, I found two modifications
that looked incorrect, so I sent a patch to fix them:
https://lore.kernel.org/dri-devel/20250818-mt8173-fix-hdmi-issue-v1-1-55aff=
9b0295d@collabora.com/

Since I don't have any mt8173-based board myself, could you test this
patch and tell if it does fix the issue (or not)?

Looking forward to your reply,

Regards,
Louis-Alexis
