Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68053179976
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765714; cv=none; b=TCI64bhEKMvNgwAY1lPaDZpOie5JIKvaQMjqMAgm6vHEIKXYEkgedg03XJ6VOYweXj1MrvpDwrcXHwKbow0e0YqhtxeSNNA0SWMFNhuGXATYxROuWdntGFa58g8SgX4H6MQa/Rk/6E9mtNVEG5nlhP9qM6PZTfbvWpaxGl2jJc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765714; c=relaxed/simple;
	bh=izrAFAYHFfR8qPuNo6JJJowTmjF08790/T/mJ1sgbz0=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=Jc6FEAEe+LI+UTfyVBTyGGyPwhlSdmcJYbEotl/T9lxM8/N0orUMaoDUPtwoxAVTjqB76xi+lhqmqtDDucCeplj5n++S8XxJn6027Ho7ty/YFe3OOk8WG++PnQ2JH39lnohweVEush6j2j/g2H8j/X3gK4g+D2YdrZaLg3eKDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAeiK/QA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAeiK/QA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6CCC433B1
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712765714;
	bh=izrAFAYHFfR8qPuNo6JJJowTmjF08790/T/mJ1sgbz0=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=eAeiK/QAkr9hZHg+6KVBs05zXN1e0HWMR/oZ/E6B3hW/UjshYy4kkAnzp7L+zgZZI
	 IUIcBmwU0L60uTerh3BfyabOWTZGDJgSOIw0tBWvlpYaK2G2vjZKcC3/BT+u8iGTyd
	 42fBniiY6YKxg2TW+v7S/FArze1F+I973hABh9senj3Aw3Y5bQT1Ty59dxb+pVh/rV
	 tEo3/+9MF33AOaaN5GacXAMG1yPaPMgXVGM6gVBOsqJQh6p8EPj9unlesnfLw9BOZW
	 kpp9oC3MCviSQBHTiq2ofxZOP0LxFQOTl+Yk1F3FEmtW+CVPVjZCK+jb/1wxjEM1cG
	 Vc/17dh7zrjWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45B21D6030E
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 16:15:14 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev
Message-ID: <20240410-b218698c4-d53a1ce0df88@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

dongli.zhang writes via Kernel.org Bugzilla:

I can reproduce as well. But the callstack is different. It finally reaches at topo_set_cpuids().

/home/zhang/kvm/qemu-8.2.0/build/qemu-system-x86_64 \
-hda disk.qcow2 -m 8G -smp 4,maxcpus=128 -vnc :5 -enable-kvm -cpu host \
-netdev user,id=user0,hostfwd=tcp::5025-:22 \
-device virtio-net-pci,netdev=user0,id=net0,mac=12:14:10:12:14:16,bus=pci.0,addr=0x3 \
-kernel /home/zhang/img/debug/mainline-linux/arch/x86_64/boot/bzImage \
-append "root=/dev/sda3 init=/sbin/init text loglevel=7 console=ttyS0" \
-monitor stdio

(qemu) device_add driver=host-x86_64-cpu,socket-id=0,core-id=4,thread-id=0


[   27.060885] BUG: unable to handle page fault for address: ffffffff83a69778
[   27.061954] #PF: supervisor write access in kernel mode
[   27.062604] #PF: error_code(0x0003) - permissions violation
[   27.063286] PGD 40c49067 P4D 40c49067 PUD 40c4a063 PMD 102213063 PTE 8000000040a69021
[   27.064273] Oops: 0003 [#1] PREEMPT SMP PTI
[   27.064799] CPU: 2 PID: 39 Comm: kworker/u256:1 Not tainted 6.9.0-rc3 #1
[   27.065611] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   27.066992] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
[   27.067669] RIP: 0010:topo_set_cpuids+0x26/0x70
[   27.068242] Code: 90 90 90 90 48 8b 05 d9 bd da 01 48 85 c0 74 31 89 ff 48 8d 04 b8 89 30 48 8b 05 bd bd da 01 48 85 c0 74 3c 48 8d 04 b8 89 10 <f0> 48 0f ab 3d 79 9e 97 01 f0 48 0f ab 3d 40 03 df 01 c3 cc cc cc
[   27.070471] RSP: 0018:ffffc3980034bc28 EFLAGS: 00010286
[   27.071130] RAX: ffffa0bbb6f15160 RBX: 0000000000000004 RCX: 0000000000000040
[   27.072004] RDX: 0000000000000004 RSI: 0000000000000004 RDI: 0000000000000004
[   27.072858] RBP: ffffa0ba80d68540 R08: 000000000001d4c0 R09: 0000000000000001
[   27.073713] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000004
[   27.074565] R13: ffffa0ba883b6c10 R14: ffffa0ba809a9040 R15: 0000000000000000
[   27.075418] FS:  0000000000000000(0000) GS:ffffa0bbb6e80000(0000) knlGS:0000000000000000
[   27.076424] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.077121] CR2: ffffffff83a69778 CR3: 000000010f946006 CR4: 0000000000370ef0
[   27.077976] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   27.078830] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   27.079685] Call Trace:
[   27.080031]  <TASK>
[   27.080341]  ? __die+0x1f/0x70
[   27.080755]  ? page_fault_oops+0x17b/0x490
[   27.081305]  ? search_exception_tables+0x37/0x50
[   27.081897]  ? exc_page_fault+0xba/0x160
[   27.082402]  ? asm_exc_page_fault+0x26/0x30
[   27.082929]  ? topo_set_cpuids+0x26/0x70
[   27.083432]  topology_hotplug_apic+0x54/0xa0
[   27.083979]  acpi_map_cpu+0x1c/0x80
[   27.084437]  acpi_processor_add+0x361/0x630
[   27.084968]  acpi_bus_attach+0x151/0x230
[   27.085473]  ? __pfx_acpi_dev_for_one_check+0x10/0x10
[   27.086091]  device_for_each_child+0x68/0xb0
[   27.086638]  acpi_dev_for_each_child+0x37/0x60
[   27.087197]  ? __pfx_acpi_bus_attach+0x10/0x10
[   27.087757]  acpi_bus_attach+0x89/0x230
[   27.088251]  acpi_bus_scan+0x77/0x1f0
[   27.088753]  acpi_scan_rescan_bus+0x3c/0x70
[   27.089300]  acpi_device_hotplug+0x3a3/0x480
[   27.089840]  acpi_hotplug_work_fn+0x19/0x30
[   27.090369]  process_one_work+0x14c/0x360
[   27.090880]  worker_thread+0x2c5/0x3d0
[   27.091387]  ? __pfx_worker_thread+0x10/0x10
[   27.091941]  kthread+0xd3/0x100
[   27.092361]  ? __pfx_kthread+0x10/0x10
[   27.092843]  ret_from_fork+0x2f/0x50
[   27.093309]  ? __pfx_kthread+0x10/0x10
[   27.093788]  ret_from_fork_asm+0x1a/0x30
[   27.094293]  </TASK>
[   27.094601] Modules linked in:
[   27.095007] CR2: ffffffff83a69778
[   27.095444] ---[ end trace 0000000000000000 ]---
[   27.096018] RIP: 0010:topo_set_cpuids+0x26/0x70
[   27.096590] Code: 90 90 90 90 48 8b 05 d9 bd da 01 48 85 c0 74 31 89 ff 48 8d 04 b8 89 30 48 8b 05 bd bd da 01 48 85 c0 74 3c 48 8d 04 b8 89 10 <f0> 48 0f ab 3d 79 9e 97 01 f0 48 0f ab 3d 40 03 df 01 c3 cc cc cc
[   27.098808] RSP: 0018:ffffc3980034bc28 EFLAGS: 00010286
[   27.099452] RAX: ffffa0bbb6f15160 RBX: 0000000000000004 RCX: 0000000000000040
[   27.100305] RDX: 0000000000000004 RSI: 0000000000000004 RDI: 0000000000000004
[   27.101153] RBP: ffffa0ba80d68540 R08: 000000000001d4c0 R09: 0000000000000001
[   27.102141] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000004
[   27.102995] R13: ffffa0ba883b6c10 R14: ffffa0ba809a9040 R15: 0000000000000000
[   27.103851] FS:  0000000000000000(0000) GS:ffffa0bbb6e80000(0000) knlGS:0000000000000000
[   27.104857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.105559] CR2: ffffffff83a69778 CR3: 000000010f946006 CR4: 0000000000370ef0
[   27.106411] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   27.107264] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

----------------------

I am not able to reproduce with the below:

x86/topology: Don't update cpu_possible_map in topo_set_cpuids()
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/urgent&id=a9025cd1c673a8d6eefc79d911075b8b452eba8f

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

