# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdegraphics-meta/kdegraphics-meta-7.ebuild,v 1.1 2005/08/05 22:51:42 unborn Exp $

KMSUBMODULES="
	gphoto2?(kamera)
	scanner?(libkscan)
	scanner?(kooka)
	povray?(kpovmodeler)
	kcoloredit
	kdegraphics-kfile-plugins
	kdvi
	kfax
	kgamma
	kghostview
	kiconedit
	kmrml
	kolourpaint
	kpdf
	kruler
	ksnapshot
	ksvg
	kuickshow
	kview
	kviewshell"
inherit kde-meta-parent

DESCRIPTION="kdegraphics - merge this to pull in all kdegraphics-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="gphoto2 scanner povray"

