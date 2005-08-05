# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/app-office/koffice-data/koffice-data-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

MAXKOFFICEVER=$PV
KMNAME=koffice
KMMODULE=
KMNOMODULE="true"
inherit kde-meta eutils kde-source

DESCRIPTION="shared koffice data files"
HOMEPAGE="http://www.koffice.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="x86 ~ppc amd64"

IUSE=""
SLOT="$PV"

RDEPEND=""

DEPEND="dev-util/pkgconfig"

KMEXTRA="
	mimetypes/
	servicetypes/
	pics/
	templates/
	autocorrect/"

need-kde 3.3
