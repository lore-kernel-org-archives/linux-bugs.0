Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAE8F59;
	Thu,  4 May 2023 16:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB145C4339B;
	Thu,  4 May 2023 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683217169;
	bh=/Z8WVwAvbVedPtpj3+3C1WGr+XukEP3Xv5xwx0ue+rI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=H7jvpUIVqz+tmOt59JifPZyVrE82wWkDjf4ylIGcAaNBmYHPt/Embzz6tJhgG9pl9
	 UGf9RW587qN8dAePXLTjnnMEZP8KHSVeDxY/Eqt5d9sBhaiQII85z35wZz5Qy1paMI
	 cCghQMQI5DB2s5rorVxO1wQV53iqi6cEE/AbngrGmMTKUXkDBPECIwqRNKHoYJRJp2
	 km7dtjGjix+hxnOuYwwBPBPHCQ0pMJVQ/VYBsBaYRA8qphGugdA7X4NpE4C+ouAXQo
	 afD3vGBv+3zrRH8gISvX6R9sQdBzW5eL9soS1Fqbs6qCQIHE9cS8eFZJUlMq01GnLv
	 hGQ1//QNfGyeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9BF0DC73FE7;
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
Message-ID: <20230504-b217401c1-dba3a5c4c8af@bugzilla.kernel.org>
In-Reply-To: <20230504-b217401c0-873168e318a9@bugzilla.kernel.org>
References: <20230504-b217401c0-873168e318a9@bugzilla.kernel.org>
Subject: Re: TCP_ULP option is not working for tls
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu,  4 May 2023 16:19:29 +0000 (UTC)

mricon writes via Kernel.org Bugzilla:

What kernel version is this?

View: https://bugzilla.kernel.org/show_bug.cgi?id=217401#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

