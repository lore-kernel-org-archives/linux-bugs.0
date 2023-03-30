Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BCA10E7
	for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 20:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD9E0C433EF;
	Thu, 30 Mar 2023 20:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680209524;
	bh=Sj+614+RBlC+VTcgiKHMYYXBPp0nlcvB6Sz2SWZyc8U=;
	h=Reply-To:From:To:In-Reply-To:References:Subject:Date:From;
	b=bFALAB4+BGgct582K1yHtzcX4BrUzTcAZWQByqnuBI/eMyoqohg8EE76RRzu1b7I1
	 5h7vqqpQxiqW9MB4hxafn9r5BVsQ36ynJwXXBp6csa2Ohixiv18M2XX2kMutq/KOJF
	 4/XaLP//LGe6TKJ1MGCX42/z/PEdPY/jnVT3Xc4Axb1iU6AlshJSbIa5fr7wAV7Wvu
	 ZEA4DySexCZnZQrgsT7dQk5BOrNSETL3UywA1s8LIX4HLLi5JWVhhb16fyq7+9wb32
	 0mpEWkIz3D/O3OupNMIsXi5T8aajtkZk1N3qr5hmfLW+RSvqycVWZisWenn580zLpJ
	 ofIj7M5YnqXFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80603E49FA7;
	Thu, 30 Mar 2023 20:52:04 +0000 (UTC)
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
To: bugs@lists.linux.dev, mricon@gmail.com, mricon@kernel.org, 
 jirislaby@kernel.org
Message-ID: <20230330-b217274c3-f7ca5aa94e7f@bugzilla.kernel.org>
In-Reply-To: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
References: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
Subject: Re: Test bug for flag setting
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu, 30 Mar 2023 20:52:04 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

Added another comment via bugzilla.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217274#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

