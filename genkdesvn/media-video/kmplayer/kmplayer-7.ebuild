# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-video/kmplayer/kmplayer-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=multimedia
KSCM_SUBDIR=kmplayer
inherit kde kde-source

DESCRIPTION="MPlayer frontend for KDE"
HOMEPAGE="http://www.xs4all.nl/~jjvrieze/kmplayer.html"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE="gstreamer xine"

DEPEND=">=media-video/mplayer-0.90
	xine? ( >=media-libs/xine-lib-1_beta12 )
	gstreamer? ( >=media-libs/gst-plugins-0.8.7 )"
need-kde 3.1

src_compile(){
	local myconf="$(use_with gstreamer) $(use_with xine)"
	kde_src_compile
}

