Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B379455
	for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 19:22:05 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id cu4so14914313qvb.3
        for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680204124;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iwlg4Ai6HXuIqd3CFyGXwkySATb4RiYFP61+SSP2yHk=;
        b=FNHGGun54DPMQKxq5yMh8ZEovlExu9INS37J/w46zFtEVwEvz+j/dBiLDyGyuFcn6d
         B5mOPSw+IQT5V0/ZnshJHNT3nyDRVuHRBZRbsodofDGmurzZYT8pigGJ79Unjhos5PJ9
         j5OHwmP/ADe95fbGhRiAMRP7C+jd/b+z8tpp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680204124;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwlg4Ai6HXuIqd3CFyGXwkySATb4RiYFP61+SSP2yHk=;
        b=wjgWyIytQCpd42O0UAKgNhXxUXCwN6pyrfZqgJ/7FI6CKGpSqZ87hzyPEJgyCJO7Qg
         ZD3JPzeU8xsU+PEk5EwWmkLs2S2le5SZ25vzyPNNd8fa1GXvPYnLOj5qYXFd4cAuGs73
         nkji9zE/ezPn4+vVynfwfkKQudrUmirEZAi4bv8Hx2yFTEKl25/NdEXNBAmsXeVXfliu
         sWkJHFw749vhlxP/SGUuKnClv1oG/lk19lkY4l9lsWE/w19vsFnvOYMSy3yq1h2QQCgy
         1vew2iKF92sasVf+fwuUtsWnWRuxisDrXPyCpBqoqCs+H+AofDt+GG/GMU883QyAjzzg
         WnjQ==
X-Gm-Message-State: AAQBX9fZ8tjfOr7ekBY6OGqTduUJajbThxdeqPKdHhZM5B3YJoKnk/D5
	Brsrn8rUYkfLg4Jf3wzXADspSBsX80lUmLOXjdE=
X-Google-Smtp-Source: AKy350aDveFmsTFzSbqAi+7k+98zKqfA3e9EU7vQ/FE3l5rWG4j4HGCX8Mi5CQiCCb47n6qlfPifkw==
X-Received: by 2002:a05:6214:1d23:b0:5a4:8fc0:e0d1 with SMTP id f3-20020a0562141d2300b005a48fc0e0d1mr36953763qvd.38.1680204123910;
        Thu, 30 Mar 2023 12:22:03 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id d70-20020a376849000000b007467a4d8691sm93588qkc.47.2023.03.30.12.22.03
        for <bugs@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 12:22:03 -0700 (PDT)
Date: Thu, 30 Mar 2023 15:22:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: bugs@lists.linux.dev
Subject: Test delivery and start archive
Message-ID: <20230330-ahead-grappling-a7eb8a451cd6@meerkat>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Initial message to test delivery and start the archive.

-K
