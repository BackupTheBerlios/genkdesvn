# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-sound/kradio/kradio-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

inherit kde sourceforge

DESCRIPTION="kradio is a radio tuner application for KDE"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE="lirc"

DEPEND="lirc? ( app-misc/lirc )
	media-libs/libsndfile"
need-kde 3

