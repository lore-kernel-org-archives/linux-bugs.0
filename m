Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B599455
	for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 19:56:54 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id g9so14942912qvt.8
        for <bugs@lists.linux.dev>; Thu, 30 Mar 2023 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680206213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgktWW8+Iz7V4yKigcEDjMP0JVZ9aUYgpnGbdl/XgEc=;
        b=a376uThJ+ZPt55EPvbe3Q60NNuIA4+iT4HvL4zgq4S3Ta8DCsibf66mvSxwg1YA3al
         vHYsUb7IInEAyoaFLAPOqGcPy3fFqPElXmD55pzRAEcoWbM37zb4PmhNFaxZzWwMxWUb
         GLEw3moeOV8idgPCvPH98oFY4JonTNoK17MwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680206213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgktWW8+Iz7V4yKigcEDjMP0JVZ9aUYgpnGbdl/XgEc=;
        b=qIcUhjGe80a7N9mAssRGd84qTts9UVI5iMB1WaFeUtYr9uhIbb5b4laI5OdFthG+19
         5YOkPTRAKk2XFUF0zHCVhESkAaQrWhaOxtHNz7RXskqK1AIbVL9XU66U6BjlF12ZvyCY
         aHl6NlbClpE1hli03G6Wye8gwHCABo0Q1zNFr8kHfVaj0Lv2rCHvsfBKELYylrXUlf+n
         LsFY5tuTS+kFI2coXK0PfRhtAEXwv+qbmPLBwuI0ivav3f/FnkUBft49T0g2aNpz4+wh
         CsT9ZnsfIVKk6H533OhCiTB9HmHoTWDbHtDG7CnC8yjxyjB3/BQ2R8bQkv/kQo3piLLO
         4n8Q==
X-Gm-Message-State: AAQBX9cJQN3q5wr/0jUt1oROOPvWcTvxs8ikFZfcU8H/JypURrLsrzlf
	VKG8QOHJmxEUotggSOm1WBzwvg==
X-Google-Smtp-Source: AKy350affdWYtzYg/+lY6/+4LRVnzaaK4T8N9tJWVV53DksYFDIrrcGeBmWq8tspd9p37S99CORMVw==
X-Received: by 2002:a05:6214:20a3:b0:5a2:e3e4:59b0 with SMTP id 3-20020a05621420a300b005a2e3e459b0mr33962966qvd.44.1680206213622;
        Thu, 30 Mar 2023 12:56:53 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id ne2-20020a056214424200b005dd8b9345c1sm68152qvb.89.2023.03.30.12.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 12:56:53 -0700 (PDT)
Sender: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 30 Mar 2023 15:56:51 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: mricon@gmail.com, bugs@lists.linux.dev
Subject: Re: Test bug for flag setting
Message-ID: <20230330-niece-fled-173b602dd253@meerkat>
References: <20230330-b217274c0-ad25aa758c0d@bugzilla.kernel.org>
 <20230330-b217274c2-e2a6110e5b8c@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330-b217274c2-e2a6110e5b8c@bugzilla.kernel.org>

On Thu, Mar 30, 2023 at 07:55:56PM +0000, Kernel.org Bugbot wrote:
> mricon@kernel.org writes via Kernel.org Bugzilla:
> 
> Another comment added here.

This comment was added via replying to the conversation.
Bugbot should find it.

-K
