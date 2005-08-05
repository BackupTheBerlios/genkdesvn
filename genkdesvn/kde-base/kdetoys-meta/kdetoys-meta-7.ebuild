# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdetoys-meta/kdetoys-meta-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMSUBMODULES="
	amor
	eyesapplet
	fifteenapplet
	kmoon
	kodo
	kteatime
	ktux
	kweather
	kworldwatch"
inherit kde-meta-parent

DESCRIPTION="kdetoys - merge this to pull in all kdetoys-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

