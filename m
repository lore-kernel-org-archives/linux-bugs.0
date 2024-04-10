Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44713179968
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765714; cv=none; b=IcF7jqN+QbWWPdZBhO1CtjKsMtKpt6cUk9u5XsqBf2dzTeCygZTgZGU01Pr5BtHYnL1zmXnvsPA7HWJW5eRpEJ0tJFj3W/DlNAxdE6970Nay+R8oquIGSZOHZjOofMOZ6sIqTdX4SIS4GrIPWJp7XoqDHIW7c1xRZcr23Kf832c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765714; c=relaxed/simple;
	bh=7GYWDZ8fCJ0pBzvXodsoJtxCsaw8Xc02p8o6vw1onGs=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=coZ3k4Pgh/JNdrGmzgIHdcjHE4IYyMhH4fzTnuvCtNQ6bZmU69OOaPNZCI25HORWwRLhr6eOi7srpU3nJ96MiB7p4Lxy9uM6mSNmATgImKstwX3BK4G6tg6tGjrPgifbmlpbaCsISbUxp9Nd3Jg17P9043f5RpNWtJp8L1Gzojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frd9SdFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frd9SdFN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28BBDC43390
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712765714;
	bh=7GYWDZ8fCJ0pBzvXodsoJtxCsaw8Xc02p8o6vw1onGs=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=frd9SdFNIkUdCCLDDYVcB1nluPxbDPc6WzthYiv1RUNS3KU+cnC2w0xinDy0O2wSk
	 PFJmo2xGIHXj1e2tSWoYKc7LTV49A4lDlubRLeUjNMgT60M3GKwxiA1EvvcrJZdBSw
	 hDn8zwOFbf6evC4G0bjITbPkjANb8KXUojPhLOIt/SC0iyrW4ZmJ9K406SqjxZA3lZ
	 b05a1rdLXhBGUxjU6x85k3HN5tVKUvNHjip+vcdTFW+eBji1RBe+dr5rKcedrn6A4i
	 wJKYZKo8fna+qOrObVD7HGmuZMhBSAWkbrlTWUYSmot0VhgO5nJW7opCC5YJVdBn4Y
	 cbfyB8Ij/0Pog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E3EBC395F6
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 16:15:11 +0000
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
Message-ID: <20240410-b218698c1-e92ce3d67477@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

regressions writes via Kernel.org Bugzilla:

Reminder: this bug tracker is most likely the wrong place for this sort of bug. And I'm not a developer involved in any of the subsystems that might cause this, so anything I might suggest might be sending you sideways.

I fear we might a bisection (see https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html) in the guest to pin this down. But I will prod a developer that recently changed something that might cause this, maybe he will take a look

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

