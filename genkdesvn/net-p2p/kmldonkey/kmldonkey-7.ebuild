# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/net-p2p/kmldonkey/kmldonkey-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=network
KSCM_SUBDIR=kmldonkey
inherit kde eutils kde-source

DESCRIPTION="Provides integration for the MLDonkey P2P software and KDE 3"
HOMEPAGE="http://www.kmldonkey.org/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ~ppc ~amd64"
IUSE="arts"

DEPEND="|| ( kde-base/kcontrol kde-base/kdebase )"
RDEPEND="${DEPEND}"

need-kde 3
PATCHES="${FILESDIR}/${P}-sandbox.patch"

pkg_postinst() {
	echo
	echo
	einfo "To configure Kmldonkey use your KDE ControlCenter"
	einfo "To load the Kmldonkey GUI interface, just add the"
	einfo "MLDonkeyApplet miniprog to your taskbar"
	echo
	echo
}
