# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdialog/kdialog-7-r2.ebuild,v 1.1 2005/08/05 22:51:41 unborn Exp $

KMNAME=kdebase
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="KDialog can be used to show nice dialog boxes from shell scripts"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

RDEPEND="virtual/eject"

KMNODOCS=true
KMEXTRA="kdeeject"
