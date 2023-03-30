Received: by 2002:a5d:5a9e:0:0:0:0:0 with SMTP id bp30csp61557wrb;
        Thu, 30 Mar 2023 11:57:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yy9N72VkwgqJizBAk+OMeibLQomWA5xXOLH1wiNc2Rh2R9fwcLbVBSl/VTqmJNAY3Omg30
X-Received: by 2002:a7b:cd19:0:b0:3f0:3cd6:1871 with SMTP id f25-20020a7bcd19000000b003f03cd61871mr1695909wmj.17.1680202656174;
        Thu, 30 Mar 2023 11:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680202656; cv=none;
        d=google.com; s=arc-20160816;
        b=GNb039vBArZOdUcxdpa6FELg0o03NdckbDwpFSG/uwF8UgjwSn6y173cPPGJlR2yMJ
         EJRmd3oX4As6fZ0UPvesFJn7oOdbfoD4A1LXYuJx7yAKHnVi8j/wUSVZI2K61uOHDA2o
         jl1TA7T8iWRhEqr/PCAzfLHQN+sZpZUTSKpBi57I70HaQGWiIxCCrL9hG0OCAnYXnFSI
         WrQPYIiH7oVMFHV3QITVs2sLB2I3HsdyNWUaOsCy+vflt+FKMHj8aCEwkdhL206W9u0K
         13v7AUHcJuxxeM4t/AQ9XiP8oIog4sQlYxguxE3Ba2hUxYI2U42M4JjnnKwGxALutkjw
         rPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:subject:message-id:to:from:content-transfer-encoding
         :mime-version:reply-to:dkim-signature;
        bh=RRqdHTbWenPJMKQjRoJrqNvC11MtEryQUn65Ho/NTWg=;
        b=mRA5nSGGNPdEAjb8IdZkmV02hJWRB0Mj5CqR46YsDuLr1y+Hpyyy7GHsdogvTTRrfO
         He7Gp4pgSwMT86+09PrJVW9YbBid5in4ZYY2LumnTmKOL/pwMs3YOXf5dyPdT+1WArLA
         7GwKJ/u5Or2OdiSTnl0VLfuiaGLkdo9yV8iK612ssjKqY3wo3XRyyTNK+yyJOPY/25BH
         aN8IUaZgZQ6SH+oscGcjI+y5GUAf7kU8C7C49XMKNxtyvR9br6WMljM/SrrmVza926h/
         DclkuDUAQRQM93TQ1XPg0QpSaqAaN9Ljg3hCs0k93y7AN9G6lMQ6ftZ2nSgN+5WuIAu6
         /Kbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YxwKRAzM;
       spf=pass (google.com: domain of bugbot@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) smtp.mailfrom=bugbot@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <bugbot@kernel.org>
Received: from ams.source.kernel.org (ams.source.kernel.org. [2604:1380:4601:e00::1])
        by mx.google.com with ESMTPS id f25-20020a7bcd19000000b003ef7367dfb4si48512wmj.123.2023.03.30.11.57.36
        for <mricon@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Mar 2023 11:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of bugbot@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) client-ip=2604:1380:4601:e00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YxwKRAzM;
       spf=pass (google.com: domain of bugbot@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) smtp.mailfrom=bugbot@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6216B829FF
	for <mricon@gmail.com>; Thu, 30 Mar 2023 18:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F0BC433EF;
	Thu, 30 Mar 2023 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680202654;
	bh=Ysau2IhmFKCNdLPJ8UZoffFIye3Az4OHbT0p9p++p64=;
	h=Reply-To:From:To:Subject:Date:From;
	b=YxwKRAzMNbr+pv+4s0gxwXp3r7XTd1o7kG1YvMA7O30CLYsIGDbkBFlnNjpPw4xos
	 HJr2ZD046t51tPAUkol7qHDRTBl3k7UBg3B3K32GjbXvbT7XuHEdTnjXwo4N22Aqqw
	 oYMe8upwu1oDjCjEjbkGPYFZfmVUPXynAS49CaROeHlD95aLHSOq2tuuS26OPlhNoe
	 1N6OlIHjPZ8Hw+JSXLwezoo1j+VM6R9X/MjutgaUSCipFHE2BLvOcICSF5DwkazN6A
	 UkTNc7PpwUIYaxy8JuzFnviU4KRw7zTdfDpNBrFGFAJTz+tp98CD1LE2auY1tDhLOH
	 e4vUylcHIfyww==
Reply-To: mricon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mricon@kernel.org, mricon@gmail.com
Message-ID: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
Subject: Test bug for flag setting
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Thu, 30 Mar 2023 18:57:34 +0000 (UTC)

mricon@kernel.org writes via Kernel.org Bugzilla:

This is a test bug for setting/searching based on flag value.

Please ignore.

-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

