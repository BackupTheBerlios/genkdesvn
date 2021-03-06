# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-gfx/showimg/showimg-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=graphics
KSCM_SUBDIR=showimg
inherit kde kde-source

DESCRIPTION="Feature-rich image viewer for KDE"
HOMEPAGE="http://www.jalix.org/projects/showimg/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~sparc ~ppc amd64"
IUSE=""

DEPEND="|| ( kde-base/libkonq kde-base/kdebase )
	media-libs/libkexif
	media-plugins/kipi-plugins"
need-kde 3.1

src_compile(){

	local myconf="--enable-libkipi"
	kde_src_compile all

}
