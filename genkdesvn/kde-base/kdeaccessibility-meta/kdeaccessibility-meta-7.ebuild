# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdeaccessibility-meta/kdeaccessibility-meta-7.ebuild,v 1.1 2005/08/05 22:51:41 unborn Exp $

KMSUBMODULES="
	arts?(ksayit)
	arts?(kttsd)
	kmag
	kdeaccessibility-iconthemes
	kmousetool
	kbstateapplet
	kmouth"
inherit kde-meta-parent

DESCRIPTION="kdeaccessibility - merge this to pull in all kdeaccessiblity-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="arts"

