# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/media-plugins/digikamimageplugins/digikamimageplugins-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=graphics
KSCM_SUBDIR=digikamimageplugins
inherit kde kde-source

DESCRIPTION="DigikamImagePlugins are a collection of plugins for Digikam Image Editor."
HOMEPAGE="http://digikam.sourceforge.net/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

DEPEND="~media-gfx/digikam-${PV}
	>=media-gfx/imagemagick-5.5.4
	>=media-video/mjpegtools-1.6.0
	virtual/opengl"
need-kde 3.2
