# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kbugbuster/kbugbuster-7-r1.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KMNAME=kdesdk
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="KBugBuster - A tool for checking and reporting KDE apps' bugs"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="kcal"

DEPEND="kcal? ( $(deprange $PV $MAXKDEVER kde-base/libkcal) )
	$(deprange $PV $MAXKDEVER kde-base/libkdepim)"

#TODO tell configure about the optional kcal support, or something
