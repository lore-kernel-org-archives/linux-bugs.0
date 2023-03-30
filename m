Received: by 2002:a5d:5a9e:0:0:0:0:0 with SMTP id bp30csp61563wrb;
        Thu, 30 Mar 2023 11:57:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set8/klfOqPz7KdsShqSigBm6bF96bdXZG1XPWpkOru9thoQxZ+FMChGZtobXVUT7nT2X5tAU
X-Received: by 2002:a05:6870:8289:b0:177:ab68:aa9e with SMTP id q9-20020a056870828900b00177ab68aa9emr13850994oae.21.1680202657101;
        Thu, 30 Mar 2023 11:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680202657; cv=none;
        d=google.com; s=arc-20160816;
        b=UPWN78xcpAmYP8AxP3LAOz76FWGm2XGVlP2Qw+iaZV3mIQ20WVv/9IkKccgrt/46Tp
         7Cp7pEILCXMk8fbQi/sWHy4yCZCLETXwTxzHUnG6+EQxNJB018SJ0li2AuGxhSTqRvpv
         WWIMyyUrG50ec5vE3IAkgCTXBgp+2OzeDk9IjbjaoL5heTxm+8j4YQh4FTcoh91AhzNR
         oSDytraDclnxq/fDlWA2avybfg7bjpwEGiHxh262hMHeyPE5rm990skOaQH6c7eTRfp1
         rviU7j1F9e1cZjUvFmohtQrPvV+CA276R/+Zga7DdPXQaBGr4qc3CrtAHn5SDjSna/gz
         3hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:subject:references:in-reply-to:message-id:to:from
         :content-transfer-encoding:mime-version:reply-to:dkim-signature;
        bh=aAb44FaTNIIz3H3MVytKGnHTcg8RbCUHMLVK9gz93Dw=;
        b=K/dwB628/xbGBTkKQ0X+qdsC/37LjelXJD0x9QIuCfzFAVIFWv5DyCUbVbt+RcWMbf
         8eyETBVNsfY/YgshHqEZPjwQtsj0cZ+CBI/yiOp3/vCaTZZmDBFWEHAhsZtbR3gisNpx
         f0OM8oeu4YrC/qK/RiAy05dnN0p4UFBQ3fRtd2vqnXQJ1d+lZKIo58E4SHJKtBG8xQ+6
         VckkPIJB7YN81PdvHxT/N0V6PCpkmUlkPt9qMBMElJdVoH5n0kngAUaiS8yQwiuk1Uja
         mRHPaGDNDSW3LVnNkThaxNQPeeYU+MNatYlOIa8TYPEvFMILo6mVxQXZFMr0i5rXTd+v
         HClg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iRZ00DOi;
       spf=pass (google.com: domain of bugbot@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=bugbot@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <bugbot@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id go21-20020a0568701f9500b0017697191906si392464oac.49.2023.03.30.11.57.36
        for <mricon@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Mar 2023 11:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bugbot@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iRZ00DOi;
       spf=pass (google.com: domain of bugbot@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=bugbot@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAD84620FF
	for <mricon@gmail.com>; Thu, 30 Mar 2023 18:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC94C4339B;
	Thu, 30 Mar 2023 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680202656;
	bh=aKdTrE+4cMObESuet0LiD80P83eUOaJzPVAjmSBcrFQ=;
	h=Reply-To:From:To:In-Reply-To:References:Subject:Date:From;
	b=iRZ00DOiVHosp1llybzd35KQYtr5snOa1/O7jTFqNiuqubI3mixjrgc95sF4SFrr4
	 F8hHcl7ahOhLuYWfll9558/KDMehT26FmLjuBoAfGelpY+PdOgj3QBSJ24oqf3y8Ni
	 RsrNKczNPIXjgneZiS4HqVMZtPIb+sxVOjOHuvlmvkXzCx6yYIIRpMjw+eV4dG1+O9
	 d1t7SFgEHTMsbJa66anawry+UPfW5GO+jBOXrr8zpJns8vwAZyah3lvSTjpSILg7ID
	 biZtFvCT0Blq6up3Y/9pVHo7tTou9xyw0vKex7cYVlp11Aybrmi+SD12LL6AhVfmP+
	 1oROMQnrhpm7g==
Reply-To: mricon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mricon@kernel.org, mricon@gmail.com
Message-ID: <20230330-b217274c1-8d11e4222923@bugzilla.kernel.org>
In-Reply-To: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
References: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
Subject: Re: Test bug for flag setting
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu, 30 Mar 2023 18:57:35 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

Adding a comment here.

This is a brand new comment.

-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

