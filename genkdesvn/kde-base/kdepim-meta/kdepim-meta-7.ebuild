# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdepim-meta/kdepim-meta-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMSUBMODULES="
	pda?(kpilot)
	certmanager
	kaddressbook
	kalarm
	kandy
	karm
	kdepim-kioslaves
	kdepim-kresources
	kdepim-wizards
	kitchensync
	kmail
	kmailcvt
	knode
	knotes
	kode
	konsolekalendar
	kontact
	kontact-specialdates
	korganizer
	korn
	ksync
	ktnef
	libkcal
	libkdenetwork
	libkdepim
	libkholidays
	libkmime
	libkpgp
	libkpimexchange
	libkpimidentities
	libksieve
	mimelib
	networkstatus"
# 	not compiled by default
#	kmobile
inherit kde-meta-parent

DESCRIPTION="kdepim - merge this to pull in all kdepim-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="pda"


