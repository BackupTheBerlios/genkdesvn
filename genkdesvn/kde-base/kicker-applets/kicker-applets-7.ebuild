# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdeaddons
KMNOMODULE=true
KMEXTRA="kicker-applets doc/kicker-applets"
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="kicker applets"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="xmms"
OLDDEPEND="~kde-base/kicker-$PV
	xmms? ( media-sound/xmms )"
DEPEND="xmms? ( media-sound/xmms )
$(deprange-dual $PV $MAXKDEVER kde-base/kicker)"

use xmms || export ac_cv_have_xmms=no


