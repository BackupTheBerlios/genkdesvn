# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/dev-util/kdbg/kdbg-7.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

ESF_SUBDIR=devel/kdbg
inherit kde sourceforge

DESCRIPTION="A Graphical Debugger Interface to gdb"
HOMEPAGE="http://members.nextra.at/johsixt/kdbg.html"
SRC_URI="http://download.berlios.de/genkdesvn/admin.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~sparc ~ppc ~amd64"
IUSE=""

RDEPEND=">=sys-devel/gdb-5.0"
need-kde 3

src_unpack() {
	cvs_src_unpack
	cd $S
	rm -r admin
	unpack $A
}

