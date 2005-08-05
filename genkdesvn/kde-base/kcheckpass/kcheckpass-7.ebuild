# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kcheckpass/kcheckpass-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMNAME=kdebase
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="KDE pam client that allows you to auth as a specified user without actually doing anything as that user"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="pam"
DEPEND="pam? ( sys-libs/pam >=kde-base/kdebase-pam-5 ) !pam? ( sys-apps/shadow )"

