Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4027E7;
	Thu,  4 May 2023 16:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62834C4339B;
	Thu,  4 May 2023 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683219075;
	bh=ae0gYcI5Rn4ygu+q/7ixV1itLwdcCEJye+E4axxfa0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E5r6f9rFq7DeBhcPY0OhlxI4A9E5xrNqkIUw8NFJjTNBqsVnWu6TMy9ySbmjtcA/v
	 RfunaZZqEi/63wLWwE59ZGPm2tXEVd8c1YZ+4w5IawKejMq1S8DYj9MFl42o8EnTIH
	 hKxbVgxkLjyutZKNWQWQM6K9PUy4C8f7AyFDnxLL88jb+Vk1lhVu0O5EpvGIkExYIW
	 4xYkffDNNWnQDe8misOnafeOlvwHzkzaawc0QRIMvQbWJx8p+kcXSXRJGNebfXAJ/W
	 ZtQ1dXduCnVYHM7MZHxEtyVqPE39/JkEOSjXZlMlH4C5d02tOkKN+vcZQG/WZ4XNfN
	 WKkkiogGaf0Sg==
Date: Thu, 4 May 2023 09:51:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: bugs@lists.linux.dev, netdev@vger.kernel.org, john.fastabend@gmail.com,
 borisp@nvidia.com
Subject: Re: TCP_ULP option is not working for tls
Message-ID: <20230504095114.6656e611@kernel.org>
In-Reply-To: <20230504-b217401c2-ed16c78b19c6@bugzilla.kernel.org>
References: <20230504-b217401c0-873168e318a9@bugzilla.kernel.org>
	<20230504-b217401c2-ed16c78b19c6@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 May 2023 16:19:29 +0000 (UTC) Kernel.org Bugbot wrote:
> I tried it on 5.15.78 where I'm getting the above failure -  "No such
> file or directory for setsockopt. Not sure on which linux kernel this
> TLS option is introduced.

Can you show the output of:

  modprobe tls
  cat /proc/sys/net/ipv4/tcp_available_ulp
  grep CONFIG_TLS /boot/config-*

?
