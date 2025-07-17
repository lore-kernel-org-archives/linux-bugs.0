Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73A2E090C
	for <bugs@lists.linux.dev>; Thu, 17 Jul 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752758087; cv=none; b=Pw2Hjbz6Y0XOVZVTRyF3lKJROCn+/8+vq3kitTEJiFB2UhH5AmNjGnlQd61ZZocaAqMgn0Pz23xkwlZ54fgRUwKq0Z+PXZAuwgtwkbx/Vw4s6x103usEX/Z/67wLkcqQNW1oE9l3kj70YzqzTA+w6Bp2w41i/Mj7l0VBstlw44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752758087; c=relaxed/simple;
	bh=B1YcIXcXHVFB4FuRRJOQJwwi4NqFplSHFDdWkYlmwD0=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=NI3Z7ts7GpDQ2fzMLuMFvsdCoTN+gn8XO2YdUMsLCgAnXmpB+25JBY5uDjXn+5GuTYrzMZTUR3Ngk7UdkWvbhUo5a7x5wBG0wz6eEL5aoDtRyhU//2SbSnua0KC5cqR1lLXUFoV4ASTFHFlTzuKrCr3h+VWrA/+l9AHlYi5aqWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+TOZSCQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+TOZSCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91949C4CEE3;
	Thu, 17 Jul 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752758087;
	bh=B1YcIXcXHVFB4FuRRJOQJwwi4NqFplSHFDdWkYlmwD0=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=R+TOZSCQaRuM/uBEiH0194NCexnHyfluu0fWM1M5XazHLpNqAqPUw9KJoarM1py92
	 pbWLWQiD93oA420jpCGvrUUJxKX1OubcnJiHj6aFgAlcZwJEMU2uE66bvC1TtAmljB
	 XAjpzEGA/ee/nN8ft6ZkI4GNi9QxGsYojcCdYpb/2hd7dLAVHb3ZixzcXtTQOKLzMS
	 2J/J4D4bPJWFs7fWHoqNeZKNaFl3j4m/s2HLWQSzQT8tRx1mqYMnsVfy3br0so7kz8
	 yVAKJ2vP4NBqOlTWzIoVaChwqdjecT0e1T/xpcfPqzfCwnrGbb4mZ962iMH/GV/hPi
	 bi9t3VQlL9ubQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1BB9383BF47;
	Thu, 17 Jul 2025 13:15:08 +0000 (UTC)
From: Ali Polatel via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 17 Jul 2025 13:15:08 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: bugs@lists.linux.dev, linux-mm@kvack.org, akpm@linux-foundation.org
Message-ID: <20250717-b219227c5-426a315d1e51@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Ali Polatel added an attachment on Kernel.org Bugzilla:

Created attachment 308384
Proof-of-Concept: MDWE bypass via file-backed RX mapping on Linux x86_64

Attached is a more complete POC which (ab)uses this bug to pop a shell. If I am correct, this means as an attacker I can use this to inject shellcode to most file-backed memory mappings and have it executed despite MDWE. Tested successfully on Linux-6.15.4 on x86_64.

File: mdwe-bypass-poc.c (text/x-csrc)
Size: 1.94 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=308384
---
Proof-of-Concept: MDWE bypass via file-backed RX mapping on Linux x86_64

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

