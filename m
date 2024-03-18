Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033B2E84E
	for <bugs@lists.linux.dev>; Mon, 18 Mar 2024 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710757474; cv=none; b=giwvGd2eW/U3Vps30I4JQLdf0ovqMkUk/KDarrRWP2sMea1KOqWqZZ7vcWYDrnC6JSc3MxH9yF35o4TcXUZd9dpD431zR8DArjPabGK2OdbJ9VhFTTgD0ANybiVZwLcz7sZy6iHOYGnAMTN1a/CVjiadSQ+WIBQyNVRcyjIECyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710757474; c=relaxed/simple;
	bh=ery6NRFC2rTlrIrfvpDvhH0oInDvwM5WelThauRvuDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMaaLUC7abaD5Pi90jL7zhncqhrRxSVFrcLAktqESJ64p7p94sAejoFtdpvEiaA34W3hsMoVfMlUGMnFDVN14/8b0GdJm440veBYdx0beii1s2yoGCzfMtvp9XhFczCBG7qSLcBRVhaFsH1TY+r0XLnTFL82qx0RvueQfB588wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzg/Z4dV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzg/Z4dV"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so5202955e87.0
        for <bugs@lists.linux.dev>; Mon, 18 Mar 2024 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710757471; x=1711362271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=Vzg/Z4dVkx/tdXXSiFRd6mmsDswX1K4Nb7f1rwOFHn4Hb7T73ufJiU6arKCyQzAKdG
         fx4pIl4LsyDmpnasuZmbPVc9CaP55Eke06tycmrUkq4bHISmyWeihS9SOJS5K7LqPC0b
         p1L5MLhvhOS0DqjTYgILpBqfGsfWtQoeMNIgvFki+20cjq6ZffwlQ8W+0UXU+aBw7sJN
         fGHp4TvUZORkUfqeB+udUKdYR1N9G7VJ3WLIxCCH/5iTl/spa09umkqsy6WxXm7nZohe
         f7ikXU8cwd8BGvtMrgJZ1N7XO8J6/bfUhlVz1ugu1r60ihkJdeushgTlkgZ32UdRAsIu
         t2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710757471; x=1711362271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=Rlg7EZicpmgw9/iUf29tZuuXJKCkqUpiS0aW4fGUHpDiUTTc4vylkhll0GGx29Vwwe
         PJAVyJdc3sh3baDQADQTkWasLvCAo9BcrxA/MAng408nOZof6h76ChNXVvFtRcL7vT60
         YipVp8z9O7Hhcvp8BcmSZS3W93FA40qUAnLQAdInC15lVOsEyeJ3U09RI6dGgYXYK1bp
         M+Fk31D7yJDJ5wXr0dbKmQNIqOM6sM3K0Zpups3lqukcTANHZb2gQ5/CBj7XAWTf5kS+
         t/2nq4AEn3dvSDNUcoRVw/8SBY54JF3HbrP66QUOs8SxTpQHu39ctgBYFQfxvGQWlHCV
         4VEg==
X-Forwarded-Encrypted: i=1; AJvYcCXyBpHrfDbDtsJdX9WSBxDyNNH9Wgou9O05To3wVpL9B2TbCAWuf63pZMx+1rEJHZ9j687KTBEwVa3VIMBb985UzwMNjQ==
X-Gm-Message-State: AOJu0YzF+ybrYoAFyjDibNqcUqkWNkGZN4T7WcMR5CZYDu4uaEjV36J1
	LMOHU+XaZxSrwVEhkqHKLk72CoihFMNLMHyq0hysyJC87HBhBc/E3m+/jxMqQdST3j51lZtkM/A
	2w02VP5SzJd6zc1M+lntGL+b7q34=
X-Google-Smtp-Source: AGHT+IHkUAoaQCQVB1qIDuqXpEBKlFEHkJrtN5qFI394gASFx2wCpRpaQSzqetL2Hg5oBfbO6L7QeYXCho3lGQksddk=
X-Received: by 2002:a05:6512:485c:b0:513:ca84:3a0e with SMTP id
 ep28-20020a056512485c00b00513ca843a0emr6709998lfb.58.1710757470631; Mon, 18
 Mar 2024 03:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao> <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
 <20240318100108.4fafd72b@namcao>
In-Reply-To: <20240318100108.4fafd72b@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 12:24:18 +0200
Message-ID: <CA+eeCSN+tsyL0OdR2owrFHiSj_dWNyw0Z46mUMND41O5xxTWKg@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 11:01=E2=80=AFAM Nam Cao <namcao@linutronix.de> wro=
te:
> Nice! I assume I can add
>     Reported-and-tested-by: Eva Kurchatova <nyandarknessgirl@gmail.com>
> to the patch?
>

Yes.
You can also add link to upstream RVVM repo if anyone is interested in
reproduction. This RVVM patch applied to 0.6 makes a keystroke storm:
(window_update() is called on each display redraw and has access to hid_kb)

diff --git a/src/devices/fb_window.c b/src/devices/fb_window.c
index f170e2d..17e2519 100644
--- a/src/devices/fb_window.c
+++ b/src/devices/fb_window.c
@@ -77,6 +77,11 @@ static const uint8_t rvvm_logo_pix[] =3D {

static void window_update(rvvm_mmio_dev_t* device)
{
+    fb_window_t* win =3D device->data;
+    for (size_t i=3D0; i<100000; ++i) {
+        hid_keyboard_press(win->keyboard, HID_KEY_LEFTCTRL);
+        hid_keyboard_release(win->keyboard, HID_KEY_LEFTCTRL);
+    }
    fb_window_update((fb_window_t*)device->data);
}

> I am still confused why RT throttling doesn't unstuck the kernel in this
> case. I will consult some people and investigate more on this. But I thin=
k
> this patch is good on its own, so I will send a proper patch shortly.
>
> Best regards,
> Nam

RT throttling kicked in *very* rarely, in most cases where the unpatched
kernel was actually stuck RT throttling wasn't reported at all.

It didn't hang every time either, so it's possible that RT throttling
helped sometimes, but not enough to always recover from such a loop:
[incoming IRQ]->[IRQ claimed]->[no handling]->[IRQ completion (which
immediately triggers phase 1 again)]

Best regards,
Eva
