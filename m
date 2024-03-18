Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918E28DA5
	for <bugs@lists.linux.dev>; Mon, 18 Mar 2024 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751708; cv=none; b=lYE9YIkG/3gJ2uYEdSVOmibLRDrodnxpIZMx2pgTDtvvtAqIgnpf8lhIzGCqvccNBA4LocyNkyqQE+Lw6rZK7LV0P7ziY9DhoI3h1uU2xplT3kQK2FoiaQ0UX/VpYOTICc7IuYFo6JJmuWiU1P8aLtAyHQGBnkanRf2mRrvflLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751708; c=relaxed/simple;
	bh=owIMFRWACGRv/fYCW/6DnXxYC1Wgpz6uLqFLSH/tF08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OleJIqQHOGHDVFf21Kt9ik4VXZz2un2b4+QDffyFI0QiNPZHrD8YK841HNQQqXmqj+nMb6iicpookOpa1XP6Uozri7hWbmW5S2nF3JbC3+0NetmjetD1gXsox9aHNJbQK8cJTaV06nyL6k/q5Ezhfjy9pTmES5QXDkvE91GNx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0mD3pBx; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0mD3pBx"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d247e3c4so3281110e87.0
        for <bugs@lists.linux.dev>; Mon, 18 Mar 2024 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710751705; x=1711356505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=R0mD3pBxEVxu4MhuKMiVq+oqyk7SJwsspHrMiUKQOX81vp3jkZmD2e6hAL7ZU3K7Zt
         NCaNzNs3ICBpkR6W/HDZ7TPnNl6RrchemtDG+0SkyEG5KQ63RG4IsdtqVnL7xTvWNch7
         fMq5o7ZJPx9njliiOFEYTZUGliFDMp5xNQUDX9Wku4qk2HW6Qici77scXyWkJ9x518c9
         NYGVjFKdrKoqFazJabLCSR7P971M00GzfipcpgzgTJJcEmkVIXuLgUib3kX8Hqe1quV/
         W+nhIBV4cNryPYir/P/21HMvFCFsiZpwaoDa9NCoFMXxeePGkG9ViC0uSRGxTIwnf8Ab
         jO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751705; x=1711356505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=Hxu/s3C/RW+NttYzgODfB/rHHoQ+5o3ppC6yihSauyk2Ff8ndcLgYqWLjzmBBWBnn5
         AGPmWPijv72v3kyy4QqJD4UTL37TATWVpRtgHse3EQF0D2L26ulkW8IYg7JqvGtdvqt5
         BwQKFl/QCcIj3JSMBOq9+STb/sk55gNQVvDYns9tZFAUETn7onZesDI68DvvZQzrHzSv
         B3ASqcd2JLpo4GEQTy7fwXmrQg43Mj8mZ8KdGHqbkWcwKaJFQFSYi90ZEKAMnTo8xPum
         v9BJpM8WwgxmZP9UUVQpmwdlUn7fEM4wOXppyyBBnOTgOil64hVFvHePwhR9smjboQjk
         vU+g==
X-Forwarded-Encrypted: i=1; AJvYcCWCc7I9GSFkA3URF9YfniVyeXRIFe11mus49zVayLdiiSG189bPwYvY1rKyLTIddDdOi8OBVX0gun6UfiY4BXUaqr9ZJw==
X-Gm-Message-State: AOJu0YzF9NEzyL8MKQTyF1+zDMlwIi0JrJO9bBPwyv10BjTRGzIm0ENT
	he6l16nqieWuwQU4j8oxfRGa2rIaMmOEIkR/VomJCicW40QQCJ4tpDuOdO2hT5TrdHTDt1s1VAx
	CvUrD7S5SzzOTvse/L+XKHgy6F7Q=
X-Google-Smtp-Source: AGHT+IEEoUIOrSsbRaM8/GVH+vQ+AoLpoQTnF53ccg6k+RNlmOEAGacCjS10S9CMBS6f02FWdVOZf0kD8acLyTH3OD4=
X-Received: by 2002:a19:ca10:0:b0:513:e049:3e1a with SMTP id
 a16-20020a19ca10000000b00513e0493e1amr1779164lfg.17.1710751704969; Mon, 18
 Mar 2024 01:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao>
In-Reply-To: <20240317222718.3e03edb1@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 10:48:13 +0200
Message-ID: <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 11:27=E2=80=AFPM Nam Cao <namcao@linutronix.de> wro=
te:
>
> Cc: HID folks
>
> On 14/Mar/2024 Eva Kurchatova wrote:
> > If an I2C-HID controller level-triggered IRQ line is routed directly as
> > a PLIC IRQ, and we spam input early enough in kernel boot process
> > (Somewhere between initializing NET, ALSA subsystems and before
> > i2c-hid driver init), then there is a chance of kernel locking up
> > completely and not going any further.
> >
> > There are no kernel messages printed with all the IRQ, task hang
> > debugging enabled - other than (sometimes) it reports sched RT
> > throttling after a few seconds. Basic timer interrupt handling is
> > intact - fbdev tty cursor is still blinking.
> >
> > It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> > notifies the (single) boot system hart, kernel claims the IRQ and
> > immediately completes it by writing to CLAIM/COMPLETE register.
> > No access to the I2C controller (OpenCores) or I2C-HID registers
> > is made, so the HID report is never consumed and IRQ line stays
> > raised forever. The kernel endlessly claims & completes IRQs
> > without doing any work with the device. It doesn't always end up this
> > way; sometimes boot process completes and there are no signs of
> > interrupt storm or stuck IRQ processing afterwards.
>
> It seems I2C HID's interrupt handler (i2c_hid_irq) returns immediately if
> I2C_HID_READ_PENDING is set. This flag is supposed to be cleared in
> i2c_hid_xfer(), but since the (threaded) interrupt handler runs at higher
> priority, the flag is never cleared. So we have a lock-up: interrupt
> handler won't do anything unless the flag is cleared, but the clearing of
> this flag is done in a lower priority task which never gets scheduled whi=
le
> the interrupt handler is active.
>
> There is RT throttling to prevent RT tasks from locking up the system lik=
e
> this. I don't know much about scheduling stuffs, so I am not really sure
> why RT throttling does not work. I think because RT throttling triggers
> when RT tasks take too much CPU time, but in this case hard interrupt
> handlers take lots of CPU time too (~50% according to my measurement), so
> RT throttling doesn't trigger often enough (in this case, it triggers onc=
e
> and never again). Again, I don't know much about scheduler so I may be
> talking nonsense here.
>
> The flag I2C_HID_READ_PENDING seems to be used to make sure that only 1
> I2C operation can happen at a time. But this seems pointless, because I2C
> subsystem already takes care of this. So I think we can just remove it.
>
> Can you give the below patch a try?
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 2735cd585af0..799ad0ef9c4a 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -64,7 +64,6 @@
>  /* flags */
>  #define I2C_HID_STARTED                0
>  #define I2C_HID_RESET_PENDING  1
> -#define I2C_HID_READ_PENDING   2
>
>  #define I2C_HID_PWR_ON         0x00
>  #define I2C_HID_PWR_SLEEP      0x01
> @@ -190,15 +189,10 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
>                 msgs[n].len =3D recv_len;
>                 msgs[n].buf =3D recv_buf;
>                 n++;
> -
> -               set_bit(I2C_HID_READ_PENDING, &ihid->flags);
>         }
>
>         ret =3D i2c_transfer(client->adapter, msgs, n);
>
> -       if (recv_len)
> -               clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
> -
>         if (ret !=3D n)
>                 return ret < 0 ? ret : -EIO;
>
> @@ -566,9 +560,6 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
>  {
>         struct i2c_hid *ihid =3D dev_id;
>
> -       if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
> -               return IRQ_HANDLED;
> -
>         i2c_hid_get_input(ihid);
>
>         return IRQ_HANDLED;

Patch applied cleanly on top of 6.7.9, builds OK (No warns, etc).

This indeed fixes the hang completely.

I modified RVVM to send millions of keystroke events per second,
and put `reboot` as a service hook in the guest. It has been continuously
rebooting without a hitch for the last 30 minutes or so (Full boot takes
around 2 seconds), whereas unpatched 6.7.9 hangs almost immediately
in such conditions (Reverted your patch & rebuilt to be sure).

Thank you very much for this! Hope to see it upstreamed soon
