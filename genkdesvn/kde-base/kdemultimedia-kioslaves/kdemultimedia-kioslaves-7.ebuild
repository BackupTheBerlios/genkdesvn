# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdemultimedia
KMMODULE=kioslave
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="kioslaves from kdemultimedia package"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="oggvorbis flac encode"
DEPEND="$(deprange $PV $MAXKDEVER kde-base/libkcddb)
	media-sound/cdparanoia
	media-libs/taglib
	oggvorbis? ( media-libs/libvorbis )
	flac? ( media-libs/flac )
	encode? ( media-sound/lame )"
KMCOPYLIB="libkcddb libkcddb"
KMEXTRACTONLY="akode/configure.in.in"
KMCOMPILEONLY="libkcddb/"

src_compile() {
	myconf="--with-cdparanoia --enable-cdparanoia"
	use oggvorbis && myconf="$myconf --with-vorbis=/usr" || myconf="$myconf --without-vorbis"
	DO_NOT_COMPILE=libkcddb kde-meta_src_compile myconf configure
	cd $S/libkcddb && make configbase.h
	DO_NOT_COMPILE=libkcddb kde-meta_src_compile make
}
