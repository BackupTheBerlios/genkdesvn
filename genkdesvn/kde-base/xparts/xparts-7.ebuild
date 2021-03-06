# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

KMNAME=kdebindings
KMEXTRACTONLY="dcopc"
KMCOPYLIB="libdcopc dcopc"
KM_MAKEFILESREV=1
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
inherit kde-meta kde-source

DESCRIPTION="Allows embedding of generic XParts as KDE KParts"
KEYWORDS="~x86 ~ppc" # broken according to upstream - 3.4a1 README
IUSE="mozilla"
DEPEND="=dev-libs/glib-1.2*
	=x11-libs/gtk+-1.2*
	mozilla? ( www-client/mozilla )"
PATCHES="$FILESDIR/no-gtk-glib-check.diff"

src_unpack() {
	kde-meta_src_unpack

	# Doesn't affect makefile tarballs.
	# Real solution will be to split this further and make a separate
	# ebuild for the mozilla xpart.
	# But since this is officially broken anyway I'm not going to bother...
	if ! useq mozilla ; then
		# disable mozilla bindings/xpart, because configure doesn't seem to do so
		# even when it doesn't detect the mozilla headers
		cd ${S}/xparts
		cp Makefile.am Makefile.am.orig
		sed -e 's:mozilla::' Makefile.am.orig > Makefile.am
	fi
	cd ${S} && make -f admin/Makefile.common
}

