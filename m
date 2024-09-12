Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E03F1C2424
	for <bugs@lists.linux.dev>; Thu, 12 Sep 2024 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175473; cv=none; b=h9S6jd23RNTrJSwqE+PdXxIH+CdWW2A2+o6jFWi7/At7otwnRjm4gZTsPTN6uCOv8jfoSlQeoqRh6yUjXJquH3IiB2/+enjWaUVUyVX2zp50GSQCIfB7PwuI+vHMTq+tQJm6jzyIyn5HVlhC7l97vJ+6eD0ValwH/ePmc6a6KMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175473; c=relaxed/simple;
	bh=ITtjESlHI0SXA+2P/3CDcsDo3L4gats+L7GczHUbsG8=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=r4rX9lmJ4g63c0DLzOqk91ffW28S4JoONZzhbyo0jEjtVwNklCOEifpQhN43dbDLa2AcS7DRKdsRv1IR4BkSU+HSwZ0kIxvrH3LpEHtbkrBxidb0gGMMcT5Sr+yEfdEJ2rITf7hb4MS0Kxl5r3y5I1Gas9dLQzoCUXGMOh+Nx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUxxF3Rw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUxxF3Rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09043C4CEC3;
	Thu, 12 Sep 2024 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175473;
	bh=ITtjESlHI0SXA+2P/3CDcsDo3L4gats+L7GczHUbsG8=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=mUxxF3Rwq9XSw0JxIaa+sXDefDIBxqt5r0MC5mFvp/zD+TSK+EJYIUs9g5mrelDPy
	 ne6LBV2MzrXAvYQe1ek4ZFHfS0+iCJS39ilUGutE07+Bh3H7X6BqcysX/LLwMIS3fY
	 xx1pvCDFUritvu8IakreGTEQJdjMWZJ0yUlh1CgnoSg7YL2gDLyaCukEzJgsMJHu3S
	 zXpsa/GJL0hDAxWRvEErXBaIl+HAznycZMoyIZ+aUK4xJW8oeB7IXBCDJ4FpiHQfF8
	 Abf8NIZpFjk4pt0y+JwWcBMe2sZXsEzF/Uk+NhjjcwT/pewt8khOuI1gBCXMpchwMU
	 XlnaImMsxlaUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345D13806644;
	Thu, 12 Sep 2024 21:11:15 +0000 (UTC)
Date: Thu, 12 Sep 2024 21:10:12 +0000
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
Message-ID: <20240912-b219227c3-87abdf6b9363@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

alip writes via Kernel.org Bugzilla:

FTR, same PoC works on HardenedBSD, who have their own PaX implementation, even with private mappings: https://git.hardenedbsd.org/hardenedbsd/HardenedBSD/-/issues/107

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

