# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdenetwork-meta/kdenetwork-meta-7.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KMSUBMODULES="
	dcoprss
	kdenetwork-filesharing
	kdict
	kget
	knewsticker
	kopete
	kpf
	kppp
	krdc
	krfb
	ksirc
	ktalkd
	librss
	kdnssd
	kdenetwork-kfile-plugins
	lisa
	wifi?(kwifimanager)"
inherit kde-meta-parent

DESCRIPTION="kdenetwork - merge this to pull in all kdenetwork-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="wifi"

