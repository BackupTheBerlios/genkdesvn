# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/libkdepim/libkdepim-7-r1.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMNAME=kdepim
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="common library for KDE PIM apps"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""
OLDDEPEND="~kde-base/libkcal-$PV"
DEPEND="
$(deprange $PV $MAXKDEVER kde-base/libkcal)"

KMCOPYLIB="libkcal libkcal"
KMCOMPILEONLY="libemailfunctions/"
KMEXTRA="libemailfunctions/"
