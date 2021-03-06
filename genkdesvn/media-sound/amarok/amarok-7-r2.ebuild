# Copyright 1999-2005 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header :$

KSCM_ROOT=extragear
KSCM_MODULE=multimedia
KSCM_SUBDIR=amarok
inherit kde eutils kde-source

DESCRIPTION="amaroK - the audio player for KDE."
HOMEPAGE="http://amarok.kde.org/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc -sparc ~x86"
IUSE="arts cdr flac gstreamer kde mp3 mysql noamazon opengl postgres sqlite xine xmms visualization vorbis"

DEPEND="kde? ( || ( ( kde-base/konqueror kdemultimedia-kioslaves ) 
		( kde-base/kdebase kde-base/kdemultimedia ) ) )
	arts? ( kde-base/arts
		|| ( ( kde-base/kdemultimedia-arts kde-base/akode )
		   kde-base/kdemultimedia ) )
    xine? ( >=media-libs/xine-lib-1 )
    gstreamer? ( >=media-libs/gstreamer-0.8.8 )
	>=media-libs/tunepimp-0.3.0
	>=media-libs/taglib-1.3.1
    opengl? ( virtual/opengl )
    xmms? ( >=media-sound/xmms-1.2 )
	mysql? ( >=dev-db/mysql-4 )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-db/sqlite )
	cdr? ( >=app-cdr/k3b-0.11 )
	visualization? ( media-libs/libsdl
		>=media-plugins/libvisual-plugins-0.2 )"

	
RDEPEND="${DEPEND}
    gstreamer? ( mp3? ( >=media-plugins/gst-plugins-mad-0.8.6 )
                 vorbis? ( >=media-plugins/gst-plugins-ogg-0.8.6
                           >=media-plugins/gst-plugins-vorbis-0.8.6)
                 flac? ( >=media-plugins/gst-plugins-flac-0.8.6 ) )"

DEPEND="${DEPEND}
	>=dev-util/pkgconfig-0.9.0"

need-kde 3.3

pkg_setup() {
	if use arts && ! use xine && ! use gstreamer; then
		ewarn "aRts support is deprecated, if you have problems please consider"
		ewarn "enabling support for Xine or GStreamer"
		ewarn "(emerge amarok again with USE=\"xine\" or USE=\"gstreamer\")."
		ebeep 2
	fi

	if ! use arts && ! use xine && ! use gstreamer; then
		eerror "amaroK needs either aRts (deprecated), Xine or GStreamer to work,"
		eerror "please try again with USE=\"arts\", USE=\"xine\" or USE=\"gstreamer\"."
		die
	fi

	# check whether kdelibs was compiled with arts support
	kde_pkg_setup
}

src_compile() {
	# amarok does not respect kde coding standards, and makes a lot of
	# assuptions regarding its installation directory. For this reason,
	# it must be installed in the KDE install directory.
	PREFIX="`kde-config --prefix`"

	local myconf="$(use_with arts) $(use_with xine) $(use_with gstreamer)
                  $(use_enable mysql) $(use_enable postgres postgresql) $(use_with !sqlite included-sqlite)
                  $(use_with opengl) $(use_with xmms)
                  $(use_with visualization libvisual)
                  $(use_enable !noamazon amazon)"

	kde_src_compile
}
