# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-misc/krecipes/krecipes-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=utils
KSCM_SUBDIR=$PN
inherit kde kde-source

DESCRIPTION="A KDE Recipe Tool"
HOMEPAGE="http://krecipes.sourceforge.net"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="mysql postgres sqlite"

DEPEND="sqlite? ( dev-db/sqlite )"
RDEPEND="${DEPEND}
	mysql? ( dev-db/mysql )
	postgres? ( dev-db/postgresql )"

need-kde 3

pkg_setup() {
	if ! use sqlite && ! use mysql && ! use postgres; then
		eerror krecipes needs either SQLite, MySQL or PostgreSQL to work,
		eerror please try again with USE=\"sqlite\", USE=\"mysql\" or USE=\"postgres\".
		die
	fi
}

src_compile() {
	myconf="$(use_with sqlite) $(use_with mysql) $(use_with postgres postgresql)"

	kde_src_compile
}
