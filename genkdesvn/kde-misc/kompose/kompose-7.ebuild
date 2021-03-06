# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-misc/kompose/kompose-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

inherit kde berlios

DESCRIPTION="A KDE fullscreen task manager."
HOMEPAGE="http://kompose.berlios.de"
SRC_URI="http://download.berlios.de/genkdesvn/admin.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""

DEPEND="media-libs/imlib2"
RDEPEND="media-libs/imlib2"
need-kde 3.2

src_unpack() {
	cvs_src_unpack
	cd $S
	rm -r admin
	unpack $A
}

