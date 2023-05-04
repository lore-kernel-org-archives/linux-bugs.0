Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410C5A942;
	Thu,  4 May 2023 16:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1992C4339E;
	Thu,  4 May 2023 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683217169;
	bh=j1ZQMm4pkbpoYjwh2ldgFX90YhOWObcUj1aCRINW5OA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gJIXkJDglJtimM5rnUJfkiP5ru8ib5d/yI9EeCh4xEYrq59lD0eoKmJgaK6jvghtb
	 VevI+OD9j0yd8G4LVeLORO+lOank2oMWswRfW0AZPrQmmCsUEH6elXoWJZeCmh/y//
	 tohsaFSeb+HdSjF8+c5NodpES7gHndi7sxnWRhdfM/CKy4men2zV55Qjquvwy9DLkA
	 BsvvV9NF68zyU9g20fKzOqGAKCySTFmzgPag6XD9HH0XJScStVYsVwrYvL1KYOhZFu
	 mDFxDC46OVhvxxqwVSr9bO3kH7nQ5HecZ2H98hZ+vJDul1fOwJTti+obm7JBDj0jfA
	 2/L6elPMxpChQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC0A8C395C8;
	Thu,  4 May 2023 16:19:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, netdev@vger.kernel.org, john.fastabend@gmail.com, 
 kuba@kernel.org, borisp@nvidia.com
Message-ID: <20230504-b217401c2-ed16c78b19c6@bugzilla.kernel.org>
In-Reply-To: <20230504-b217401c0-873168e318a9@bugzilla.kernel.org>
References: <20230504-b217401c0-873168e318a9@bugzilla.kernel.org>
Subject: Re: TCP_ULP option is not working for tls
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu,  4 May 2023 16:19:29 +0000 (UTC)

sumit.200744 writes via Kernel.org Bugzilla:

I tried it on 5.15.78 where I'm getting the above failure -  "No such file or directory for setsockopt.
Not sure on which linux kernel this TLS option is introduced.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217401#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

