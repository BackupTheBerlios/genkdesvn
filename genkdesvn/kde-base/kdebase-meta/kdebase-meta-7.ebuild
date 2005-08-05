# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdebase-meta/kdebase-meta-7.ebuild,v 1.1 2005/08/05 22:51:41 unborn Exp $

KMSUBMODULES="
	kdebase-startkde
	drkonqi
	kappfinder
	kate
	kcheckpass
	kcminit
	kcontrol
	kdcop
	kdebugdialog
	kdepasswd
	kdeprint
	kdesktop
	kdesu
	kdialog
	kdm
	kfind
	khelpcenter
	khotkeys
	kicker
	kdebase-kioslaves
	klipper
	kmenuedit
	konqueror
	konsole
	kpager
	kpersonalizer
	kreadconfig
	kscreensaver
	ksmserver
	ksplashml
	kstart
	ksysguard
	ksystraycmd
	ktip
	kwin
	kxkb
	libkonq
	nsplugins
	knetattach
	kdebase-data"
inherit kde-meta-parent

DESCRIPTION="kdebase - merge this to pull in all kdebase-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE=""

