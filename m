Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D605F282FA
	for <bugs@lists.linux.dev>; Thu, 11 Apr 2024 02:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712803679; cv=none; b=YBKgrN7vbH40LGbRCGg+cnrqpmelBuR9hz8aOQIt5HxS1YXAKE4MI1/LHkGN38lScDuU6tM1vutx+Vbra+Z+VN4J8jznukntvh1iBrVwOKfkK/SILIsdn0x+/QMOqS4ir9WSygJXfNC3FANCMXphVORgsydzpZbU5YOooSOkO+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712803679; c=relaxed/simple;
	bh=/19AE1PFz9369hA6midxPs3l+7pKUdDk/8PBwSMuDhI=;
	h=Date:From:To:Subject:Content-Type:MIME-Version:Message-ID; b=XAekzN4y1nfeeuBe96wRb+JhJVztZJvcTc1iui2Mi5WMtjuALqtEwEDlsxcmlYqVAaBJGTzn6FqCFxW7nSnU4vmG5j6xqRaJzHryf/6IzvBUj4kHPdd6ky2NzWMtb5lmR7aWuO8/8AFe51d1b8LHSYRXKfuYgnzYHaWNzZCpN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=ieidHiYb reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="ieidHiYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=lM9QsZo0i/IHHybBoyr1uZX6nPdx6vnYFUDJGN9nYX8=; b=i
	eidHiYbh0fTp9ElJzvyuiiAidiqeUWOO398i2iT42WKRdWFRnGykaHDqxkby6+8e
	9U6KQ+58rgLXDaGsQ7Ag51vVsKNnZmTSMFVLf/63cF4lGfA+273+uVKIvnF4GREu
	B7DvC4H5h2+tzfbmPxCkhBfrrTv4mL8Pp45G4PT4Eo=
Received: from suntaoworks$163.com ( [120.224.142.42] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Thu, 11 Apr 2024 10:47:44 +0800
 (CST)
Date: Thu, 11 Apr 2024 10:47:44 +0800 (CST)
From: =?GBK?B?y+/Mzg==?= <suntaoworks@163.com>
To: bugs@lists.linux.dev
Subject: usb auto cleared
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2aAPSbvE4t4iObZekZk0YXj+c/W8K1vvsg1YdfPJs0oyTD4iImZlBbHmbn/fy9CgKInzeQdxdq18pTYoljb7Jx+Mpr2Y0kK4InkkF7S2EV
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <56ab17e6.3ec5.18ecb0dd1d0.Coremail.suntaoworks@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3vzhQTxdm8EAKAA--.28878W
X-CM-SenderInfo: xvxq3txrzr2yrv6rljoofrz/xtbBoAC8YmWXwqg99QAFsr
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkRlYXIgYWxsLEkgZ290IG15IHVzYiBkYXRhIGF1dG8gY2xlYXJlZCBvY2Nhc2lvbmFsbHkgd2hl
biBpIHBsdWcgYW5kIHVucGx1ZyBpdChhYm91dCAyIHRpbWVzIG9uZSB5ZWFyKS50aGVyZSBpcyBu
byByZWFkL3dyaXRlIG9wZXJhdGlvbiBpbiB0aGUgbWVhbndoaWxlLm15IHVzYiBmaWxlc3lzdGVt
IGlzIGZhdDMyLGxpbnV4IGtlcm5lbCBpcyA1LjEwLG9wZXJhdGlvbiBpcyBkZWJpYW4xMS5JIGRv
bid0IGtub3cgaG93IHRvIGRlYnVnIGl0LGkgdGhpbmsgaSBuZWVkIHlvdXIgaGVscC4gdGhhbmtz
Lg==
