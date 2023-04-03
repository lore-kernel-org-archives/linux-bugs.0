Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64A33CF
	for <bugs@lists.linux.dev>; Mon,  3 Apr 2023 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=AR6jEyYHfrjsqNqPYlX0AiVvpVF7Q+OSfmRYhQIEVYU=; b=QIYFM0wGMzSq0Hx909jCJEfwKL
	rQ3q16UC4fYLVYRi9H/0nx1stp8KwvHXqm01MFPMX4Byvh5Fu+X5Ku82qZX17l/4oh3fZDFAT/9Mh
	aVmThYP6tmaIGsGKT+ou/cjiBgQFBD3/ix6OHy9w6OtC1uTd4k9oGJu6gU18Z4SbgUh+YeFp+th/J
	7ZVJbOVfEe30FLobB1KgBXGmngmHLu1ToEeaCbtdAiD/BfraYVtXYnhNshwjJ5Z4RPprUCgxurtSZ
	5XT5iX2NY8+rQUw53egRy8XEk6bbsDzuAYvm8m/qitL/okMVW/TeWv8x5UYQXH3psal/vakGgF5k4
	YDdSaNRg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pjN7F-00FyFI-3C;
	Mon, 03 Apr 2023 16:33:10 +0000
Message-ID: <92be7194-b02b-5380-7d33-9bd44e6aaf88@infradead.org>
Date: Mon, 3 Apr 2023 09:33:09 -0700
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Kernel panic, CONFIG_FIPS_SIGNATURE_SELFTEST, missing dependency
Content-Language: en-US
To: "Kernel.org Bugbot" <bugbot@kernel.org>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, bugs@lists.linux.dev, skhan@linuxfoundation.org
References: <20230403-b217293c0-1e5391e4b7f5@bugzilla.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230403-b217293c0-1e5391e4b7f5@bugzilla.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi sephora,

On 4/3/23 07:29, Kernel.org Bugbot wrote:
> o6irnndpcv7 writes via Kernel.org Bugzilla:
> 
> Hello and good day!
> 
> I think I found a missing dependency.
> In case of setting CONFIG_FIPS_SIGNATURE_SELFTEST, CONFIG_CRYPTO_SHA256 also needs to be set. But not as module.
> Failing to do so results in an early kernel panic during boot. 

Please tell us what the kernel panic message is.

> 
> Tested on linux-6.1.12-gentoo and linux-6.1.19-gentoo.
> 

Have you tested this on a mainline kernel, without gentoo patches?

Does gentoo add any patches in this area?

Thanks.

> 
> Thanks,
>   sephora
> 
> View: https://bugzilla.kernel.org/show_bug.cgi?id=217293#c0
> You can reply to this message to join the discussion.

-- 
~Randy
