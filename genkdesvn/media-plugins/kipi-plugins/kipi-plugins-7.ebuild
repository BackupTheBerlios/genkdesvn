# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-plugins/kipi-plugins/kipi-plugins-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=libs
KSCM_SUBDIR=$PN
inherit kde kde-source

DESCRIPTION="Plugins for libkipi."
HOMEPAGE="http://digikam.sourceforge.net/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~sparc amd64"
IUSE="opengl"

DEPEND="media-libs/libkexif
	media-libs/libkipi
	>=media-libs/libgphoto2-2.1.4
	>=media-libs/imlib2-1.1.0
	>=media-gfx/imagemagick-5.5.4
	>=media-video/mjpegtools-1.6.0
	opengl? ( virtual/opengl )"
RDEPEND="${DEPEND}
	media-gfx/dcraw"
need-kde 3.1

src_compile() {

	myconf="$(use_with opengl)"
	kde_src_compile all

}
