# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/app-office/krita/krita-7-r2.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

MAXKOFFICEVER=${PV}
KMNAME=koffice
inherit kde-meta eutils kde-source

DESCRIPTION="KOffice image manipulation program."
HOMEPAGE="http://www.koffice.org/"
LICENSE="GPL-2 LGPL-2"

SLOT="$PV"
KEYWORDS="~amd64 ~x86"
IUSE="javascript"

RDEPEND="$(deprange $PV $MAXKOFFICEVER app-office/koffice-libs)
	>=media-gfx/imagemagick-5.5.2
	media-libs/lcms
	javascript? ( kde-base/kjsembed )"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkoscript lib/koscript
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store"

KMEXTRACTONLY="lib/"

KMEXTRA="filters/krita"

need-kde 3.3
