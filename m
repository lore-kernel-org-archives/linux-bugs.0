Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3828835
	for <bugs@lists.linux.dev>; Fri, 31 Mar 2023 17:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE955C433EF;
	Fri, 31 Mar 2023 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680284739;
	bh=InTYreru8OI+qLn6U2jIEQXvqAxJ1uu3vjKl3BSMI0I=;
	h=Reply-To:From:To:In-Reply-To:References:Subject:Date:From;
	b=TOUe2k/4L55Iu8V6fyvbMCY0cKNcpVCmTIi2cgaPWsOh15w+vaX1EbOCphNuDR2OE
	 y02q16G5xDgEfckqGKXCjFPhn6a+g9oXSnHk/FJPIx/kllGngSpnYQCOkMXhX958GX
	 A8DoTUoZV0yWplYI44c/9fx/L/+rRer9nyRinz1fQSx3QH00+48GAD81bGfmeT8Gtc
	 7Ej3U/Mq3QjZNbDTEwoSrQxMNmA4ivHhDigRaJaP9ECxUxXHmfN8pQDrkVbBtMHs+Y
	 1NA41NJZ9Zp3++LaEL1luoCEyNEQR0xFM9Fa0Y59RH7CDS+wn/bpdmQqiVfB66GHOQ
	 AibFPvkZZI7dw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C316FC0C40E;
	Fri, 31 Mar 2023 17:45:39 +0000 (UTC)
Reply-To: mricon@kernel.org
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mricon@gmail.com, mricon@kernel.org, bugs@lists.linux.dev
Message-ID: <20230331-b217274c6-777982ebc817@bugzilla.kernel.org>
In-Reply-To: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
References: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
Subject: Re: Test bug for flag setting
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 31 Mar 2023 17:45:39 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

Reopening this bug for some more testing.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217274#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

