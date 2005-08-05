# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdeutils-meta/kdeutils-meta-7.ebuild,v 1.1 2005/08/05 22:51:41 unborn Exp $

# We don't add kcardtools because it needs a libksmartcard from kdelibs that it's not alway installed"
KMSUBMODULES="
	lirc?(kdelirc)
	crypt?(kgpg)
	ark
	kcalc
	kcharselect
	kdf
	kedit
	kfloppy
	kgpg
	khexedit
	kjots
	klaptopdaemon
	kregexpeditor
	ksim
	ktimer
	kwalletmanager"
inherit kde-meta-parent

DESCRIPTION="kdeutils - merge this to pull in all kdeutils-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="crypt lirc"

