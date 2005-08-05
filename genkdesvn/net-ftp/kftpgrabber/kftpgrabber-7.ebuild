# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/net-ftp/kftpgrabber/kftpgrabber-7.ebuild,v 1.1 2005/08/05 22:51:43 unborn Exp $

KSCM_ROOT=extragear
KSCM_MODULE=network
KSCM_SUBDIR=kftpgrabber
inherit kde kde-source

DESCRIPTION="A graphical FTP client for KDE."
HOMEPAGE="http://kftpgrabber.sourceforge.net/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~86"
IUSE=""

DEPEND="dev-libs/openssl"
	
need-kde 3.3

