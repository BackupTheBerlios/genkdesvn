# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-libs/libkipi/libkipi-7.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=libs
KSCM_SUBDIR=$PN
inherit kde kde-source

DESCRIPTION="A library for image plugins accross KDE applications."
HOMEPAGE="http://digikam.sourceforge.net/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc amd64 ~sparc"
IUSE=""

DEPEND="dev-util/pkgconfig"
need-kde 3.1
