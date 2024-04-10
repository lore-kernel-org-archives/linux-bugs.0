Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EEF17996D
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765714; cv=none; b=FNIOvIPoX0X2jPK5ARaYARH+jZFliWwYzCHZoXz6QhKrMik2XH9kMe9zEscYpmXDWDWZ4+QmfJmckdKNhH4nMyUAMoY5i6Y0kkMCuPpTK5itAUFE70ZOYFORFCzCOucjqz0EiLAJTwtDD3qYsC89ztRbTpckCBPoaR/iXfVaWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765714; c=relaxed/simple;
	bh=1axxyqN2mCjvYreZZ+wPk4fLIgCi8B90x2onkwcvovA=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=h4KqRm+vB72fPSnIn8bIrgu7Dpog9mQlJ2AAl8F64dzbZca4X29yuqz4HfbtW8dtiJef0MRt4XBCHduYgr1hqMW0H81rN/JDjkjYbvbGv53gkHDXrToGwUoGOaQOQlxXDVPoe/4DqXzK4TYj2Wa2cnqbw0W7tr/xfojvU58PK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhul0xR3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhul0xR3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 375E3C43399
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712765714;
	bh=1axxyqN2mCjvYreZZ+wPk4fLIgCi8B90x2onkwcvovA=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=rhul0xR3baKynp0eq6sVBKauECk3Rvp5qEkLMXUpEYuePI/RtXR3FtWdsKkJyWbmF
	 xWfDUpRewGhlth/VcVeVfgKN0dCkGtB8wg74NbyyJJlQQJr/DUuHpQWD/f7hgneDQF
	 PMH3iqYEW6wDuAmVK8s17f+5Ad6uKJdLRS3eWxKqhKRq+KtnqOB8Sx+uE+3N6f8hjG
	 jMl+1WNOg1xfWw31T90LyAX5fGtcxpJ2AXZztmCcN4KisktCyyXMqX2YNlQo3l0SQO
	 fKx/gNDvE89Qq2y5vJsHqEpfNl2FNOFrhVSdvk+Pite9LtWwrRWqciMbcqDU50FOSx
	 18QiH2htIbviQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B8E6D60311
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 16:15:12 +0000
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
Message-ID: <20240410-b218698c2-5b6e77f30c56@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

regressions writes via Kernel.org Bugzilla:

Ohh, and having a bit more log output from right before the backtrace is shown might be good as well.

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

