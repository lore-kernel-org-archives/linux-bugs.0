Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9D1624FE
	for <bugs@lists.linux.dev>; Fri, 18 Jul 2025 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752850788; cv=none; b=GqC5xXHVkMihmBIcDgIu4MEal6+phRw8KltoFa7KZhZW63rXH/8/rw6NOPKvsC+yARWzRMqycaBIqGnS+w5ULES3EN3ce97b0VQdHvxDU86+8jCkulT1DRL0z4bIBy0I6kC5ZSWB7xDlFlLktJFShwiWgwR3ZO9ABB2+lVJ9ENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752850788; c=relaxed/simple;
	bh=BKxxqLAJ3ARNQoXIQ0wHIDVgSvOabUEatQfmDxdd/To=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=I2jtqSgiSrsRaK/6nPKrYOzRkWbln9A+wItHlbJ3i4+I0LkUwNPPYfJkNKWVC2xriBNVmK2xk9NSyOa181yujob+3LmUJA1+NIbq3FAtFIH/iUaAXEWDOb7uCDFWClieN8JtD+czz92yDqKiPZuIunqkW1IT4AeMRq0afOiZhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAe1nXq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAe1nXq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0557C4CEEB;
	Fri, 18 Jul 2025 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752850787;
	bh=BKxxqLAJ3ARNQoXIQ0wHIDVgSvOabUEatQfmDxdd/To=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=XAe1nXq1yah2LK2sf0rVIjpQ15RaIMRa0UthgpmZrUNGq5iKeb5RfJcT+Prq2NVrc
	 4rslOiIrw1X11cJSzL3WKoMKvrNSRtDMPF/deh5GrrZLES4+ooFbhX8Z38ffb56fro
	 AWk49ApoO7l/oDK0mgU7LmfF7nNy7FB1O3W4u+wlMSWFWbBSlh9xbDuRJjzaLVE64V
	 5q/2tSS07y3tMJYf5BFZwxO3tqidg6KF0DTBCRVys5PkiaFrRjPZy2fFoqmC/V+BGO
	 bsQPXzSy7Ge0hQTM9MJdBG9meo30UeJZFy20X6Kr7GZJ5vQlzot0MElRsR98B6DPvC
	 1xvf0xCcvh+hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 748BD383BA3C;
	Fri, 18 Jul 2025 15:00:08 +0000 (UTC)
From: Ali Polatel via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 18 Jul 2025 15:00:10 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-mm@kvack.org, bugs@lists.linux.dev
Message-ID: <20250718-b219227c6-9e9c2516da7c@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Ali Polatel writes via Kernel.org Bugzilla:

As of version 3.37.0, Syd sandbox mitigates this by a proactive file writability check prior to mapping PROT_READ|PROT_EXEC mappings when memory restrictions are on, you may find more information in the last paragraph of https://man.exherbo.org/syd.7.html#Memory-Deny-Write-Execute_Protections

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

