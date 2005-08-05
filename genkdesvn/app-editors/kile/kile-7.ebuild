# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/app-editors/kile/kile-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=office
KSCM_SUBDIR=$PN
inherit kde kde-source

DESCRIPTION="A Latex Editor and TeX shell for kde"
HOMEPAGE="http://kile.sourceforge.net"
LICENSE="GPL-2"

KEYWORDS="~x86 ~amd64 ~sparc ~ppc"
IUSE="kde"

RDEPEND="dev-lang/perl
	virtual/tetex
	kde? ( || ( ( kde-base/kpdf
	              kde-base/kghostview
	              kde-base/kdvi
	              kde-base/kviewshell )
	            kde-base/kdegraphics ) )"
need-kde 3.2

