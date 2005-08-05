# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdeaddons-meta/kdeaddons-meta-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMSUBMODULES="
	arts?(noatun-plugins)
	atlantikdesigner
	knewsticker-scripts
	ksig
	vimpart
	kaddressbook-plugins
	kate-plugins
	kicker-applets
	kdeaddons-kfile-plugins
	konq-plugins
	konqueror-akregator
	kdeaddons-docs-konq-plugins
	renamedlg-audio
	renamedlg-images"
inherit kde-meta-parent

DESCRIPTION="kdeaddons - merge this to pull in all kdeaddons-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"

