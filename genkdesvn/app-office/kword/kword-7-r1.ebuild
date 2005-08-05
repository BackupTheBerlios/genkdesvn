# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/app-office/kword/kword-7-r1.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KMNAME=koffice
MAXKOFFICEVER=$PV
inherit kde-meta eutils kde-source

DESCRIPTION="KOffice Word Processor"
HOMEPAGE="http://www.koffice.org/"
LICENSE="GPL-2 LGPL-2"

SLOT="$PV"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="$(deprange $PV $MAXKOFFICEVER app-office/koffice-libs)
	$(deprange $PV $MAXKOFFICEVER app-office/kspread)
	>=app-text/wv2-0.1.8
	>=media-gfx/imagemagick-5.5.2
	>=app-text/libwpd-0.8"

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
    libkstore lib/store
    libkspreadcommon kspread"

KMEXTRACTONLY="
    lib/
    kspread/"

KMCOMPILEONLY="filters/liboofilter"

KMUIONLY="lib/kotext"

KMEXTRA="filters/kword"

need-kde 3.3

