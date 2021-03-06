# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit kde eutils flag-o-matic kde-source
set-kdedir 7

DESCRIPTION="KDE libraries needed by all kde programs"
HOMEPAGE="http://www.kde.org/"
SRC_URI=""
LICENSE="GPL-2 LGPL-2"
SLOT="$PV"
KEYWORDS="~x86 ~amd64 ~sparc ~ppc ~ppc64"
IUSE="alsa arts cups doc jpeg2k kerberos openexr spell ssl tiff zeroconf"

# kde.eclass has kdelibs in DEPEND, and we can't have that in here.
# so we recreate the entire DEPEND from scratch.
RDEPEND="arts? ( ~kde-base/arts-${PV} )
	>=x11-libs/qt-3.3.3
	app-arch/bzip2
	>=dev-libs/libxslt-1.1.4
	>=dev-libs/libxml2-2.6.6
	>=dev-libs/libpcre-4.2
	media-libs/libart_lgpl
	net-dns/libidn
	ssl? ( >=dev-libs/openssl-0.9.7d )
	alsa? ( media-libs/alsa-lib )
	cups? ( >=net-print/cups-1.1.19 )
	tiff? ( media-libs/tiff )
	kerberos? ( virtual/krb5 )
	jpeg2k? ( media-libs/jasper )
	openexr? ( >=media-libs/openexr-1.2 )
	spell? ( || ( app-text/aspell
		      app-text/ispell ) )
	zeroconf? ( net-misc/mDNSResponder )
	virtual/fam
	virtual/ghostscript"

DEPEND="${RDEPEND}
	>=sys-devel/autoconf-2.58
	>=sys-devel/automake-1.8
	doc? ( app-doc/doxygen )
	sys-devel/gettext"

src_compile() {

	# Allow for choice between 3 and 7, depending on what's installed
	has_version '>=x11-libs/qt-7' && export QTDIR="/usr/qt/devel" || export QTDIR="/usr/qt/3"

	myconf="--with-distribution=Gentoo --enable-libfam --enable-dnotify"
	myconf="${myconf} $(use_with alsa) $(use_with arts)"
	myconf="${myconf} $(use_with tiff) $(use_with jpeg2k jasper) $(use_with openexr)"
	myconf="${myconf} $(use_enable cups) $(use_enable zeroconf dnssd)"

	use ssl && myconf="${myconf} --with-ssl-dir=/usr" || myconf="${myconf} --without-ssl"

	use kerberos || myconf="${myconf} --with-gssapi=no"

	use x86 && myconf="${myconf} --enable-fast-malloc=full"

	# fix bug 58179, 85593
	use ppc64 && append-flags "-fno-gcse"

	kde_src_compile

	use doc && make apidox
}

src_install() {

	kde_src_install

	use doc && make DESTDIR=${D} install-apidox

	# needed to fix lib64 issues on amd64, see bug #45669
	use amd64 && ln -s ${KDEDIR}/lib ${D}/${KDEDIR}/lib64

	# Needed to create lib -> lib64 symlink for amd64 2005.0 profile
	if [ "${SYMLINK_LIB}" = "yes" ]; then
		dosym $(get_abi_LIBDIR ${DEFAULT_ABI}) ${KDEDIR}/lib
	fi

	if ! use arts ; then
		dodir /etc/env.d

		cat <<EOF > ${D}/etc/env.d/25kdepaths-${SLOT} # number goes down with version upgrade
PATH=${PREFIX}/bin
ROOTPATH=${PREFIX}/sbin:${PREFIX}/bin
LDPATH=${PREFIX}/lib
CONFIG_PROTECT="${PREFIX}/share/config ${PREFIX}/env ${PREFIX}/shutdown"
EOF
	fi

}
