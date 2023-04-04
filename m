Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8CC964
	for <bugs@lists.linux.dev>; Tue,  4 Apr 2023 19:57:51 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id ny16so1592414qvb.4
        for <bugs@lists.linux.dev>; Tue, 04 Apr 2023 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680638270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hmY7kBwKxbkdPJPbCnILgJBZsreIB1yLQaN7jmCvHno=;
        b=hraszkVBJk8RspDP99CmSPfmN5Ts0MBxmFRZWj2Qb5MS2gbGPyzjWwH3YvL9N314wm
         spFe5tmBOvqeXcCE5XuGZYGs0URGiqq+MFZGf9quCftNuIAxEfFTc7zajbIHogO7v3MR
         OZ7q9ECwxn49IRqu+N5LqzJVFRv+STKpGgQQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680638270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmY7kBwKxbkdPJPbCnILgJBZsreIB1yLQaN7jmCvHno=;
        b=Uvjs0UPlzHhJrqMz2+JvTMF44MxCLc5OgJPYAuFNzXS2/9IpjAaQZRFJd8vcdOeurR
         i8x6KC3O4BFsWBH2K7FcaJEbFaaeymtnMu47+uXldBHHaQJKQPdeoz+iyNqaPOkxYyql
         s7twKrMaxGxbMOByMol04yRQZGl6JJodZqEXVfwK5uO1ji8d6mfmxBxnr2ckF1KjcVwe
         9PwpLmKkqfw7mWLYjU7pKwNwrG9suYoxFQjO95BSgQ/+RBjRHvD6UBkKVEl5i0fWIWz7
         ivgQEFK6FgUsTKRmDrHf0fWL5H9W/CoRB/mGF1WKPhqbShbVEnmt3hjr9x5V6hZkcIlj
         hu2g==
X-Gm-Message-State: AAQBX9dYGFP1ONg/vvURsXs+oSOk54IzIWHNHEWCURBlJMDwFHXz5Ykk
	v17UX1gfsxIr6bu37OY5hk8/QaER+V6BX2V2hWY=
X-Google-Smtp-Source: AKy350b+nWc4fg3QDB43onPoDKCzkrqPsJ5XRwusu8IroN1Roi1Z+4TgvD0q1yP3BEgoU+iMMTRKrA==
X-Received: by 2002:ad4:5bc5:0:b0:5af:8693:a8cb with SMTP id t5-20020ad45bc5000000b005af8693a8cbmr6136476qvt.2.1680638270080;
        Tue, 04 Apr 2023 12:57:50 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id px15-20020a056214050f00b005dd8b9345cesm3561492qvb.102.2023.04.04.12.57.47
        for <bugs@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:57:48 -0700 (PDT)
Date: Tue, 4 Apr 2023 15:57:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: bugs@lists.linux.dev
Subject: Re: missing crypto power domain on rk3588 ?
Message-ID: <zngbyuqheyxwmafsribq7lvhac3amoqx5khsgmz3gyxfox3xop@rixfgptstlrc>
References: <ZCx5eVJvXaE1dDvt@Red>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZCx5eVJvXaE1dDvt@Red>

On Tue, Apr 04, 2023 at 09:24:41PM +0200, Corentin Labbe wrote:
> But I still get the same problem.
> Thanks for any help debugging this.

Enabling bugzilla tracking.

bugbot on

-K
