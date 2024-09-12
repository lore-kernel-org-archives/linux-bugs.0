Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968406F30B
	for <bugs@lists.linux.dev>; Thu, 12 Sep 2024 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175410; cv=none; b=OnRr+xqJLK8GZ2ZR/eJiOsJTSzLZa8gKG3V32XtLkpbOFJze81dogtwR6pwVmMYIzyLij0ZB7RApplBzTxy3hJkSGPcEApURt1aKrcu6KzAZZoIi4Fs111fxJOhtLAKIM29ZhxzbtWqCzjAYgQ+crzdJSpa6y3vRm9dh7Yn2xPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175410; c=relaxed/simple;
	bh=ANu42i/Y8a6NCqfIWLwoTdQTuAZqF40CAqc3bCmxprw=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:Subject; b=aSmznjiOvnQEaoKuSUjv2khRBeGrWnyL5NpRTDb2a4lz0GpcW8/3ZtYk/dMBl0ifh3hx06crTopTz+vhg+6JrTqSK2RhucsTriKWAlZdwofmJ182qtaTYQ+3Zi+qP8n+rVFG0Y0iaQoEcRfTnS6xD8UT12BWAGxbwLj7GnNjYTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIAaK7S+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIAaK7S+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322B3C4CEC3;
	Thu, 12 Sep 2024 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175410;
	bh=ANu42i/Y8a6NCqfIWLwoTdQTuAZqF40CAqc3bCmxprw=;
	h=Date:From:To:Subject:From;
	b=PIAaK7S+oa0+s8SMt4xomkGRKrecqsI0LOC2CT9nzBPxZAM9y3TbjCftm8dQAm7Tk
	 KabT2EQHwYW47M1T/bCD97Jq7RYNO4lVcGuNsRH8Lu39Q+WBNd/zV2dNC+8f5queI1
	 gIColkamk07zN8G8CUB67EYnlNs1iGBICEWR6tn9LkNr9t8q7JR9KwXGkMZ9EiDVI8
	 wEyht5kyEvFym1UmmeAhPprp5n4IRubK7RMS9gxhHFDiueH2RrF2GltEtrx2u5kUoi
	 qsTL9km9sXygU1jMzDaoEjFOnSbD0xFEci94ciVPLtd493lrmHcLhkzTbVPISPSHMK
	 tkUXNWjNcu+ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 776AB3806644;
	Thu, 12 Sep 2024 21:10:12 +0000 (UTC)
Date: Thu, 12 Sep 2024 21:10:09 +0000
Precedence: bulk
X-Mailing-List: bugs@lists.linux.dev
List-Id: <bugs.lists.linux.dev>
List-Subscribe: <mailto:bugs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:bugs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: akpm@linux-foundation.org, bugs@lists.linux.dev, linux-mm@kvack.org
Message-ID: <20240912-b219227c0-78bee9e213fc@bugzilla.kernel.org>
Subject: MDWE does not prevent read-only, executable, shared memory regions
 to be updated by backing file writes
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

alip writes via Kernel.org Bugzilla:

Arguably this breaks W^X. Similar implementations such as PaX prevent this. About private mappings, POSIX leaves unspecified whether changes made to the file after the mmap() call are visible in the mapped region. My basic tests show it is not visible on Linux. That said, if there's a chance for them to ever be visible somehow MDWE should also prevent it.

Proof of concept:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <sys/prctl.h>

#ifndef PR_SET_MDWE
# define PR_SET_MDWE 65
#endif
#ifndef PR_MDWE_REFUSE_EXEC_GAIN
# define PR_MDWE_REFUSE_EXEC_GAIN 1
#endif

int main(void)
{
	int fd;
	char *addr;
	const char *data_x = "benign code";
	const char *data_X = "malicious code";
	size_t len_x = strlen(data_x);
	size_t len_X = strlen(data_X);

	// Step 0: Set MDWE to refuse EXEC gain.
	if (prctl(PR_SET_MDWE, PR_MDWE_REFUSE_EXEC_GAIN, 0, 0, 0) == -1) {
		perror("prctl(PR_SET_MDWE)");
		exit(ENOSYS);
	}

	// Step 1: Open file.
	fd = open("./mmap", O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);
	if (fd == -1) {
		perror("open");
		exit(EXIT_FAILURE);
	}

	// Write initial content.
	if (write(fd, data_x, len_x) != len_x) {
		perror("write");
		exit(EXIT_FAILURE);
	}

	// Step 2: Memory-map the file.
	addr = mmap(NULL, len_x, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
	if (addr == MAP_FAILED) {
		perror("mmap");
		exit(EXIT_FAILURE);
	}

	// Write new content to the file.
	if (lseek(fd, 0, SEEK_SET) == -1) {
		perror("lseek");
		exit(EXIT_FAILURE);
	}

	if (write(fd, data_X, len_X) != len_X) {
		perror("write");
		exit(EXIT_FAILURE);
	}

	// Close file, this will sync the contents to the read-only memory area.
	// This breaks W^X and MDWE should prevent this.
	close(fd);

	// Check the mapped memory.
	printf("[*] Mapped Content: %s\n", addr);
	if (!strncmp(addr, "malicious", strlen("malicious"))) {
		printf("[!] RX memory updated thru a backing file write under MDWE.\n");
	}

	unlink("./mmap");
	return EXIT_SUCCESS;
}

View: https://bugzilla.kernel.org/show_bug.cgi?id=219227#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

