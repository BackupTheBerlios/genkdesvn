# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/dev-util/kdevelop/kdevelop-7-r1.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KSCM_ROOT=branches/KDE/3.5
UNSERMAKE=no
inherit kde eutils kde-source

DESCRIPTION="Integrated Development Enviroment for Unix, supporting KDE/Qt, C/C++ and a many other languages."
HOMEPAGE="http://www.kdevelop.org"
LICENSE="GPL-2"

SLOT="3"
KEYWORDS="~amd64 ~ppc ~sparc x86"
IUSE="ada clearcase fortran haskell java pascal perforce perl php python ruby sql subversion"

DEPEND="dev-lang/perl
	sys-devel/flex
	sys-devel/gdb
	subversion? ( dev-util/subversion )
	|| ( kde-base/cervisia kde-base/kdesdk )"

need-kde 3.3

PATCHES="${FILESDIR}/${P}-makefiles.patch"

src_compile() {
	local myconf="--with-kdelibsdoxy-dir=${KDEDIR}/share/doc/HTML/en/kdelibs-apidocs"

	# languages
	myconf="${myconf} $(use_enable java) $(use_enable python)
			$(use_enable ruby) $(use_enable ada) $(use_enable fortran)
			$(use_enable haskell) $(use_enable pascal) $(use_enable perl)
			$(use_enable php) $(use_enable sql)"

	# build tools
	myconf="${myconf} $(use_enable java antproject)"

	# version control systems
	myconf="${myconf} $(use_enable clearcase) $(use_enable perforce)
			$(use_enable subversion)"

	kde_src_compile
}

pkg_postinst() {
	einfo "kdevelop can use a wide range of apps for extra functionality. This is an almost"
	einfo "complete list. All these packages can be emerged after kdevelop."
	einfo
	einfo "kde-base/kdebase:               (RECOMMENDED) embed konsole kpart in kdevelop ide"
	einfo "dev-util/kdbg:                  (RECOMMENDED) kde frontend to gdb"
	einfo "dev-util/valgrind:              (RECOMMENDED) integrates valgrind (memory debugger) commands"
	einfo "kde-base/kompare:               (RECOMMENDED) show differences between files"
	einfo "dev-java/ant:                   support projects using the ant build tool"
	einfo "dev-util/ctags:                 faster and more powerful code browsing logic"
	einfo "app-doc/doxygen:                generate KDE-style documentation for your project"
	einfo "net-www/htdig:                  index and search your project's documentation"
	einfo "app-arch/rpm:                   support creating RPMs of your project"
	einfo "app-emulation/visualboyadvance: create and run projects for this gameboy"
	einfo
	einfo "Support for GNU-style make, tmake, qmake is included."
	einfo "Support for using clearcase, perforce and subversion"
	einfo "as version control systems is optional."
}
