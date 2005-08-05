# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/app-office/kword/kword-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KMNAME=koffice
MAXKOFFICEVER=$PV
inherit kde-meta eutils kde-source

DESCRIPTION="KOffice Word Processor"
HOMEPAGE="http://www.koffice.org/"
LICENSE="GPL-2 LGPL-2"
KEYWORDS="x86 ~ppc amd64"
IUSE=""
SLOT="$PV"
DEPEND="$(deprange $PV $MAXKOFFICEVER app-office/koffice-libs)
	>=app-text/wv2-0.1.8
	>=media-gfx/imagemagick-5.4.5
	>=app-text/libwpd-0.8
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

KMEXTRACTONLY="lib/ kchart/kdchart"

KMCOMPILEONLY="filters/liboofilter interfaces/ kspread/"

KMEXTRA="filters/kword"

PATCHES="${FILESDIR}/CAN-2005-0064.patch"

need-kde 3.1
