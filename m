Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D1179965
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765714; cv=none; b=lOf5fPUjhBjbDkvry5T+AZiqpK0xbqab/cn57a59+CYyv1zStFcRaJdIVfHzS34KNmimDnLO7IvrPTKOtg6QJXZ16GWMw9FrCD7cp133IoFh8rZ+iN9iuTjWjDCNsqweYvmvIkrVvndAsL2bgdsKn/QUeuD2h4tu4fQO5OW+m3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765714; c=relaxed/simple;
	bh=c3mBZSnO8jnGv/QXoxhkQtpiH3KuqK73LmqQGUBO3fc=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:Subject; b=Z0WDvYuBKnGGhaK6G03uw0cDMJeQ2yWjAbMYEjEnyzsG70bS+K7hpXfKfuKmqUU/ujfh+Jq1V2LYk0Y8suTR5rAG88uoF/UqnGwMqfQxZQYFCXr5cEY4SQhYHU51FOzm7Yo6kRyXgzjOmenVdkrYag8YHRlLxDM7DIugSXf6nx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYii3Z9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYii3Z9P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 259DDC43394
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712765714;
	bh=c3mBZSnO8jnGv/QXoxhkQtpiH3KuqK73LmqQGUBO3fc=;
	h=Date:From:To:Subject:From;
	b=IYii3Z9Ppa5QTME4Es0d7ksEYhSsg1CnhvGXzWqI66fomS8MceqDv3lNV0MaImTdG
	 th/TfpHOQOg3omgW6dWYr1Y1obROkOwX6yQD/3AcpQtsG+za5StVEkevj7eH4DPhwI
	 BgWm/WmBRRW7cfzIN1OAcmnkMAjknm/UBzqhB6vGvIAzclHCmGP1jYD0HuAIXMH9C3
	 JkZeHyu9YekPaO9uarP9498PyE+AdVsxz1Cfe6O3gVj5ltdI5eUAuBrjEB4qTVS79n
	 w9+nxJj7SQ+uurA4mwzBLWlBT6SpwtGSEeTkXQ+Yy1U+i4hWkCbXk6H9JPW/JVuopl
	 X7gKYDvflseRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FBBAD6030E
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 16:15:10 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev
Message-ID: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

xiangfeix.ma added an attachment on Kernel.org Bugzilla:

Created attachment 306112
guest error log

Environment:

Host OS: CentOS 9

Host kernel: 6.9.0-rc1

KVM commit: 9bc60f73

Qemu commit: e5c6528d

Guest kernel: 6.9-rc2

Guest commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f

Guest repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git


Bug detail description: 

When hot adding a vCPU to the guest, the guest happens Call Trace and reboot.

Latest successful guest kernel version: 6.8.0-rc7 (commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72).


Reproduce steps: 

1. Create guest:

qemu-system-x86_64 -accel kvm -cpu host -smp 4,maxcpus=128 -drive file=/share/xvs/var/tmp-img_vcpu_hot_add_1712412537,if=none,id=virtio-disk0 -device virtio-blk-pci,drive=virtio-disk0,bootindex=0 -m 4096 -monitor pty -daemonize -vnc :16147 -device virtio-net-pci,netdev=nic0,mac=00:c0:82:16:fa:b0 -netdev tap,id=nic0,br=virbr0,helper=/usr/local/libexec/qemu-bridge-helper,vhost=on

2. Add vCPU to guest

echo 'device_add driver=host-x86_64-cpu,socket-id=0,core-id=4,thread-id=0' > /dev/pts/2

cat /dev/pts/2


Error log: 

[   49.782913] Call Trace:
[   49.783039]  <TASK>
[   49.783147]  ? __die+0x24/0x70
[   49.783309]  ? page_fault_oops+0x82/0x150
[   49.783518]  ? kernelmode_fixup_or_oops+0x84/0x110
[   49.783753]  ? exc_page_fault+0xb9/0x160
[   49.783948]  ? asm_exc_page_fault+0x26/0x30
[   49.784144]  ? cpu_update_apic+0x1c/0x70
[   49.784327]  generic_processor_info+0x7e/0x160
[   49.784541]  acpi_register_lapic+0x19/0x80
[   49.784732]  acpi_map_cpu+0x26/0x90
[   49.784896]  acpi_processor_get_info+0x256/0x490
[   49.785344]  acpi_processor_add+0xb9/0x1f0
[   49.785760]  acpi_bus_attach+0x13b/0x220
[   49.786158]  acpi_bus_scan+0x7e/0x1e0
[   49.786548]  acpi_device_hotplug+0x198/0x2b0
[   49.786963]  acpi_hotplug_work_fn+0x1e/0x30
[   49.787363]  process_one_work+0x159/0x370
[   49.787790]  worker_thread+0x302/0x420
[   49.788184]  ? __pfx_worker_thread+0x10/0x10
[   49.788592]  kthread+0xe3/0x120
[   49.788955]  ? __pfx_kthread+0x10/0x10
[   49.789335]  ret_from_fork+0x31/0x50
[   49.789720]  ? __pfx_kthread+0x10/0x10
[   49.790100]  ret_from_fork_asm+0x1b/0x30
[   49.790491]  </TASK>

File: serial_error_guest.log (text/plain)
Size: 98.02 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=306112
---
guest error log

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

