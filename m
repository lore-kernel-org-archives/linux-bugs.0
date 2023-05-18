Received: from m1316.mail.163.com (m1316.mail.163.com [220.181.13.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844187E
	for <bugs@lists.linux.dev>; Thu, 18 May 2023 01:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=6fDgC2GR6pyvVswgmxUhGqn/NSted6QiTzeap+AvGLE=; b=X
	A8nkzNp0ddbLpnrFZUNGat2EwZwnNAXD8R5uAI+RvB5BDI5AQ5ws2V36lkDIBZ7i
	rSMIQqDzpW7vSoBgD07tffTsRMaHe+NQYfEmgTlzPxAt0gZ9j/lhKcA+ExvMHpkk
	AqMn6piBGfcUzL/S+Tp+dNLsCV1ez/n9nc7vMZi4Eg=
Received: from yshxxsjt715$163.com ( [113.128.85.191] ) by
 ajax-webmail-wmsvr16 (Coremail) ; Thu, 18 May 2023 09:07:05 +0800 (CST)
X-Originating-IP: [113.128.85.191]
Date: Thu, 18 May 2023 09:07:05 +0800 (CST)
From: Norman <yshxxsjt715@163.com>
To: bugs@lists.linux.dev
Subject: ideas to find a root cause of a long rcu_wait_gp delay
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
X-NTES-SC: AL_QuyTBv+cvUgp4yedYukXn0oTgug4Ucq0vfkm2IdSOZk0oynw1howZkV6Pn7Jz8u+NRGLiiKmYjFt5eBZUYdRW5wreqU01m/rRhsoRhNvMHw2
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <3981a8dd.62a.1882c6571a0.Coremail.yshxxsjt715@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:EMGowAD3_085emVkcLENAA--.10963W
X-CM-SenderInfo: h1vk555vmwliqv6rljoofrz/1tbiIAhzL10TMseUuAACsh
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIGNvbW11bml0eSwKCgrCoCBJIGFtIHNvcnJ5IGluIGFkdmFuY2UgaWYgdGhpcyBpcyBu
b3QgdGhlIHJpZ2h0IHBsYWNlIHRvIGFzayBxdWVzdGlvbnMuCgoKwqDCoEkgYW0gZmFjaW5nIGEg
d2VyaWQgbG9uZyBkZWxheSBmb3IgZXhlY3V0aW5nIGRvY2tlciBleGVjIGFuZCBhZGQgbmV3IG5h
bWVkIG5ldHdvcmsgbmFtZXNwYWNlLiBUaGUgc3RhY2sgZm9yIGEgaXAgbmV0bnMgYWRkIGNvbW1h
bmQgaXMgLAoKCmNhdCAvcHJvYy8zODQzODU2L3N0YWNrCls8MD5dIF9fd2FpdF9yY3VfZ3ArMHgx
MzQvMHgxNjAKWzwwPl0gc3luY2hyb25pemVfc2NoZWQrMHg1ZC8weDgwCls8MD5dIHN5bmNocm9u
aXplX25ldCsweDFjLzB4MzAKWzwwPl0gbmZfcmVnaXN0ZXJfbmV0X2hvb2srMHgyMzIvMHgyYjAK
WzwwPl0gbmZfcmVnaXN0ZXJfbmV0X2hvb2tzKzB4NDEvMHg4MApbPDA+XSBlYnRfcmVnaXN0ZXJf
dGFibGUrMHgzMDMvMHgzNTAgW2VidGFibGVzXQpbPDA+XSBmcmFtZV9maWx0ZXJfbmV0X2luaXQr
MHgyMy8weDI1IFtlYnRhYmxlX2ZpbHRlcl0KWzwwPl0gb3BzX2luaXQrMHg0NC8weDEzMApbPDA+
XSBzZXR1cF9uZXQrMHhiNi8weDE3MApbPDA+XSBjb3B5X25ldF9ucysweGQxLzB4MjEwCls8MD5d
IGNyZWF0ZV9uZXdfbmFtZXNwYWNlcysweDExZi8weDFkMApbPDA+XSB1bnNoYXJlX25zcHJveHlf
bmFtZXNwYWNlcysweDVlLzB4YjAKWzwwPl0gU3lTX3Vuc2hhcmUrMHgyMTMvMHgzYzAKWzwwPl0g
ZG9fc3lzY2FsbF82NCsweDczLzB4MTMwCls8MD5dIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdm
cmFtZSsweDNkLzB4YTIKWzwwPl0gMHhmZmZmZmZmZmZmZmZmZmZmCgoKVW5mb3J0dWF0ZWx5IHRo
ZSBtYWNoaW5lJ3Mga2VybmVsIGlzIHZlcnkgYW5jaWVudCwgaXQgaXMgYSB1YnVudHUgMjAuMDQg
c3lzdGVtIHdpdGgga2VybmVsIHZlcnNpb25lZCA0LjE1LjAtNzItZ2VuZXJpYy4gSSB0cnkgdG8g
cmVhZCByZWZlcmVuY2VzIG9ubGluZSwgYW5kIEkgYmVsaWV2ZSBzeW5jaHJvbml6ZV9zY2hlZCBp
cyB3YWl0aW5nIGZvciBncmFjZSBwZXJpb2QgY29tcGxldGVzIGZvciBhbGwgb25saW5lIGNwdXMs
CmJ1dCB0aGUgbWFjaGluZSBkb2VzIG5vdCBoYXZlIHZlcnkgaGlnaCBjcHUgdXNhZ2Ugb3Igc3lz
dGVtIGxvYWQuCgoKU28gSSBhbSB2ZXJ5IGFwcHJlY2lhdGVkIGZvciBpZGVhcyB0byBoZWxwIGRl
YnVnZ2luZyBvciBpZGVudGlmeWluZyB0aGUgcHJvYmxlbS4KCgpCZXN0IFJlZ2FyZHMsCkppYXRv
bmcgU2hlbg==
