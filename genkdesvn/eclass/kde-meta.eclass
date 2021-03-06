# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/eclass/kde-meta.eclass,v 1.1 2005/08/05 22:51:43 unborn Exp $
#
# Author Dan Armak <danarmak@gentoo.org>
# Simone Gotti <motaboy@gentoo.org>
#
# This is the kde-meta eclass which supports broken-up kde-base packages.

inherit kde multilib
ECLASS=kde-meta
INHERITED="$INHERITED $ECLASS"
IUSE="$IUSE kdexdeltas" 

# only broken-up ebuilds can use this eclass
if [ -z "$KMNAME" ]; then
	die "kde-meta.eclass inherited but KMNAME not defined - broken ebuild"
fi

# Replace the $myPx mess - it was ugly as well as not general enough for 3.4.0-rc1
# The following code should set TARBALLVER (the version in the tarball's name) 
# and TARBALLDIRVER (the version of the toplevel directory inside the tarball).
case "$PV" in
	3.4.0_alpha1)	TARBALLDIRVER="3.3.90"; TARBALLVER="3.3.90" ;;
	3.4.0_beta1)	TARBALLDIRVER="3.3.91"; TARBALLVER="3.3.91" ;;
	3.4.0_beta2)	TARBALLDIRVER="3.3.92"; TARBALLVER="3.3.92" ;;
	3.4.0_rc1)		TARBALLDIRVER="3.4.0"; TARBALLVER="3.4.0-rc1" ;;
	*)				TARBALLDIRVER="$PV"; TARBALLVER="$PV" ;;
esac
TARBALL="$KMNAME-$TARBALLVER.tar.bz2"

# BEGIN adapted from kde-dist.eclass, code for older versions removed for cleanness
if [ "$KDEBASE" = "true" ]; then
	unset SRC_URI
	
	need-kde $PV
	
	DESCRIPTION="KDE ${PV} - "
	HOMEPAGE="http://www.kde.org/"
	LICENSE="GPL-2"
	SLOT="$KDEMAJORVER.$KDEMINORVER"
	
	# Main tarball for normal downloading style
	# Note that we set SRC_PATH, and add it to SRC_URI later on
	case "$PV" in
		3.4.0_*)	SRC_PATH="unstable/$TARBALLVER/src/$TARBALL" ;;
		3.4.0)		SRC_PATH="stable/3.4/src/$TARBALL" ;;
		3*)			SRC_PATH="stable/$TARBALLVER/src/$TARBALL" ;;
		5)			SRC_PATH="" ;;
		7)			SRC_PATH="" ;;
		*)			die "$ECLASS: Error: unrecognized version $PV, could not set SRC_URI" ;;
	esac
	
	# Base tarball and xdeltas for patch downloading style
	# Note that we use XDELTA_BASE, XDELTA_DELTA again in src_unpack()
	# For future versions, add all applicable xdeltas (from x.y.0) in correct order to XDELTA_DELTA
	# For versions that don't have deltas, it's more efficient to leave XDELTA_BASE
	# unset, making src_unpack extract directly from the tarball in distfiles
	# Does anyone really want to make this code generic based on $TARBALLVER above?
	case "$PV" in
		3.4.0_beta1)	XDELTA_BASE="unstable/3.3.90/src/$KMNAME-3.3.90.tar.bz2"
						XDELTA_DELTA="unstable/3.3.91/src/$KMNAME-3.3.90-3.3.91.tar.xdelta"
						;;
		3.4.0_beta2)	XDELTA_BASE="unstable/3.3.90/src/$KMNAME-3.3.90.tar.bz2"
						XDELTA_DELTA="unstable/3.3.91/src/$KMNAME-3.3.90-3.3.91.tar.xdelta unstable/3.3.91/src/$KMNAME-3.3.91-3.3.92.tar.xdelta"
						;;
		3.4.0_rc1)		XDELTA_BASE="unstable/3.3.90/src/$KMNAME-3.3.90.tar.bz2"
						XDELTA_DELTA="unstable/3.3.91/src/$KMNAME-3.3.90-3.3.91.tar.xdelta unstable/3.3.91/src/$KMNAME-3.3.91-3.3.92.tar.xdelta unstable/3.4.0-rc1/src/$KMNAME-3.3.92-3.4.0-rc1.tar.xdelta"
						;;
		3.4.0)			;; # xdeltas break off at first stable version, since most people
							# don't have prerelease tarballs handy
		*)				;;
	esac	

elif [ "$KMNAME" == "koffice" ]; then
	SRC_PATH="mirror://kde/stable/koffice-$PV/src/koffice-$PV.tar.bz2"
	case $PV in
		1.3.4)
			XDELTA_BASE=""
			XDELTA_DELTA=""
			;;	
		1.3.5)
			XDELTA_BASE="stable/koffice-1.3.4/src/koffice-1.3.4.tar.bz2"
			XDELTA_DELTA="stable/koffice-1.3.5/src/koffice-1.3.4-1.3.5.tar.xdelta"
			;;
	esac
fi

# Common xdelta code
if [ -n "$XDELTA_BASE" ]; then # depends on $PV only, so is safe to modify SRC_URI inside it
	SRC_URI="$SRC_URI kdexdeltas? ( mirror://kde/$XDELTA_BASE "
	for x in $XDELTA_DELTA; do
		SRC_URI="$SRC_URI mirror://kde/$x"
	done
	SRC_URI="$SRC_URI ) !kdexdeltas? ( mirror://kde/$SRC_PATH )"
else # xdelta don't available, for example with kde 3.4 alpha/beta/rc ebuilds.
	SRC_URI="$SRC_URI mirror://kde/$SRC_PATH"
fi
	
debug-print "$ECLASS: finished, SRC_URI=$SRC_URI"

# Necessary dep for xdeltas. Hope like hell it doesn't worm its way into RDEPEND
# through the sneaky eclass dep mangling portage does.
DEPEND="$DEPEND kdexdeltas? ( dev-util/xdelta )"

# END adapted from kde-dist.eclass

# Add a blocking dep on the package we're derived from
DEPEND="$DEPEND !=$(get-parent-package $CATEGORY/$PN)-$SLOT*"
RDEPEND="$RDEPEND !=$(get-parent-package $CATEGORY/$PN)-$SLOT*"


# TODO FIX: Temporary place for code common to all ebuilds derived from any one metapackage.

# kdebase: all configure.in's talk about java. Need to investigate which ones 
# actually need it.
if [ "$KMNAME" == "kdebase" ]; then
	IUSE="$IUSE java"
	DEPEND="$DEPEND java? ( || ( virtual/jdk virtual/jre ) )"
	RDEPEND="$RDEPEND java? ( || ( virtual/jdk virtual/jre ) )"
	
	# bug 82032: the configure check for java is unnecessary as well as broken
	myconf="$myconf --without-java"
fi

# TODO FIX ends

# Set the following variables in the ebuild. Only KMNAME must be set, the rest are optional.
# A directory or file can be a path with any number of components (eg foo/bar/baz.h). 
# Do not include the same item in more than one of KMMODULE, KMMEXTRA, KMCOMPILEONLY, KMEXTRACTONLY, KMCOPYLIB.
#
# KMNAME: name of the metapackage (eg kdebase, kdepim). Must be set before inheriting this eclass
# (unlike the other parameters here), since it affects $SRC_URI.
# KMNOMODULE: unless set to "true", then KMMODULE will be not defined and so also the docs. Useful when we want to installs subdirs of a subproject, like plugins, and we have to mark the topsubdir ad KMEXTRACTONLY.
# KMMODULE: Defaults to $PN. Specify one subdirectory of KMNAME. Is treated exactly like items in KMEXTRA.
# Fex., the ebuild name of kdebase/l10n is kdebase-l10n, because just 'l10n' would be too confusing.
# KMNODOCS: unless set to "true", 'doc/$KMMODULE' is added to KMEXTRA. Set for packages that don't have docs.
# KMEXTRA, KMCOMPILEONLY, KMEXTRACTONLY: specify files/dirs to extract, compile and install. $KMMODULE
# is added to $KMEXTRA automatically. So is doc/$KMMODULE (unless $KMNODOCS==true).
# Makefiles are created automagically to compile/install the correct files. Observe these rules:
# - Don't specify the same file in more than one of the three variables.
# - When using KMEXTRA, remember to add the doc/foo dir for the extra dirs if one exists.
# - KMEXTRACTONLY take effect over an entire directory tree, you can override it defining 
# KMEXTRA, KMCOMPILEONLY for every subdir that must have a different behavior.
# eg. you have this tree:
# foo/bar
# foo/bar/baz1
# foo/bar/baz1/taz
# foo/bar/baz2
# If you define:
# KMEXTRACTONLY=foo/bar and KMEXTRA=foo/bar/baz1
# then the only directory compiled will be foo/bar/baz1 and not foo/bar/baz1/taz (also if it's a subdir of a KMEXTRA) or foo/bar/baz2
#
# IMPORTANT!!! you can't define a KMCOMPILEONLY SUBDIR if its parents are defined as KMEXTRA or KMMODULE. or it will be installed anywhere. To avoid this probably are needed some chenges to the generated Makefile.in.
#
# KMCOPYLIB: Contains an even number of $IFS (i.e. whitespace) -separated words. 
# Each two consecutive words, libname and dirname, are considered. symlinks are created under $S/$dirname
# pointing to $PREFIX/lib/libname*.

# ====================================================

# create a full path vars, and remove ALL the endings "/"
function create_fullpaths() {
	for item in $KMMODULE; do
		tmp=`echo $item | sed -e "s/\/*$//g"`
		KMMODULEFULLPATH="$KMMODULEFULLPATH ${S}/$tmp"
		if [ -z "$MODULE_DIR" ] && [ -n "$item" ]; then
			MODULE_DIR="$item"
		fi
	done
	for item in $KMEXTRA; do
		tmp=`echo $item | sed -e "s/\/*$//g"`
		KMEXTRAFULLPATH="$KMEXTRAFULLPATH ${S}/$tmp"
		if [ -z "$MODULE_DIR" ] && [ -n "$item" ]; then
			MODULE_DIR="$item"
		fi
	done
	for item in $KMCOMPILEONLY; do
		tmp=`echo $item | sed -e "s/\/*$//g"`
		KMCOMPILEONLYFULLPATH="$KMCOMPILEONLYFULLPATH ${S}/$tmp"
	done
	for item in $KMCFGONLY; do
		tmp=`echo $item | sed -e "s/\*$//g"`
		KMCFGONLYFULLPATH="$KMCFGONLYFULLPATH ${S}/$tmp"
	done
	for item in $KMUIONLY; do
		tmp=`echo $item | sed -e "s/\*$//g"`
		KMUIONLYFULLPATH="$KMUIONLYFULLPATH ${S}/$tmp"
	done
	for item in $KMEXTRACTONLY; do
		tmp=`echo $item | sed -e "s/\/*$//g"`
		KMEXTRACTONLYFULLPATH="$KMEXTRACTONLYFULLPATH ${S}/$tmp"
	done
}

# Creates Makefile.am files in directories where we didn't extract the originals.
# Params: $1 = directory
# $2 = $isextractonly: true iff the parent dir was defined as KMEXTRACTONLY
# Recurses through $S and all subdirs. Creates Makefile.am with SUBDIRS=<list of existing subdirs>
# or just empty all:, install: targets if no subdirs exist.
function change_makefiles() {
	debug-print-function $FUNCNAME $*
	local dirlistfullpath dirlist directory isextractonly

	cd $1
	debug-print "We are in `pwd`"
	
	# check if the dir is defined as KMEXTRACTONLY or if it was defined is KMEXTRACTONLY in the parent dir, this is valid only if it's not also defined as KMMODULE, KMEXTRA or KMCOMPILEONLY. They will ovverride KMEXTRACTONLY, but only in the current dir.
	isextractonly="false"
	if ( ( hasq "$1" $KMEXTRACTONLYFULLPATH || [ $2 = "true" ] ) && \
		 ( ! hasq "$1" $KMMODULEFULLPATH $KMEXTRAFULLPATH $KMCOMPILEONLYFULLPATH $KMCFGONLYFULLPATH ) ); then
		isextractonly="true"
	fi
	debug-print "isextractonly = $isextractonly"
	
	dirlistfullpath=
	for item in *; do
		if [ -d "$item" ] && [ "$item" != "CVS" ] && [ "$S/$item" != "$S/admin" ]; then
			# add it to the dirlist, with the FULL path and an ending "/"
			dirlistfullpath="$dirlistfullpath ${1}/${item}"
		fi
	done
	debug-print "dirlist = $dirlistfullpath"
	
	for directory in $dirlistfullpath; do
		
		if ( hasq "$1" $KMEXTRACTONLYFULLPATH || [ $2 = "true" ] ); then 
			change_makefiles $directory 'true'
		else
			change_makefiles $directory 'false'
		fi
		# come back to our dir
		cd $1
	done
	
	cd $1
	debug-print "Come back to `pwd`"
	debug-print "dirlist = $dirlistfullpath"
	if [ $isextractonly = "true" ] || [ ! -f Makefile.am ] ; then
		# if this is a latest subdir 
		if [ -z "$dirlistfullpath" ]; then
			debug-print "dirlist is empty => we are in the latest subdir"
			echo 'all:' > Makefile.am
			echo 'install:' >> Makefile.am
			echo '.PHONY: all' >> Makefile.am
		else # it's not a latest subdir
			debug-print "We aren't in the latest subdir"
			# remove the ending "/" and the full path"
			for directory in $dirlistfullpath; do
				directory=${directory%/}
				directory=${directory##*/}
				dirlist="$dirlist $directory"
			done
			echo "SUBDIRS=$dirlist" > Makefile.am
		fi
	fi
	
	# Fix broken include to avoid manual patches to each kdepim package
	if [ "$KMNAME" == "kdepim" ] && [ -f Makefile.am ]; then
		cat << EOF > edit.awk 
BEGIN {
	FS="=";
	SETFLAG="false";
	FLAG="-I\$(top_builddir)/libkdepim \$(all_includes) "
}
\$1 == "AM_CPPFLAGS " {
	print"AM_CPPFLAGS = " FLAG \$2; 
	SETFLAG = "true"
}
\$1 != "AM_CPPFLAGS " { 
	print \$0
} 
END { 
	if ( SETFLAG == "false" ) print "AM_CPPFLAGS = " FLAG
}
EOF
		awk -f edit.awk Makefile.am > Makefile.am.out
		mv Makefile.am.out Makefile.am
		rm edit.awk
	fi

}

function set_common_variables() {
	# Overridable module (subdirectory) name, with default value
	if [ "$KMNOMODULE" != "true" ] && [ -z "$KMMODULE" ]; then
		KMMODULE=$PN
	fi

	# Unless disabled, docs are also extracted, compiled and installed
	DOCS=""
	if [ "$KMNOMODULE" != "true" ] && [ "$KMNODOCS" != "true" ]; then
		DOCS="doc/$KMMODULE"
	fi
}

# This has function sections now. Call unpack, apply any patches not in $PATCHES,
# then call makefiles.
function kde-meta_src_unpack() {
	debug-print-function $FUNCNAME $*

	set_common_variables
	
	sections="$@"
	[ -z "$sections" ] && sections="unpack patches makefiles"
	for section in $sections; do
	case $section in
	prepare)

		# kdepim packages all seem to rely on libkdepim/kdepimmacros.h
		# also, all kdepim Makefile.am's reference doc/api/Doxyfile.am
		if [ "$KMNAME" == "kdepim" ]; then
			KMEXTRACTONLY="$KMEXTRACTONLY libkdepim/kdepimmacros.h doc/api"
		fi

		# deeplist stores common items in cvs and non-cvs meta-ebuilds
		# It is named deeplist because this list also represents items to be
		# recursively fetched in cvs
		deeplist="admin Makefile.am Makefile.am.in configure.in.in configure.in.bot configure.in.mid
		acinclude.m4 aclocal.m4 AUTHORS COPYING INSTALL README NEWS ChangeLog
		$KMMODULE $KMEXTRA $KMCFGONLY $KMUIONLY $KMCOMPILEONLY $KMEXTRACTONLY $DOCS"

	;;
	unpack)
		
		kde-meta_src_unpack "prepare"

		# Create final list of stuff to extract
		extractlist=""
		for item in Makefile.am configure.in.mid acinclude.m4 aclocal.m4 $deeplist
		do
			extractlist="$extractlist $KMNAME-$TARBALLDIRVER/$item"
		done


		# xdeltas require us to uncompress to a tar file first.
		# $KMTARPARAMS is also available for an ebuild to use; currently used by kturtle
		if useq kdexdeltas && [ -n "$XDELTA_BASE" ]; then
			echo ">>> Base archive + xdelta patch mode enabled."
			echo ">>> Uncompressing base archive..."
			cd $T
			RAWTARBALL=${TARBALL//.bz2}
			bunzip2 -dkc ${DISTDIR}/${XDELTA_BASE/*\//} > $RAWTARBALL
			for delta in $XDELTA_DELTA; do
				deltafile="${delta/*\//}"
				echo ">>> Applying xdelta: $deltafile"
				xdelta patch ${DISTDIR}/$deltafile $RAWTARBALL $RAWTARBALL.1
				mv $RAWTARBALL.1 $RAWTARBALL
			done
			TARFILE=$T/$RAWTARBALL
		else
			TARFILE=$DISTDIR/$TARBALL
			KMTARPARAMS="$KMTARPARAMS -j"
		fi
		cd $WORKDIR
		
		echo ">>> Extracting from tarball..."
		# Note that KMTARPARAMS is also used by an ebuild
		tar -xpf $TARFILE $KMTARPARAMS $extractlist	2> /dev/null
		
		# Avoid syncing if possible
		# No idea what the above comment means...
		if [ -n "$RAWTARBALL" ]; then
			rm -f $T/$RAWTARBALL
		fi
		
		# Default $S is based on $P not $myP; rename the extracted dir to fit $S
		mv $KMNAME-$TARBALLDIRVER $P
		S=$WORKDIR/$P

	;;
	patches)

		# Code moved here so kde-source can utilize it
		# Copy over KMCOPYLIB items
		libname=""
		for x in $KMCOPYLIB; do
			if [ "$libname" == "" ]; then
				libname=$x
			else
				dirname=$x
				cd $(objdir)
				mkdir -p ${dirname}
				cd ${dirname}
				if [ ! "$(find ${PREFIX}/$(get_libdir)/ -name "${libname}*")" == "" ]; then
					echo "Symlinking library ${libname} under ${PREFIX}/$(get_libdir)/ in source dir"
					ln -sf ${PREFIX}/$(get_libdir)/${libname}* .
				else
					die "Can't find library ${libname} under ${PREFIX}/$(get_libdir)/"
				fi
				libname=""
			fi
		done
	
		# apply any patches
		kde_src_unpack autopatch
	
		# kdebase: Remove the installation of the "startkde" script.
		if [ "$KMNAME" == "kdebase" ]; then
			sed -i -e s:"bin_SCRIPTS = startkde"::g ${S}/Makefile.am.in
		fi

		# for ebuilds with extended src_unpack
		cd $S

	;;	
	makefiles)

		# Create Makefile.am files
		create_fullpaths
		change_makefiles $S "false"

		# for ebuilds with extended src_unpack
		cd $S

	;;
	esac
	done
}

function kde-meta_src_compile() {
	debug-print-function $FUNCNAME $*
	
	set_common_variables	

	# kdebase: all configure.in's talk about java. Need to investigate which ones 
	# actually need it.
	if [ "$KMNAME" == "kdebase" ]; then
		if use java ; then
			if has_version virtual/jdk ; then
				myconf="$myconf --with-java=$(java-config --jdk-home)"
			else
				myconf="$myconf --with-java=$(java-config --jre-home)"
			fi
		else
			myconf="$myconf --without-java"
		fi
	fi
	
	# confcache support. valid only for my (danarmak's) port of stuart's confcache to portage .51,
	# not for stuart's orig version or ferringb's ebuild-daemon version.
	# this could be replaced by just using econf, but i don't want to make that change in kde.eclass
	# just yet. This way is more modular.
	callsections="$*"
	[ -z "$callsections" -o "$callsections" == "all" ] && callsections="myconf configure make"
	for section in $callsections; do
		debug-print "$FUNCNAME: now in section $section"
		if [ "$section" == "configure" ]; then
			# don't log makefile.common stuff in confcache
			[ ! -f "Makefile.in" ] && $(automake_cmd) admin/Makefile.common
			confcache_start
			myconf="$EXTRA_ECONF $myconf"
		fi

		# Handle these special cases before performing full make:
		# 1. Make config headers for folders indicated in $KMCFGONLY
		# 2. Make compile-only folders in order given in $KMCOMPILEONLY
		if [ "$section" == "make" ]; then

			# Note: this was added during experiments to correct compilation
			# failures. It may in fact be the case that if a config header is used,
			# then a library in the same folder would be needed as well.

			# If in make section, create necessary headers to satisfy
			# interdependencies before actually making.

			# For every dir listed in $KMCFGONLY
			for dir in $KMCFGONLYFULLPATH
			do

				# Go to indicated directory
				pushd $dir >/dev/null
				debug-print "Generating config headers in `pwd`"

				# Transform all .kcfgc files in it into .h files
				for kcfgc in *.kcfgc
				do
					keepobj $(emake_cmd) "`basename $kcfgc .kcfgc`.h" || die
					debug-print "Generated config header `pwd`/$kcfgc"
				done

				# Clean makefile as this directory is exclusively used for
				# compilation of config headers
	            echo 'all:' > Makefile
	            echo 'install:' >> Makefile
	            echo '.PHONY: all' >> Makefile

				# Return to original directory
				popd >/dev/null

			done

			for dir in $KMUIONLYFULLPATH
			do
				
				# Go to indicated directory
				pushd $dir >/dev/null
				debug-print "Generating config headers in `pwd`"

				# Transform all .ui files in it into .h files
				for ui in *.ui
				do
					uic $ui -o "`basename $ui .ui`.h" || die
					debug-print "Generated ui header `pwd`/$ui"
				done

				# Return to original directory
				popd >/dev/null

			done
			
			# Make in compile-only directories in order
			for dir in $KMCOMPILEONLYFULLPATH
			do
				# Go to indicated directory
				pushd $dir
				debug-print "Making compile-only `pwd`"

				# Make these dependencies now
				keepobj $(emake_cmd) || die

				# Return to original directory
				popd

			done
		fi

		kde_src_compile $section
		if [ "$section" == "configure" ]; then
			confcache_stop
		fi
	done
}

function kde-meta_src_install() {
	debug-print-function $FUNCNAME $*
	
	set_common_variables
	
	if [ "$1" == "" ]; then
		kde-meta_src_install make dodoc
	fi
	while [ -n "$1" ]; do
		case $1 in
		    make)
				for dir in $KMMODULE $KMEXTRA $DOCS; do
					if [ -d $S/$dir ]; then 
						cd $S/$dir
						keepobj $(make_cmd) DESTDIR=${D} destdir=${D} install || die
					fi
				done
				;;
		    dodoc)
				kde_src_install dodoc
				;;
		    all)
				kde-meta_src_install make dodoc
				;;
		esac
		shift
	done
}	

EXPORT_FUNCTIONS src_unpack src_compile src_install

