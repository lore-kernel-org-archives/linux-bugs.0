Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A14198A17
	for <bugs@lists.linux.dev>; Mon, 21 Oct 2024 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542308; cv=none; b=llLyOYXUt/p1SQmpWpJuO7TvSlK/XXDUFmKubxBx5oEXArh5n+2oRy+mgd//MPej+x0tiVm4mkstmPcy/pyonyuEb52YWUhAsfiei+Vo891bI0/+59k1HscnQ1KVsrlnwHZMYC2JizgKhqchWJG7Yuj/XUZ6y2hXd9jBx2CQhQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542308; c=relaxed/simple;
	bh=jtCb1oePkwgzY12ehbipPAvvEitRkN2FHVbfHVT3JMc=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=HK4qkkb966IQZ27mBUWYKlgI3gk02lNh0eezjKoUOUlzYn0mSpPdxrmMHkSORIoZ7CGzcgXjI0i7oJ0biONur/FxughKO8pg6/lpSaJDvw0tk6N905kCrTdn47vGyPXXXR6tGAbMBy8fdMU+2sbKz3tbEMPS3DHaf5ckpqCALvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnpUpKXC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnpUpKXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847EFC4CEC3;
	Mon, 21 Oct 2024 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729542307;
	bh=jtCb1oePkwgzY12ehbipPAvvEitRkN2FHVbfHVT3JMc=;
	h=From:Date:To:Subject:From;
	b=qnpUpKXCA6QYELsFf23V6wiw987qA12OUUCeUSXMSc1cQhiI9v2bcRPHDsdfChS0F
	 q1jHePt5I4wyy6uzzXByFNPyrs7bNEyvu7QoYaXjIgbPsow/yNsYkRgR9VQTMDHkFz
	 qusFHe6gGWmgbJKYqRAP7n8xSnnSrLk4Y48SOiNLSGMafX8UQfJ1YC+r6d7QskjVv/
	 Mj9IXWVBsYU5Y5ONYtn2Y20Xb1lAGOl0ray9nAmBMyZi0/3/grddrJj6PFcLxbqVLD
	 K6lsJCrwQtXu8jdOivtCkqEzy6/ASrdCyFKJqR1GMtlE35cvc7vO/qt/Eb5k5Bmq/U
	 S6QqIIO0eSL8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45153809A8A;
	Mon, 21 Oct 2024 20:25:14 +0000 (UTC)
From: Konstantin Ryabitsev via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 21 Oct 2024 20:25:10 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: dwaipayanray1@gmail.com, bugs@lists.linux.dev, lukas.bulwahn@gmail.com, 
 apw@canonical.com, joe@perches.com
Message-ID: <20241021-b219413c0-7b1e5a7de3d0@bugzilla.kernel.org>
Subject: checkpatch.pl --mailback causes an error to disappear
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Konstantin Ryabitsev writes via Kernel.org Bugzilla:

Given the following patch:

------
From: Test Case <testcase@example.com>
Date: Fri, 26 Jul 2024 09:16:34 +0800
Subject: [PATCH] hwmon: document: fix typo in oxp-sensors

RMP -> RPM
---
 Documentation/hwmon/oxp-sensors.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
index 55b1ef61625ebc55a6df1f3fe5b8168a45e00774..50618f064379c10b0dc97499b1a768a5e183d07b 100644
--- a/Documentation/hwmon/oxp-sensors.rst
+++ b/Documentation/hwmon/oxp-sensors.rst
@@ -52,7 +52,7 @@ Sysfs entries
 The following attributes are supported:

 fan1_input
-  Read Only. Reads current fan RMP.
+  Read Only. Reads current fan RPM.

 pwm1_enable
   Read Write. Enable manual fan control. Write "1" to set to manual, write "0"
------

If I run checkpatch without --mailback, I correctly get an error report about the missing Signed-off-by:

    $ cat /tmp/test.patch | ./scripts/checkpatch.pl --terse --no-summary --strict --showfile
    Documentation/hwmon/oxp-sensors.rst:59: ERROR: Missing Signed-off-by: line(s)

However, if I add --mailback, the error disappears and the script exits with 0, though the output should remain exactly the same.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219413#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

