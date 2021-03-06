# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdenetwork
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="VNC-compatible server to share KDE desktops"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="slp"
DEPEND="slp? ( net-libs/openslp )"

src_compile() {
	myconf="$myconf `use_enable slp`"
	kde-meta_src_compile
}
