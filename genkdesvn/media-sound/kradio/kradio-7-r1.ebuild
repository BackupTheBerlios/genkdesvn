# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-sound/kradio/kradio-7-r1.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

ESF_SUBDIR=kradio3
inherit kde sourceforge

DESCRIPTION="kradio is a radio tuner application for KDE"
HOMEPAGE="http://kradio.sourceforge.net/"
#SRC_URI="http://download.berlios.de/genkdesvn/admin.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="lirc encode vorbis ogg"

RDEPEND="lirc? ( app-misc/lirc )
	media-libs/libsndfile
	encode? ( media-sound/lame )
	vorbis? ( media-libs/libvorbis )
	ogg? ( media-libs/libogg )"

need-kde 3.2

src_unpack() {
	cvs_src_unpack
	cd $WORKDIR
	unpack $A
	ln -s $WORKDIR/admin $S/admin
	# Visiblity stuff is way broken! Just disable it when it's present
	# until upstream finds a way to have it working right.
	if grep KDE_ENABLE_HIDDEN_VISIBILITY configure.in &> /dev/null || ! [[ -f configure ]]; then
	find ${S} -name configure.in.in | xargs sed -i -e 's:KDE_ENABLE_HIDDEN_VISIBILITY:echo Disabling hidden visibility:g'
		rm -f configure
	fi
}

src_compile() {
	if ! use vorbis; then
		sed -e 's/\(ac_cv_lib_vorbisenc_vorbis_encode_init=\)yes$/\1no/' \
			-i configure.in.in
	fi
	if ! use encode; then
		sed -e 's/\(ac_cv_lib_mp3lame_lame_init=\)yes$/\1no/' \
			-i configure.in.in
	fi
	if ! use ogg; then
		sed -e 's/\(ac_cv_lib_ogg_ogg_stream_packetin=\)yes$/\1no/' \
			-i configure.in.in
	fi
	myconf="$myconf $(use_with arts)"
	_UNSERMAKEOPTS="$UNSERMAKEOPTS"
	UNSERMAKEOPTS="$UNSERMAKEOPTS -k"
	kde_src_compile
	UNSERMAKEOPTS="$_UNSERMAKEOPTS"
	kde_src_compile
}
