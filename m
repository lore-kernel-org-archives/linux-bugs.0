Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BA8C11
	for <bugs@lists.linux.dev>; Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7254CC433EF;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680285589;
	bh=kxrEokNtExfi1MTgJoq8SLShSwExIhd4YcGyymomBw0=;
	h=From:To:Subject:Date:From;
	b=AbtVwZZWac1/Rv+Gn7/PxORmF7aLXzxETaCNXDURmoD+nAswvZ9Jw1jq9/NGBLWlN
	 bJD3INzwMuC+n9gC2oBo26GLp33PdnmYrPbq9FbgbYOWouwZacO6BAChHSJiGQFwoX
	 T27gX7KIOmYzmt7QO8bkH6vufSTWwtpuvKTAtYOYb1dZ2to4aqM66G7oNpLv9AB6zB
	 4/nSglWirx7bDlR7/LvH70BiGcLWqJj6xaKuzTGA+mXedRl459VpwUOOoxBfjYEUaf
	 w2RkGCzgoD913t+OOEDYOy2jH1MywgfOgf1Z6ZdmBbCDjSlY01RvVDkLhzHZuPq2yU
	 Tgnni9DtyAOSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A7FDC0C40E;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: perex@perex.cz, bugs@lists.linux.dev, tiwai@suse.com, 
 alsa-devel@alsa-project.org
Message-ID: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
Subject: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 31 Mar 2023 17:59:49 +0000 (UTC)

rakic.iwan writes via Kernel.org Bugzilla:

Hello,

I must mention right at the beginning that I tried all the solutions I found on the forums, but without success.

The problem exists only with the speakers on the laptop, the microphone works, as do the headphones.

I extracted the audio dump from windows and compared it with the dump from Linux and thus created this pinfcg below.

Please, can someone add a kernel fix for ROG Zephyrus S17 GX701LWS_GX701LWS, Subsystem Id: 0x10431f01?

```

[codec]

0x10ec0294 0x10431f01 0

[pincfg]

0x19 0x03A11050

0x1a 0x03A11C30

```

This is what a quirk should look like:

+SND_PCI_QUIRK(0x1043, 0x1f01, “ASUS GX701L”, ALC294_FIXUP_ASUS_SPK)

[ 2.396344] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC294: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[ 2.396348] snd_hda_codec_realtek hdaudioC0D0: speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[ 2.396349] snd_hda_codec_realtek hdaudioC0D0: hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[ 2.396350] snd_hda_codec_realtek hdaudioC0D0: mono: mono_out=0x0
[ 2.396351] snd_hda_codec_realtek hdaudioC0D0: inputs:
[ 2.396352] snd_hda_codec_realtek hdaudioC0D0: Headset Mic=0x19
[ 2.396353] snd_hda_codec_realtek hdaudioC0D0: Internal Mic=0x12




    hwinfo --sound  :heavy_check_mark:
    22: PCI 1f.3: 0403 Audio device
    [Created at pci.386]
    Unique ID: nS1_.Qb7ky1jjQRD
    SysFS ID: /devices/pci0000:00/0000:00:1f.3
    SysFS BusID: 0000:00:1f.3
    Hardware Class: sound
    Model: “Intel Comet Lake PCH cAVS”
    Vendor: pci 0x8086 “Intel Corporation”
    Device: pci 0x06c8 “Comet Lake PCH cAVS”
    SubVendor: pci 0x1043 “ASUSTeK Computer Inc.”
    SubDevice: pci 0x1f01
    Driver: “snd_hda_intel”
    Driver Modules: “snd_hda_intel”
    Memory Range: 0x94300000-0x94303fff (rw,non-prefetchable)
    Memory Range: 0x94100000-0x941fffff (rw,non-prefetchable)
    IRQ: 157 (817 events)
    Module Alias: “pci:v00008086d000006C8sv00001043sd00001F01bc04sc03i80”
    Driver Info #0:
    Driver Status: snd_hda_intel is active
    Driver Activation Cmd: “modprobe snd_hda_intel”
    Driver Info #1:
    Driver Status: snd_soc_skl is active
    Driver Activation Cmd: “modprobe snd_soc_skl”
    Driver Info #2:
    Driver Status: snd_sof_pci_intel_cnl is active
    Driver Activation Cmd: “modprobe snd_sof_pci_intel_cnl”
    Config Status: cfg=new, avail=yes, need=no, active=unknown

    29: PCI 100.1: 0403 Audio device
    [Created at pci.386]
    Unique ID: NXNs.SkelvpPm387
    Parent ID: vSkL.ZFPYIgTFUyC
    SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.1
    SysFS BusID: 0000:01:00.1
    Hardware Class: sound
    Model: “nVidia TU104 HD Audio Controller”
    Vendor: pci 0x10de “nVidia Corporation”
    Device: pci 0x10f8 “TU104 HD Audio Controller”
    SubVendor: pci 0x1043 “ASUSTeK Computer Inc.”
    SubDevice: pci 0x186f
    Revision: 0xa1
    Driver: “snd_hda_intel”
    Driver Modules: “snd_hda_intel”
    Memory Range: 0x94080000-0x94083fff (rw,non-prefetchable)
    IRQ: 17 (1698 events)
    Module Alias: “pci:v000010DEd000010F8sv00001043sd0000186Fbc04sc03i00”
    Driver Info #0:
    Driver Status: snd_hda_intel is active
    Driver Activation Cmd: “modprobe snd_hda_intel”
    Config Status: cfg=new, avail=yes, need=no, active=unknown
    Attached to: #13 (PCI bridge)


If you need any more data, or smth just say so.

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

