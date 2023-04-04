Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082E648
	for <bugs@lists.linux.dev>; Tue,  4 Apr 2023 06:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 975BFC433EF;
	Tue,  4 Apr 2023 06:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680589036;
	bh=hjkCVt0EVlkiuqCA7mtfB9O+NuKYtBkZDLarjAzmR18=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uDhrkwJSCITIemWgSUbau4yVHoXU050V3LmFktSfjvWUX6x6AmKsSQaJUAEtmERsg
	 INGzohqdVoRSEunbm/MpvpeEet2XyUSNRrPM8bB2KvmIacb+WbJ34Z/tuAspUk9vT1
	 D+CT+6i5jvPIWySPDxHJB4ZiCrYoGhXGWNgFTcoi7IzsTZSzWzpxPAAHHLduHZIr1s
	 XCEvUBLbGdI0LPUnThOJatbVvZRFmCCvdVk9tIap1L0FSfdsm563nz1V/oYu+KRED4
	 4HP5GMbLrOqs8pXdQpXcq1CZTvZgBwAG6ARHLJXjlpfRhud83ZZzIWnwszcqzcqTyp
	 Qm0zVHddF431Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72E33C41671;
	Tue,  4 Apr 2023 06:17:16 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, rdunlap@infradead.org, 
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, 
 shuah@kernel.org
Message-ID: <20230404-b217293c6-010748a08594@bugzilla.kernel.org>
In-Reply-To: <20230403-b217293c0-1e5391e4b7f5@bugzilla.kernel.org>
References: <20230403-b217293c0-1e5391e4b7f5@bugzilla.kernel.org>
Subject: Re: Kernel panic, CONFIG_FIPS_SIGNATURE_SELFTEST, missing
 dependency
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Tue,  4 Apr 2023 06:17:16 +0000 (UTC)

o6irnndpcv7 writes via Kernel.org Bugzilla:

Hi Randy!

I submitted an example config. 
That config works fine for me, until I set: 

CONFIG_FIPS_SIGNATURE_SELFTEST=y

And it starts working well again if I set:

CONFIG_FIPS_SIGNATURE_SELFTEST=y
CONFIG_CRYPTO_SHA256=y

That's why I think it is related to FIPS_SIGNATURE_SELFTEST.


Thanks,
  sephora

View: https://bugzilla.kernel.org/show_bug.cgi?id=217293#c6
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

