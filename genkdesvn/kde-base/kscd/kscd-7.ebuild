# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdemultimedia
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="KDE CD player"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""
OLDDEPEND="~kde-base/libkcddb-3.3.1"
DEPEND="
$(deprange $PV $MAXKDEVER kde-base/libkcddb)"

KMCOPYLIB="libkcddb libkcddb"
KMEXTRACTONLY="
	mpeglib_artsplug/configure.in.in"

KMCOMPILEONLY="libkcddb"

src_compile() {
	DO_NOT_COMPILE=libkcddb kde-meta_src_compile myconf configure
	cd $S/libkcddb && make configbase.h
	cd $S/libkcddb && make cdinfodialogbase.h
	DO_NOT_COMPILE=libkcddb kde-meta_src_compile make
}
