Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73ED5A4FD
	for <bugs@lists.linux.dev>; Thu, 14 Mar 2024 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400375; cv=none; b=DeMg8WYmk0rccoSeULeLFCmozcL+WcRLdqZfgAAtIceLl++5wwEOpA0dyjNzGKp9YeygL3yr3oV6AMKoVXtGHHyH357JgdFITvXK0VPbsHB4gJJdhwas9Q9PyHEdP/ZPoq/ccdzpY5605xDJDT316Gx8ttfBrYHohqLXxVNA0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400375; c=relaxed/simple;
	bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UtyrDWqumw1hMZrltrc7WTtAO9oklG0C4q3q0w2heOAOh2bW3kkK3ipZuqsoLRbFOu9HTbdfrBukxEyOh9R6kIW6YthP/bfbLtczUc8tCBiwmSodqQGqUJ0ArFS6avmeSXnTYlqsnImIv9wBck6L7XaMGDQpToI2/YLKWq+nnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3CP0vtT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3CP0vtT"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso676360e87.1
        for <bugs@lists.linux.dev>; Thu, 14 Mar 2024 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710400372; x=1711005172; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=Q3CP0vtTqxjzb4WHKNhByxYDYUn2CvymKJavnSPs9RgF5ugK391lFrsEhE4zFhqB9T
         7Df89lgACcrHLtoqL1nKKXJwTRyLIxaNz9fel/F2WY8DiY/HqfNnlEoW/DCu/Uz2U7zt
         zyVYlm+/it0tslaZHsFCJYm3Ue59gG6bo+30IOsJQ3oyyetJ5GwJed5XlJtnlexrCc03
         W1lxYoaSj3yWjN5SBcZBC4IHkwCTX724NsmwW3DjU12i/Z7UU0AXZ1m/VjfJW+knXL5o
         Wt5jFf5hZatZhKwgOYzOJpEBX4HCWvUYVzhfCbW+wrAhO2uwxk0GwZ9IkY45pdqqkGwX
         Jk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400372; x=1711005172;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=eMRO5GWoc8TzFE3MLl670TELmc0n69uQRk8W3l6ful6E5zt2AtqHpn3nvnKgCwbThY
         qgkTP1SPefONqjXsHFsc4JNtGXVk0RSWrc08h/bM1ws7IRLwcM/aMm31Vj1a7mou0fHn
         LMBKk/KBd+t9FpdMYd8mmcUuHGzKDu6jjmikoeC+oSSPm4RFhYuD5ajfcl7TY2LGoXvu
         sE08whc/sZHJ7miNzOcqXgOD8MO+xmyof+wWKrzo7FtufjbnVUgJPnOAz/zoUHut4HX5
         TMxhzkDNSfzoFKnzede3/yRcz/sB4OaprN1l+HugNfJC14EcnAb9tLpnhbq/FcFu7a8X
         sr1g==
X-Gm-Message-State: AOJu0YwRoP1+DA0GlRl39cXLnL0YCOAT9i1KZIc3n9bJ5ahe73BXpEph
	5rpCFmV9g7uNzX6/JzSfzMjmMRDUSrfZ8KqUVOhrSZyoBZBRo44f+q352chdPnigc8duIZJPVzN
	l75+UAH84c2FUs3GHBXKBC7EyeGnBeXehnUs=
X-Google-Smtp-Source: AGHT+IEjO0Hyfm1GpeQqIONHtbOGa0mptX9W3GQy+Ipj2qrV4B6RTZ/CC8T3ekSQf5mvanAUzJbVm4HTTSvON2LyJH4=
X-Received: by 2002:a05:6512:3e1e:b0:513:4fb4:5388 with SMTP id
 i30-20020a0565123e1e00b005134fb45388mr670738lfv.41.1710400371789; Thu, 14 Mar
 2024 00:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Thu, 14 Mar 2024 09:12:40 +0200
Message-ID: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
Subject: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: bugs@lists.linux.dev, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If an I2C-HID controller level-triggered IRQ line is routed directly as
a PLIC IRQ, and we spam input early enough in kernel boot process
(Somewhere between initializing NET, ALSA subsystems and before
i2c-hid driver init), then there is a chance of kernel locking up
completely and not going any further.

There are no kernel messages printed with all the IRQ, task hang
debugging enabled - other than (sometimes) it reports sched RT
throttling after a few seconds. Basic timer interrupt handling is
intact - fbdev tty cursor is still blinking.

It appears that in such a case the I2C-HID IRQ line is raised; PLIC
notifies the (single) boot system hart, kernel claims the IRQ and
immediately completes it by writing to CLAIM/COMPLETE register.
No access to the I2C controller (OpenCores) or I2C-HID registers
is made, so the HID report is never consumed and IRQ line stays
raised forever. The kernel endlessly claims & completes IRQs
without doing any work with the device. It doesn't always end up this
way; sometimes boot process completes and there are no signs of
interrupt storm or stuck IRQ processing afterwards.

There was a suspicion this has to do with SiFive PLIC being
not-so-explicit about level triggered interrupts. The research of this
issue led this way: There is another DT PLIC binding; a THead one,
and it has a flag `PLIC_QUIRK_EDGE_INTERRUPT` which allows
to define IRQ source behavior as 2-cells in DT; and has some other
changes to the logic (more on that below).
When attempting to mimic a THead PLIC in kernel DT, and rewriting
all DT interrupt sources to use 2-cell description, the hang ceases to
happen. Curious as to what are the kernel side implications of this,
I went to see what `PLIC_QUIRK_EDGE_INTERRUPT` actually does and
bit-by-bit disabled the actual differences this flag makes in the
driver logic.

This return path in irq-sifive-plic.c@223
(https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-sifive-plic.c#L223)
is only enabled for SiFive PLIC, but not for THead one. Removing
those 2 lines of code from the driver (whilst keeping the DT binding
properly reporting a SiFive PLIC) fixes the hang. I am not an expert
on the PLIC driver to debug further or determine what would be a
proper fix to this, but this probably gets more experienced devs
somewhere (I hope).

This is reproducible at least from Linux 6.4.1 to Linux 6.7.9 on RVVM;
Affects any hardware that would have SiFive PLIC + I2C-HID combination;
Most likely this is reproducible on QEMU as well if it had i2c-hid emulation,
or if we passthrough physical I2C-HID device & inject PLIC IRQs from
it's IRQ line.
