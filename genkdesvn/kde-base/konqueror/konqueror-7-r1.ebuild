# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdebase
# Note: we need >=kdelibs-3.3.2-r1, but we don't want 3.3.3!
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta eutils kde-source

DESCRIPTION="KDE: Web browser, file manager, ..."
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

OLDDEPEND="~kde-base/libkonq-3.3.1"
DEPEND="
$(deprange $PV $MAXKDEVER kde-base/libkonq)"

RDEPEND="${DEPEND}
$(deprange $PV $MAXKDEVER kde-base/kcontrol)
java? ( || ( virtual/jdk virtual/jre ) )"

KMCOPYLIB="libkonq libkonq"
KMEXTRACTONLY=kdesktop/KDesktopIface.h
