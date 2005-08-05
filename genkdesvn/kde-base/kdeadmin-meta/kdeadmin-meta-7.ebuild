# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdeadmin-meta/kdeadmin-meta-7.ebuild,v 1.1 2005/08/05 22:51:41 unborn Exp $

KMSUBMODULES="
	x86?(lilo-config)
	kcron
	kdat
	kdeadmin-kfile-plugins
	kuser
	secpolicy"
# NOTE: kpackage, ksysv are useless on a normal gentoo system and so aren't included
# in the above list. However, packages do nominally exist for them.
inherit kde-meta-parent

DESCRIPTION="kdeadmin - merge this to pull in all kdeadmin-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

