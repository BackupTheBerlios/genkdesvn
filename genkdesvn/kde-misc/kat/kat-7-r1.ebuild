# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-misc/kat/kat-7-r1.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

inherit kde sourceforge


DESCRIPTION="The open source answer to WhereIsIt and Google Desktop Search"
HOMEPAGE="http://kat.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ia64"

DEPEND=">=app-text/poppler-0.3.1
	>=dev-db/sqlite-3.2.1
	sys-apps/attr"

need-kde 3.3

pkg_setup() {
	# check if poppler has been built with qt enabled
	if has_version poppler && ! built_with_use poppler qt ; then
		eerror "Re-emerge poppler with qt use-flag enabled!"
		die "You need poppler built with qt flag to compile ${PN}."
	fi
}

src_compile(){
    PREFIX="`kde-config --prefix`"
    kde_src_compile
}
