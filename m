Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DA181337
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 19:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712778615; cv=none; b=RRwgADw/2iwpCFRhFEVhH2z8XGu6Wzjudw+7G6gXUkd6dfgoKvq8lHHB7MTFhBMDcXR6u1vMEpWLpkNVkS/sevjIqdZjiQkM+CzoEASlXAHqTud9eNpOwfwIQnbjNAkKPs4qC2RXC0YPF3dRDWsOuzIEZ0/VW1JpUvbkmsx/MDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712778615; c=relaxed/simple;
	bh=bVZHdbnBis+x/+HWixpvuqyhsj27fUbu1S8AohexQY0=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=AAeiDm2SsBCbfgm1Zy8lrKyW7I3i/BXtRxkBf1ql23ybcZkwwf1URrpHW4HwLec877ezh6NB+6bBN/7sVmgSZweMYqiKlgrRGRDnMiEmSKb8VAcnxeQG5y3dwmmy/dPCElV6DuYH3/HWcM/GRuF0gLLPaF2z/SCH7cFuqA9BI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGMjN76X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGMjN76X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EBA5C433C7
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712778615;
	bh=bVZHdbnBis+x/+HWixpvuqyhsj27fUbu1S8AohexQY0=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=dGMjN76XG3sLTGuFvTmhd42qXII6WR8yel3uUWL3GC0vYb415sxDPGpKuKL9XRwYu
	 4cACcuZiBlk/MhfCURwG5MjjmO5w1/8JRgnQyaVfQtLoN+O1ax9Y6Rz56p2OPwSxGB
	 nxEaKCUCcTt1qjGKNCciDVWVBY3fp85AaiwvvnuvS8y1EvqwqmnCuox/Ml08KH1WWj
	 CKo6KQ9QegqvsQQuTKcx+DEWe28KY1h4tnDcl4xkum3MTK2zaMyzqPhAYIxsenqqAo
	 V+L7XQlwO48zBuDnyRco7iMzB8AFb8Ye3HlP1VN152VfoQJ6Amua6sOR/FaZBNiUHH
	 GQfuvBm7wCQLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDA2ED60311
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 19:50:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 19:50:16 +0000
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
Message-ID: <20240410-b218698c5-0e5491c149d5@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

aros writes via Kernel.org Bugzilla:

Please reopen if this is reproducible in 6.9-RC4.

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

