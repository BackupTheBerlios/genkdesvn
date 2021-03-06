# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdeaccessibility
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="KD text-to-speech frontend app"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""
DEPEND="$(deprange $PV $MAXKDEVER kde-base/kttsd)
	$(deprange $PV $MAXKDEVER kde-base/arts)
	$(deprange-dual $PV $MAXKDEVER kde-base/kdemultimedia-arts)"
myconf="--enable-ksayit-audio-plugins"
