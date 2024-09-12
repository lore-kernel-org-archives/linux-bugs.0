Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E796F30B
	for <bugs@lists.linux.dev>; Thu, 12 Sep 2024 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175453; cv=none; b=nD5U91LcNrAuPA37T0P1l1xN7NFdPlYBy0oDbKyxqlxaedyHow6ogRP6nvKtTf7lZ2OuP22S3VaFSNrNkuFin281gcL7VrqI4+aGtK9hfMwgxsjZk1eAG/ZhvPDlw+K7Yeu8vw2i6No61Ue5xr+lsXZ1zZJgd6SIJ3ANWPDgdDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175453; c=relaxed/simple;
	bh=/JyNX643AHmG0uqEE+FAe4O4pBOLAsYAKrChOw1X3HI=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=dVj01XR/tr/OdIkynoBKHQosQSHtTjvZL+pBaZTktmN/tAkAH6qsCFUY/zNnca5LkL9Nsi0V1CVrsCclkje6JpZb+ssg4TGn6xjs7FgxFb2cLlsCqCLr7+FiuXcVmjkSiEVZfBGWw2hLPPjjlmeyeeI6lw/5Ioqn1kAjLHFimhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HskOr6J4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HskOr6J4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092C7C4CEC5;
	Thu, 12 Sep 2024 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175453;
	bh=/JyNX643AHmG0uqEE+FAe4O4pBOLAsYAKrChOw1X3HI=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=HskOr6J4CRW+1GfZc0iYE524r/ahFdMsB959w8W0zZke9avzWrtiJqnuWQCn50pMm
	 wV4zsjIQvGzUKuGL/GAsEHReFZ7oB9tlhgAR3z4Ai9dt5KPlA2s6wK4UAGjxW9x1Xc
	 3qto1kUScrK/y7nZDBCLe6umlsvLWh5H/sPoJedEvyT82Z5q/ccncDTA/YveYXOP6K
	 iuJp7xbKHvzHNoafiih7yEJnIghJK3glHpR2+EV5uJ8WPBFfQEzYipYtKNY6aA+1Vo
	 hvxsBmwjw9rHbOFIEIgf4mHytqPwQVoNKeEM8zbKt3xtBEBrsEg4Gw9eSuMkZVa31N
	 vcNkBzYVnht7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713363806644;
	Thu, 12 Sep 2024 21:10:55 +0000 (UTC)
Date: Thu, 12 Sep 2024 21:10:11 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: akpm@linux-foundation.org, bugs@lists.linux.dev, linux-mm@kvack.org
Message-ID: <20240912-b219227c2-cbc539461a3e@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

alip writes via Kernel.org Bugzilla:

Note, this is trivial to mitigate with a seccomp-bpf filter.
Sample code in Rust. Given "ctx" is a seccomp filter context:

// Prevent executable shared memory.
ctx.add_rule_conditional(
    ScmpAction::KillProcess,
    ScmpSyscall::new("mmap"), // same applies for mmap2.
    &[scmp_cmp!($arg2 & PROT_EXEC == PROT_EXEC),
      scmp_cmp!($arg3 & MAP_SHARED == MAP_SHARED)],
)?;

This is what syd[1] does since version 3.15.1

[1]: https://man.exherbolinux.org/syd.7.html#Advanced_Memory_Protection_Mechanisms

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

