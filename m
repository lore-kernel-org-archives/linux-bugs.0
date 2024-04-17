Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD06A339
	for <bugs@lists.linux.dev>; Wed, 17 Apr 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713338712; cv=none; b=WYkNri6GP0F/L+VeZ1cXKhzUCAnOqr24VwGPv9Gtsibak7mXPzT4lX+0kQDwnnwrj3s+hSPnm46kQBeyQweUIHQyeMP3ah646hj7BHSMTNJN7r+JX9VzAcXC4LYva+etcWhgYzA2p7zCuY1CvSHeIzrIt1IM+i9cU9bSPpxhyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713338712; c=relaxed/simple;
	bh=V28N40BPT1iZuKbGXTIKRRDtEGuEkrusnqUdkBhBEY4=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=AL715etJN8c+qoNxU1Nx7IGHtPeI31BRi5O7LDFR9Blzmnu7xvPWx+7V9JyRK3fNpwqJKkOfG3BO1CMP6iLfXHDrZbNG5reGvC7WnK5i1yqq4qMW1zmaD1Cqxjv9/Zuuav0fpU3YPMYfCNZBEDkBuwmSTXsgowhlLBY4c20odRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6Zudv/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6Zudv/f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DE56C32786
	for <bugs@lists.linux.dev>; Wed, 17 Apr 2024 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713338712;
	bh=V28N40BPT1iZuKbGXTIKRRDtEGuEkrusnqUdkBhBEY4=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=F6Zudv/fcI4wNeoSNG/+GcATMfwcMXN3QB2uAc40JBvYTerZqiu8PHi9yplXc/ZOM
	 j3JIBtd3qq/DF+jkOCsHmfWqLG5eaxwmFuqIOQHZxLbuBENp4I3gWVStrEZmBnSadd
	 Aie/5Ha1elzbiWCwU/ogofQdC8oTK0w3f8x51lYOZZ1UmyDtrHv0JBabhcG0zasGOb
	 BG3E2/WF+XyAcZFGQrgCl8GafiQh0SM6LOviBqBVh4xoUmFfnW3amOCOgsVqRVHtpp
	 S4aJw4DpQSQ4Py4BwxEqFbuhErEPQLHdcDic/0mZs6BVEzKzac4QvDhDsY+xSEbxZL
	 ifLIZ7IFsRWNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F07BD5B3FD
	for <bugs@lists.linux.dev>; Wed, 17 Apr 2024 07:25:12 +0000 (UTC)
Date: Wed, 17 Apr 2024 07:25:14 +0000
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
Message-ID: <20240417-b218698c6-fc240c47b894@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

xiangfeix.ma writes via Kernel.org Bugzilla:

This issue cannot reproduce in the latest linux kernel.
Host OS: CentOS 9
Host kernel: 6.9.0-rc1
KVM commit: 1ab157ce
Qemu commit: 0c2a3807
Guest linux kernel: 6.9.0-rc4
Guest linux commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

