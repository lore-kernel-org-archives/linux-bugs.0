Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1946F30B
	for <bugs@lists.linux.dev>; Thu, 12 Sep 2024 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175438; cv=none; b=uknEq6dq00DtHcRiYhWE2C62xTOtfAzpSL/GkxAtoP3ChDRwfeg15soErdD5eDm9GikpvwLNTjE2UQn9oFGJBkW6w7Mt4VUwR9Yon3q0k3iJxPgvrso9YHL1V8J7YE6BfF4M0OgX46W2NFUB2UwkObV5LLDSWZTw0lM4JGY+Q8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175438; c=relaxed/simple;
	bh=cGS80oDgBo4AFvk2xrRLx9dibznv4g5D0hKMt9bF0NE=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=Bcv/XVjMkg/CAgmdrKq0UwodyqP6uLZ14Uir1BH6V5NC4o1NA93IRlO8u+AJXL4UQcl6nF8zrt1ibJG0A+jKUefyRRtCKzcp52BkRFIzNh0sMvNjdxDdbmRO5ob8kqrClSwhXODVmpyvz6lHEhxM2jUkmx+l1HAziwAGJeP50Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE6Hs9J2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE6Hs9J2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E67DC4CEC3;
	Thu, 12 Sep 2024 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175438;
	bh=cGS80oDgBo4AFvk2xrRLx9dibznv4g5D0hKMt9bF0NE=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=DE6Hs9J20f2A3vqy7nZatwTkyOuDJt/9Op+Z4UwrgakTyrG9/j0fA0YLAwSjY3IOf
	 EZoJ6g6VOxJInGs3TWQDyv57JupyvdQ5aHX7L9TLBbvoo1GYPxsUM4s3/IZxpL++JL
	 gdGzjCX7q7zSnPk42smE56W2H70V5n/CI4q2bMQ/qQwN1h3wHcOFsE/seE1+PRiJdi
	 n2kKvKTyZqboXtc4HbvVV78YEr0iJrgWW3P0blkAAtpXBuDYcbN1xK/jgoM60KC92H
	 bapLjdEzAk55RiQxj6VzonmvaS1KMGYGIlc8oL369ugNFC7OxY21wEtdktLH9SYtlk
	 AZkwD15Cl9XRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717473806644;
	Thu, 12 Sep 2024 21:10:40 +0000 (UTC)
Date: Thu, 12 Sep 2024 21:10:10 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: Bugspray Bot <bugbot@kernel.org>
To: akpm@linux-foundation.org, bugs@lists.linux.dev, linux-mm@kvack.org
Message-ID: <20240912-b219227c1-1be2c7de9e2b@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

alip writes via Kernel.org Bugzilla:

I am sorry, I forgot to post the output of the PoC.
On a system with Linux kernel 6.8 I get:
⇒  ./a.out
[*] Mapped Content: malicious code
[!] RX memory updated thru a backing file write under MDWE.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

