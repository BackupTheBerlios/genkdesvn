# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-libs/taglib/taglib-7-r1.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KSCM_ROOT=trunk/
KSCM_MODULE=kdesupport
ESCM_SHALLOWITEMS="$KSCM_ROOT$KSCM_MODULE"
ESCM_DEEPITEMS="branches/KDE/3.5/kde-common/admin $KSCM_ROOT$KSCM_MODULE/$PN"
KSCM_SUBDIR="$PN"
inherit kde-source unsermake

DESCRIPTION="A library for reading and editing audio meta data"
HOMEPAGE="http://developer.kde.org/~wheeler/taglib.html"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~mips"
IUSE="debug"

DEPEND="sys-libs/zlib"

src_unpack() {
	subversion_src_unpack
	mv $WORKDIR/branches/KDE/3.5/kde-common/admin $S/
}

src_compile() {
	$(automake_cmd) Makefile.cvs || die
	econf $(use_enable debug) || die
	$(emake_cmd) || die
}

src_install() {
	$(make_cmd) DESTDIR=${D} install || die
	dodoc AUTHORS ChangeLog README TODO
}
