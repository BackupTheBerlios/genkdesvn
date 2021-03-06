# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/kde-base/kdebase-kioslaves/kdebase-kioslaves-7-r1.ebuild,v 1.1 2005/08/05 22:51:40 unborn Exp $

KMNAME=kdebase
KMMODULE=kioslave
MAXKDEVER=$PV
KM_DEPRANGE="$PV $MAXKDEVER"
KSCM_L10N_PO="\"kio_*\""
inherit kde-meta eutils kde-source

DESCRIPTION="kioslave: the kde VFS framework - kioslave plugins present a filesystem-like view of arbitrary data"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc ~ppc64"
IUSE="hal ldap samba"
DEPEND="ldap? ( net-nds/openldap )
	samba? ( >=net-fs/samba-3.0.1 )
	>=dev-libs/cyrus-sasl-2
	hal? ( >=sys-apps/dbus-0.22-r3
	       >=sys-apps/hal-0.4 )"
RDEPEND="${DEPEND}
	$(deprange $PV $MAXKDEVER kde-base/kdesktop)
	$(deprange $PV $MAXKDEVER kde-base/kdialog)"  # both for the kdeeject script used by the devices/mounthelper ioslave


src_compile () {

	myconf="$myconf `use_with ldap` `use_with hal`"
	kde-meta_src_compile

}

