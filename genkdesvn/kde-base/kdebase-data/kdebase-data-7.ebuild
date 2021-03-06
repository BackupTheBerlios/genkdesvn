# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdebase
KMNOMODULE=true
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="Icons, localization data and various .desktop files from kdebase. Includes the l10n, pics and applnk subdirs."
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

RDEPEND="
!kde-base/kdebase-l10n !kde-base/kdebase-applnk !kde-base/kdebase-pics" # replaced these three ebuilds

KMEXTRA="l10n pics applnk"

