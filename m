Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917138F48
	for <bugs@lists.linux.dev>; Tue, 11 Apr 2023 15:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4965EC433A1;
	Tue, 11 Apr 2023 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681225495;
	bh=7WIyVeb9XzClyLWUvvV5p3kO/EMToSSNiNmVoHs1IG8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UzmEBprgpf9xgOEcYRkIKoBq+QSWCf/bGHsDgkUb6V2fdMIpFEyL0j0o6ljPZPwBa
	 YQTt+UrK5v2pEVdRL3J7ysjasXzLREAw9iZKfZItpVbcZQEui+3wtcAphdttbOJLyj
	 08MqARvVUWewD9r3dB/6kK87s7pc7dNGRZKUO2No+BHElV2GB3dvOcfrdRMM/kpuRY
	 bqj8RcOLVTkIvwaXHeNLbOMDveS8OBghipvoLgQF4ve9TDA8GkYJ9chyS/Rk1+MKbM
	 wn7Wmo9SmteSvtWMLFkVR8Ry46yiDTCgIqRzwVSuUkkFmzxChrOOxKFd+DjOOxNHOS
	 dxzi9XKOePnyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32883E52441;
	Tue, 11 Apr 2023 15:04:55 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tj@kernel.org, bugs@lists.linux.dev, cgroups@vger.kernel.org, 
 hannes@cmpxchg.org, lizefan.x@bytedance.com
Message-ID: <20230411-b217305c1-d58d491bf9b5@bugzilla.kernel.org>
In-Reply-To: <20230411-b217305c0-44d643ccee27@bugzilla.kernel.org>
References: <20230411-b217305c0-44d643ccee27@bugzilla.kernel.org>
Subject: Re: When processes are forked using clone3 to a cgroup in cgroup
 v2 with a specified cpuset.cpus, the cpuset.cpus doesn't take an effect to
 the new processes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Tue, 11 Apr 2023 15:04:55 +0000 (UTC)

tcao34 added a new attachment via Kernel.org Bugzilla.
You can download it by following the link below.

File: config-6.3.0-rc5-master (text/plain)
Size: 266.54 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=304089
---
Config file we used

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

