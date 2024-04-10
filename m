Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7C17996F
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712765714; cv=none; b=GcIfiQnwNPQelKjKKWRMn885H+Hd+ChmxZKebpIC8HXnnc41RDsyEVZhqG/+gJtWpH5tfeUOYQrzsNV/86TRAPHjnXcPDHUIXldzbBDoBEaMMVhcaqSxFioKl0GnpGbgspU42zT20ImCo1RuvDw6g+b1ivOKdZRNMdkZS5KeVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712765714; c=relaxed/simple;
	bh=w3jJA2WBZpP0WvfJ3GVawazfUeMCJIjzYdr5QY8hMB8=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=QxQo2LSd27Ia8/ED4Ok3t84MnOVE8gmGi89fH75ypOAk/e6Mjp2Kgo4aQa4z2VQGArzbNCVdTkWfQe7EdCbAV7tFmQw3g47wK94D1ZX22qbG8PzxARV5ps3+fEnw53uk1fEA/+ZuXTXu4OgPJiEXKECgnpZdT5IX8NAFCdfi57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkBlsGvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkBlsGvf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44D2FC433A6
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712765714;
	bh=w3jJA2WBZpP0WvfJ3GVawazfUeMCJIjzYdr5QY8hMB8=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=UkBlsGvfW/RlYKSu3d/ARZamo4IsXxT1MpLYvYNb8nA2ny4/KAwtgyrvKBkgjt3DO
	 M1YrWUjslS2NluSdMXXR062I5IfO7SpJRpGAMtwsT4+vouGPZEpaDmtZqigrQZgPvT
	 6CWBiZ/HMmDCRIX80MRNYRIr40ZNI71VsD4uwhjocN2fq8FJat+8qpsZDHWwit787M
	 5kQIGLRoFQMo7J01q/cbS5T1HMbSOrIFrLQKL7zm04dVcyUhP3RwlAyW4LrF2Om+jl
	 y6xgv1YjoKfSUvULwHeGISu2diQ3cDm1CNz1mbqQkwZrQVfZeky/UJ5JbMoNctn371
	 PZA6WK6FaS1lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 385ACCF21C6
	for <bugs@lists.linux.dev>; Wed, 10 Apr 2024 16:15:14 +0000 (UTC)
Date: Wed, 10 Apr 2024 16:15:13 +0000
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
Message-ID: <20240410-b218698c3-17ea12e474b7@bugzilla.kernel.org>
In-Reply-To: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
References: <20240410-b218698c0-cb3e9db062a2@bugzilla.kernel.org>
Subject: Re: Kernel panic on adding vCPU to guest in Linux 6.9-rc2
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

regressions writes via Kernel.org Bugzilla:

Like fixed in rc4, see https://lore.kernel.org/all/87bk6h49tq.ffs@tglx/

Side note: Artem reassigned this to Virtualization, I don't think that was wise, but whatever, I don't care bout bugzilla.

View: https://bugzilla.kernel.org/show_bug.cgi?id=218698#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

