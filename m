Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B41D0416
	for <bugs@lists.linux.dev>; Wed,  2 Oct 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875397; cv=none; b=uqhqnpIdc+a1jC6OEsMt8Dt1OrdAYqNQ7R8yyJKKMn4Xexbe2oFTzk7EgbQN08geT0CFwYnwTLypWY6XwHM4KwJzYzkm5P/r++xr9cDVE252T/kPtcc61UjUnmjr7n89I8DkFe0V2As593xnWOjdYMfzkHOr8PzRxKy/7O/nBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875397; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EAPfHJ3GvE6GMWC68G0YwsncHwx1qUFoMMFhCQBtB7Hjq2ijlTxIOJlQvcd/fFr58jPiYFjAmUBrrf0zDAeh66ce1/ic5ktPW+ke/TVq7oxFIQiS34apyujhxIxQbQltRtTYwu73v7HWP/9h64HPUr7XEnMRGn4PEdQWDSpV4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwTQBB0f; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwTQBB0f"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c88e45f467so1373725a12.1
        for <bugs@lists.linux.dev>; Wed, 02 Oct 2024 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727875394; x=1728480194; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=iwTQBB0fQUFGIyhmjgEQOyTNnEZrbNoeBtn5hE+uKkpchQp1oH0SFIA0RbUwwPR1tU
         ZXgEbujeZU52usslFGuEK1VeXR5jn+nxxsJlgS9b7Kb+mgagy0P1txbss5o+CkDm76TV
         YnNaYp1YgB7fuj9B5sTm9KFx0YMKBMtaODb/xZ8ZUI7MJFiZvWG09mnnq93FBqRd8h+P
         flfNihCJsgeGtgSu230JFrwpohJjRF/WBViyb5gxdVGEtXh0vR6KiWCD+oZMTkOjWi9r
         IpC5rW8QbPdhGCbcJKKJqwfQc9ABKyexOCyuVhLpEBi3ewh5cUDcKD9hJWDtQMtzBYDw
         HFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875394; x=1728480194;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=JENf584KudcXhkJ5KVYGCP+YZ7KCxasid9ob9b6lXdqg0kCmRZzOCABXnv3J4gMARg
         dYEQbK9Z36IR5n8U+bCjjhnrDi3rph8mH5NrwxFFTYzBk/RYgmi+Ecm0bpZr5llJd3eQ
         ucHeUkaxIK3hPLiK37YWJrTFHaErdE2S+vLFGRUZi0dBkcZ9BB0OdfZZ3Ctok3bdITCC
         GrH1+peEfXqSfOnC7S8eXVQm7V1eUmbQReyG2SJ7AixYUHhHUkZGIWGPztuMlpYodobf
         i3T5bb7QSDCXQUQLHq4M7HkiK3NrQTgWrnmm3yW/nHlkGyk1gEFNxqz/blnsriO1FTKp
         vgfw==
X-Gm-Message-State: AOJu0YxlZ1duTl1wTkiQ4Wx/3EwedgX0rfuhbLjLPQZP5X0tkAKCQWAF
	Vlcln2NqjK+gf02Lrp1Bxa7p09KCS0iuZ8Ydc0zrB+23e13W793cTvrNHb6eMxoHSicz+yn7zpZ
	eJMq9QF6MqfhyGRKlmS3eaocnWGg4DA==
X-Google-Smtp-Source: AGHT+IEYEyDYVOYbFbet55XWJTWs4ciiIjRx0QIZS5v1jIVS+CsBoJN/Qr/ztkXTehLddSEGMLmfypHZ+VvzN3bXyuM=
X-Received: by 2002:a05:6402:5192:b0:5c8:97b9:58a6 with SMTP id
 4fb4d7f45d1cf-5c8b115203emr3922934a12.1.1727875394143; Wed, 02 Oct 2024
 06:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: xinghuo chen <xinghuochen111@gmail.com>
Date: Wed, 2 Oct 2024 21:22:58 +0800
Message-ID: <CAKccHm4htcFzS=3-iFcwoWCf5ROxhWfuLaC7R11x1WrzAZNsUw@mail.gmail.com>
Subject: sub bugs
To: bugs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"


