Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4DC964
	for <bugs@lists.linux.dev>; Tue,  4 Apr 2023 20:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88FA3C433EF;
	Tue,  4 Apr 2023 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680638485;
	bh=rCdo7Uzp26R9Y0y5u5Xtz/JGD2lAQBywE0PagiehKkU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PBZUuPbHfslB9ZYUrrd9ezrtMJW3GdsEZ3rcG1v5yVlgoweRFkLxuDUoMQrZgHsWD
	 Vbe9XVNRgqFN3x45rfyF+ZVVdHLuCw2GZnhHMBoNByNhtCtzBCIG/2oRTm+bWVwIC3
	 PcUuqIf7f8XYD/l8k89/L857o1TUqi1yD2UIMeEK+KELWr1NjJBrqscj3EPDbVw/OI
	 WE7oRwriS9I9PaPRJzY+U0/zeXg0mGi2xPGj+eZElD2AFACEHuPWGVkUZE5rxRaxjC
	 619J0ZoA8xoVA+jxNGrDnOwFdmHgvDBQ1UnybrPhokKr72el83Runim3KSkxzkIm5i
	 KK5HHr5yZlrUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A4B4C395C5;
	Tue,  4 Apr 2023 20:01:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bugs@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 clabbe.montjoie@gmail.com, heiko@sntech.de
Message-ID: <20230404-b217298-17108437c21e@bugzilla.kernel.org>
In-Reply-To: <ZCx5eVJvXaE1dDvt@Red>
References: <ZCx5eVJvXaE1dDvt@Red>
Subject: Re: missing crypto power domain on rk3588 ?
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Tue,  4 Apr 2023 20:01:25 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217298

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

