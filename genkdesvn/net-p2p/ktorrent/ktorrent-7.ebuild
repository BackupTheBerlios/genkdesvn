# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/net-p2p/ktorrent/ktorrent-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=trunk/extragear
KSCM_MODULE=network
KSCM_SUBDIR=ktorrent
inherit kde kde-source

DESCRIPTION="A BitTorrent program for KDE."
HOMEPAGE="http://ktorrent.pwsp.net/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

need-kde 3
