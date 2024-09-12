Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609D81C1AD7
	for <bugs@lists.linux.dev>; Thu, 12 Sep 2024 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175487; cv=none; b=ZoFCDoCufrLPAfIZP6UxXn9wihNfAQKWbcvx3aCPFOoEjodK9sPYtUw6CFh0jRzBGsGICiHq8V+hqd+ypKLvh/yCPqissF2uIVcVCqcVkBqtf/Jd4sjNRYOjrNWgW6j4XJ2RTshHg5nWWvl3zgSeuctIGddx4Yn5tKvcTDvvPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175487; c=relaxed/simple;
	bh=vuJH6SV1Jdylp2QczYI/a9/P9LPhheBvtqYB/WG7iLg=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=bzc/d3dBtfqFW7nKuF4yk3dukLa3damGyvtufit8FtFOi1hcrA/tb0VRidg0SmZ0CMk0DnXUEgd4GygXhByInwYeYQyw+vTul5u8S/Ipc+vVYlHaLNK6N6B6mACz+dN84E2RYkVqDO68x1yIsNFVU0StE2uYBHzyWoQVNuFOiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/KJRxly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/KJRxly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D41C4CEC5;
	Thu, 12 Sep 2024 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175487;
	bh=vuJH6SV1Jdylp2QczYI/a9/P9LPhheBvtqYB/WG7iLg=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=p/KJRxlyo8lhABGwVqFzk2BBGi7SY/q3yDvx0/wtegITnwZyn2Jv8HoODPnICS0Iv
	 pbpAyKjin9yS0FgXNupMEN4yNjD/490gGPImERhvg/p615lG0CDobDRjxNDo0j63Ji
	 aMh7ir57jZJsDOFXJBzKFueMF2CiNiGLdobGAAgklZ5/OYIjS/Avcv8yRjsGZA4/7k
	 oiPDQdoJMsxBAhznq0R6RNLNbYt82huMTQHrlOa9flW8lYcemjkFy2gZIJmYQolnDl
	 4M/qFKA4jwBnTp1cZxqYhdyx9BmYLhrfOyg+usZ7lDarAxF1eCT4rLQMFkuQkrjqrG
	 8r4dGd5fge0BQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F093806644;
	Thu, 12 Sep 2024 21:11:29 +0000 (UTC)
Date: Thu, 12 Sep 2024 21:10:13 +0000
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
Message-ID: <20240912-b219227c4-a6fc0c55d402@bugzilla.kernel.org>
In-Reply-To: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
References: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: Re: MDWE does not prevent read-only, executable, shared memory
 regions to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

mricon writes via Kernel.org Bugzilla:

Assigning to MM and invoking bugbot.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

