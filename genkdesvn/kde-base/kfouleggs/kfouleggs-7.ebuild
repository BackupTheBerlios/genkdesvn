# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdegames
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="KDE games: KFoulEggs is an adaptation of the well-known (at least in Japan) PuyoPuyo game"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""
DEPEND="$(deprange $PV $MAXKDEVER kde-base/libkdegames)
$(deprange $PV $MAXKDEVER kde-base/libksirtet)"
OLDDEPEND="~kde-base/libkdegames-$PV ~kde-base/libksirtet-$PV"

KMEXTRACTONLY=libkdegames
KMCOMPILEONLY=libksirtet
KMCOPYLIB="libkdegames libkdegames"
