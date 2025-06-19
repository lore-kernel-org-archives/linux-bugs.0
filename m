Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4C21B199
	for <bugs@lists.linux.dev>; Thu, 19 Jun 2025 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750349218; cv=fail; b=oPiIMfIZ3w6fUFbfBt4h1G4QtR92FAqKyjCj7bv0hJUQbhOK1Dzs2loFEoPKOOsUYVQjMDn+Ih2qR85dobcMQvqKP6vZeYcBAWTfjmt74IuU+/m9T0paeCAOIZqM0D17yKZIB3QVCPz/EL0tm6QqHzM9Me1C+246XidCMCRuufY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750349218; c=relaxed/simple;
	bh=8zUdo3aGLR8XX7j3mdMFIP0MEouswRM/DGnASqIlCQ0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jWBZiclemwun5YQAbrc7Ih7ZSBC3l4LQ60FFaQYchrL48vnmRmtHoKj/ZoJipoYuYr96kykVRV7p61CWFtna7DNOJxEnco+f4grUSk0aHpInBofEBNptprpo1K2/2G7j5gyiYlXui5FdKmqv574vYWn6YH36Lye6BcALR6CDWmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=festo.com; spf=pass smtp.mailfrom=festo.com; dkim=pass (1024-bit key) header.d=festo.com header.i=@festo.com header.b=nH7vm0fx; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=festo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=festo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=festo.com header.i=@festo.com header.b="nH7vm0fx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9YbUMm+IIfyzwLBwEqapZE3SBRKYa4Vn6vNJiEw0qseuuNiOxfCAL8ySQ+I7zTRcLmewBorYzWNM99XN3hH9tq1qy+McuhElkGPEP9goD2GHnbAklEnO/FFBxtNI2Er5mDUE8kD0eMTEr2M3XipXpKe3/XocICMQimQAZWHvMndHBo2bNwVDXb/ncvdISNwF2RkEKVVkkkjJ0Rl31xbHUFjkLyQRB2/g9VrIDNR3/EGt1mo6+Y0U6M1uOvTBx8fQZp+hN9tJK58b/Ig/tDVW9JpH3g+sekAX9uuRqnRI8yaISEYY77hpZYPKhMNS/W2rvtEdUrP6w3UbFjFVngXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFJY7PAgYc3pxuZ0MGAzlUvftgWi7CcXasY5jwwkH2M=;
 b=jVD5A+LqlRBfEnHs7UlLyHOFN4VE6AduVjOzcbCDd8meBkqkInCvwfA69J91pomc+DFf47q5qeauLfsoHGcO0TZI5QkSKbRy0xIQR88hsaYWGb7bBqOtaKKm3GnjjIiOzWETzmQwAhgt7/akXQqX4y+YMWRlw3PaUyQBUm92wEdtwc8V0PS/yG24JAEYH9BkSEkDww/pw623OsO53tiyKyjQwOSgEfvOVsOyP8O9sPmALZduCovcqT5wC1QkCnZblKdgiSyN8ECicxaumgMNcaY5hTt+YlYgRY/PSyHRLS4Q5k+QJufuizp4SE6wYIotLeueSEFoZCtmca72sjkgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=festo.com; dmarc=pass action=none header.from=festo.com;
 dkim=pass header.d=festo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=festo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFJY7PAgYc3pxuZ0MGAzlUvftgWi7CcXasY5jwwkH2M=;
 b=nH7vm0fxWO41lON7MsbzRjYmyXJiUb1TRYdtw9lQ4oGWHSpsWqKOjjUBjeBC5WATDrrIiG8MjSz/fkbO1zAbRoojHFxGw8ABdyHM9Fq2evy0afJPXgVI+XrINDbUUJGG9wRIdIFyBqBlIU+I2kqF9cRrXo7AeEBdBZwUf7zvOZs=
Received: from AM5PR03MB2882.eurprd03.prod.outlook.com (2603:10a6:206:18::24)
 by PA4PR03MB7454.eurprd03.prod.outlook.com (2603:10a6:102:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 16:06:52 +0000
Received: from AM5PR03MB2882.eurprd03.prod.outlook.com
 ([fe80::b0f0:d40a:9a12:ba47]) by AM5PR03MB2882.eurprd03.prod.outlook.com
 ([fe80::b0f0:d40a:9a12:ba47%3]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 16:06:52 +0000
From: "Xie, Nick" <nick.xie@festo.com>
To: "bugs@lists.linux.dev" <bugs@lists.linux.dev>
Subject: Error during libevl build and runtime settings failed
Thread-Topic: Error during libevl build and runtime settings failed
Thread-Index: AdvhNCsPSr13v8uwQHKA1c0dN9vzhQ==
Date: Thu, 19 Jun 2025 16:06:52 +0000
Message-ID:
 <AM5PR03MB2882F5ED2ADBA37FAA9562608B7DA@AM5PR03MB2882.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_ActionId=8430b061-1df4-4c35-be9f-8402972fc047;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_ContentBits=0;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_Enabled=true;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_Method=Standard;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_Name=Internal;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_SetDate=2025-06-19T16:04:28Z;MSIP_Label_9c86c25f-31f1-46f7-b4f9-3c53b1ed0b07_SiteId=a1ae89fb-21b9-40bf-9d82-a10ae85a2407;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=festo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR03MB2882:EE_|PA4PR03MB7454:EE_
x-ms-office365-filtering-correlation-id: 8c762c01-09f0-42af-bb6c-08ddaf4b4e3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?q9rZ9bXAxTQVE1Z6gJfPwrxgNH4CbWqH5ym4MD2Ffqoj6ra5W9w3cOp2TI3J?=
 =?us-ascii?Q?t638NT+ApFAh91PYjghtopixFax6l8Gip1RIGS269j7j7zh6CoWqEHekgKJY?=
 =?us-ascii?Q?HWUtjxrGu92EK39CWgqACyHU3ba2z5pw/5xPBS5BOhvkSIe8aYje9/N+3iFa?=
 =?us-ascii?Q?cZLqeJkbw0s61hr2Eu+Q9HXP5cryssdXyWZ5fPGdw192g1dTnAjw/AZA0DWv?=
 =?us-ascii?Q?xREn5hI74xx0us3dwwV2PgBp5Bg8xEPmDWGRjilkFPeQE/JgT8bqRdl4El/r?=
 =?us-ascii?Q?g+hchHwSMizHXzFpQPD0D0pXE5XDgyOx6tbVLL37ZZMbBQRhBQ5lYAuc5iOR?=
 =?us-ascii?Q?aQDCVHOZKRLn6hT5iMZnVXII2WtNCi5J4qdGIMY0CObVNq49OWCGk2mAEYDc?=
 =?us-ascii?Q?Zq4JHz3B1ICAiaDYCk/tolYCzOjGsKcsWbaUITcUuQYNzGcLPldpqxg42ZYf?=
 =?us-ascii?Q?wqpN/ibNWgJ6UMSm2Ag55VXYhYC6Dg8IpETnW2QCQTPQGAd55/ZdoFUa6+Mm?=
 =?us-ascii?Q?QWN05NZw5zPTyA/cjtl1F1eG0BNKklvjdCoAOcBfcCcPltBri0F0hQC5k2Sk?=
 =?us-ascii?Q?eBBfDI9mph6Jubon5mNpMocn3ovAs9ewvuhGlyzEo4sLuH8nlXh6hSdK4D0H?=
 =?us-ascii?Q?QFaQjdag3DW150jTwLw/OHhDhRsYOWuQcpQWcrWNvZ3jjUMyKNpVlK9v7RHZ?=
 =?us-ascii?Q?SLaqF9y6BJUmjTqrDQfoSPFX7VVv2bNJFiuHfVFU6CwO8zG7ny806vpt5qOe?=
 =?us-ascii?Q?bWQF4TcPksdWtb3xA+yp6U97/roV+tGArs/hr8yAPLtAxWMDJrBY5k6D0Ls5?=
 =?us-ascii?Q?+k2Wfj+6Fj7hv3XoPDKCXz8Q2hoWOPpNUxpscfspBDjHCXCoxgdqpR4beC5w?=
 =?us-ascii?Q?LenAwCsJBOaoALSFZlih8JUVUrjw5Y6pW2WXIsL/cMfeZnniEuiCEFQhSbGi?=
 =?us-ascii?Q?Omhu3eoqaCP7sWJkeX8+2z/bx1U5t/UtKulIk1b6ZzZXNLRi09DMIIa5lvfO?=
 =?us-ascii?Q?mrGV5mPJuAasu/Pmif7g1cvSFbgNdWuy7P/54kV2FY45+SoXxFxOBTyTpu+m?=
 =?us-ascii?Q?zi3ZiH4Gn/dxBhPytZOsJaSgmUqp5U8UiIOdefW+XObAnq+9waXuhT9PY+XA?=
 =?us-ascii?Q?+sXTFl8MKfRDbVfcB58iK5RthUnNWoo6iqtg/Ud6ka/ZyLGsHGFgCrxelB2M?=
 =?us-ascii?Q?J9ZpFl/I5ihn2fkVUTD+zZTatokUcRbYPKMTVTDhi/YpEU1Y3iLmcD7GxCZm?=
 =?us-ascii?Q?m61Fx3wsApIYusRKf/q00Cv2xX6ZXZAxsiiFJiLH8YXUXAC5oBMsQSGpV+WC?=
 =?us-ascii?Q?APGxHF/Y03kWJPrCpKaiB98REqmw2YEjrKi2idki1WA5D6qsJhIi1VzzJvNl?=
 =?us-ascii?Q?F8KHtcJmHEJ+jC48biYbr8zxOJDR9jAAoQD3+mSPid2zMgyj6VMCR2HA1MiI?=
 =?us-ascii?Q?P8BlV+nJC+aqkdbS9wQoX3Ph8aQu4WMnmaoXQUypXg69sQ0/yzZYpqM+X/DB?=
 =?us-ascii?Q?wbvPh3aJ3s3AEH8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR03MB2882.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JAhGJ6Ezwr3h24387blxMyJpt8m5dcBpCqv1UUbj/BFKVnLfEMa2qXNhQkyp?=
 =?us-ascii?Q?FZv15Rkl15zI0S6DoP/N2Dw2XyNF+lQYb2dMtiNA2S6fWfK2W78sRZsXOiBK?=
 =?us-ascii?Q?hp2wMnKlBbgtSt2EzdcfUuJegZyTtSj8U2ZxaYXGf1teDguoElVgvYTtA/4L?=
 =?us-ascii?Q?nXJ/9lsksOwugn8L3FFAtMXB3gKwxNmPnWZQF3t8YPgmn6G/VYEl6RgJc0aR?=
 =?us-ascii?Q?Tb0wfON6knKJy5xVif1UbkC9S2oLgC/N/1mjlt75OaruJ0Xg+pmjIZI6ko5k?=
 =?us-ascii?Q?Ntjva1m1Q6h1Cv9U/yhjXHqcnZcgmLno2fgk5a7eX9QLINg+IZR/g/XBjlcO?=
 =?us-ascii?Q?yyWAsRJQrK5MDOYWurhXrcmyrwQEL744pxDhF5eO2ua2pMwhmbYTFey99nT2?=
 =?us-ascii?Q?7JqXSImDvJzljEDKpKMuoQG+NBwDqtB8IysEVtLZ+elRmXXqTBGLLlqMNeTq?=
 =?us-ascii?Q?HuYvCkJRWMWeMt2TScsFgurw/EfnaGl4vOTlfPVlWUonAXliLQsua9Af0mpq?=
 =?us-ascii?Q?f/sqCcleZ65ZIob1b64MV4b0PZtoGALx4Xo91sJR3GeJH2+63HngtQjsK3jd?=
 =?us-ascii?Q?MfZqMmmiu73/8QB9TBRH1XGFqnOPfgXG2mRvWBRnSYqbpcTn/WqX6U5u85qN?=
 =?us-ascii?Q?+uWn8k8uvDiLInyrBgBkIO57j/mggmt//l8dEqQRTYtqBRQf4Ay0cwdaeDF6?=
 =?us-ascii?Q?3q0zXw4H+BfKcJPeMOlQiW+/Zr3r6+FaYOeG34p7z+Ltb9CJSx9ccr3/c4u5?=
 =?us-ascii?Q?pfflp8RHS3pGSPoTMXjOAz/bfyzQltNqV/0G067VbVeHEU3JQ5eHlbp64uPZ?=
 =?us-ascii?Q?WoLKHEbs33YeU9u499IzqwlnvwBLoX4QygTBpUtdaJ0dxlGatHx4oU/fpW9N?=
 =?us-ascii?Q?OEwYiXCPncU8slGCur9CH81OFZf1UpAfXzHYepGquPXdLndgnRX2dU8s/LKZ?=
 =?us-ascii?Q?34jsY8MQIbI9et/SiGrQgq3Zw5UhrxbMlQbXMkuq0iYE5+LUvuSgE3DY+Cue?=
 =?us-ascii?Q?XZdTn7kHn7iP8f7akzW0dzfDmH1kZNyCR195/KYHZKkP1sDIdKRvGZzziShA?=
 =?us-ascii?Q?0mfXywt+Hp9/4ZkXdeXer9yd9ZI/QZdWivgzcrs7ULWg8Mjg6AX88DTknHPX?=
 =?us-ascii?Q?z1dR+ehIR3w2rLz891G3OgHGDoHT3cxCnVN0luorxFsO0OrnmfzMPXBEnOnu?=
 =?us-ascii?Q?B5KkFzBe46IxWjUwlakNsRMN1aGhxrBygRh7M4NhkKAjMboyXhzJIIab7qN7?=
 =?us-ascii?Q?KyOT3aO5BsL5lJG/oP4Ej/YAxVJQ7NwyF5GqwLsVLRndhN+i5EUqvIHbGa7a?=
 =?us-ascii?Q?HqIbaa5j8UBa+e5+3HR1PnNY3MlbsrBjuzuUssby7kl3RUUL4xodU2qmz160?=
 =?us-ascii?Q?nlydHQHHvMRn9StYIM6ilvp9ZJGR+8TFHBWCvlVzl7/xP1WBTq77iUq6nyuE?=
 =?us-ascii?Q?JFpm0fDJTgVWUEUkCCH3E0pzak0fzpvJAl86TDcKboWSdYWh3+PVnblCXi7s?=
 =?us-ascii?Q?+qWR6u5O29CjIH3UKDwDAnID86B2N+coO5Q9D40G0g4g41us8iGz5amDMK66?=
 =?us-ascii?Q?UlZ3wx137fymITTNAEo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: festo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR03MB2882.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c762c01-09f0-42af-bb6c-08ddaf4b4e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 16:06:52.6395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1ae89fb-21b9-40bf-9d82-a10ae85a2407
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GugBxtFIii6cvnIK2xWeGeNBJV/ujlyorxIo6DwPr0r2cS1dZk456o6qvyhLxgJr5ZmK572dZioG4mSHUJuzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7454

Dear developers,

I am building EVL for my application. I came across some errors. Please see=
 below.

1.	The EVL building was completed, but meson compile failed
nick@nicklinux:~/libevl_build$ meson compile
INFO: autodetecting backend as ninja
INFO: calculating backend command to run: /usr/bin/ninja
[11/222] Compiling C object lib/libevl.so.5.0.0.p/net.c.o
FAILED: lib/libevl.so.5.0.0.p/net.c.o=20
cc -Ilib/libevl.so.5.0.0.p -Ilib -I../libevl/lib -Iinclude -I../libevl/incl=
ude -I../libevl/lib/arch/x86/include -fdiagnostics-color=3Dalways -D_FILE_O=
FFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -Wpedantic -Werror -std=3Dgnu11=
 -O2 -g -pipe -Wstrict-aliasing -Wno-unused-parameter -Wno-pedantic -D_GNU_=
SOURCE -U_FORTIFY_SOURCE -Wshadow=3Dlocal -Wstrict-prototypes -Wmissing-pro=
totypes -fPIC -pthread '-DLIBVERSION=3D"0.51"' -MD -MQ lib/libevl.so.5.0.0.=
p/net.c.o -MF lib/libevl.so.5.0.0.p/net.c.o.d -o lib/libevl.so.5.0.0.p/net.=
c.o -c ../libevl/lib/net.c
../libevl/lib/net.c: In function 'evl_net_solicit':
../libevl/lib/net.c:48:24: error: incompatible types when assigning to type=
 'struct __kernel_sockaddr_storage' from type 'struct sockaddr'
   48 |         solicit.addr =3D *peer;
      |                        ^
[16/222] Compiling C object lib/libevl.so.5.0.0.p/heap.c.o
ninja: build stopped: subcommand failed.

I changed "solicit.addr" =3D *peer" to "memcpy(&solicit.addr, peer, sizeof(=
*peer))". The EVL and libevl build completed. Am I doing the right thing th=
ere?=20
2.	Runtime settings failed
nick@nicklinux:~$ sudo latmus -t
=3D=3D latmus is now tuning the core timer, period=3D1000 microseconds (may=
 take a while) irq gravity...latmus: tuning setup failed (irq): Invalid arg=
ument
nick@nicklinux:~$ sudo /usr/local/libexec/evl/evl-start
no EVL core in kernel
               but evl test passed. Please see below.=20
nick@nicklinux:~$ sudo evl test
basic-xbuf: OK
clock-timer-periodic: OK
clone-fork-exec: OK
detach-self: OK
duplicate-element: OK
element-visibility: OK
fault: OK
fpu-preload: OK
fpu-stress: OK
heap-torture: OK
hectic: OK
mapfd: OK
monitor-deadlock: OK
monitor-deboost-stress: OK
monitor-event: OK
monitor-event-targeted: OK
monitor-event-untrack: OK
monitor-flags: OK
monitor-flags-broadcast: OK
monitor-flags-inband: OK
monitor-pi: OK
monitor-pi-deadlock: OK
monitor-pi-deboost: OK
monitor-pi-stress: OK
monitor-pp-dynamic: OK
monitor-pp-lazy: OK
monitor-pp-lower: OK
monitor-pp-nested: OK
monitor-pp-pi: OK
monitor-pp-raise: OK
monitor-pp-tryenter: OK
monitor-pp-weak: OK
monitor-recursive: OK
monitor-steal: OK
monitor-trylock: OK
monitor-wait-multiple: OK
monitor-wait-requeue: OK
observable-hm: OK
observable-inband: OK
observable-onchange: OK
observable-oob: OK
observable-race: OK
observable-thread: OK
observable-unicast: OK
poll-close: OK
poll-flags: OK
poll-many: OK
poll-multiple: OK
poll-nested: OK
poll-observable-inband: OK
poll-observable-oob: OK
poll-sem: OK
poll-xbuf: OK
proxy-echo: OK
proxy-eventfd: OK
proxy-pipe: OK
proxy-poll: OK
ring-spray: OK
rwlock-read: OK
rwlock-write: OK
../libevl/tests/sched-quota-accuracy.c:213: FAILED: evl_control_sched(44, &=
p, &q, test_cpu) (=3DOperation not supported)
sched-quota-accuracy: no kernel support
../libevl/tests/sched-tp-accuracy.c:222: FAILED: evl_control_sched(45, p, (=
(void *)0), test_cpu) (=3DOperation not supported)
sched-tp-accuracy: no kernel support
../libevl/tests/sched-tp-overrun.c:220: FAILED: evl_control_sched(45, p, ((=
void *)0), test_cpu) (=3DOperation not supported)
sched-tp-overrun: no kernel support
sem-close-unblock: OK
sem-flush: OK
sem-timedwait: OK
sem-wait: OK
simple-clone: OK
stax-lock: OK
stax-warn: OK
thread-mode-bits: OK
I am not sure how the installation goes. Please advise. Thank you in advanc=
e.
Best Regards,
Nick Xie
