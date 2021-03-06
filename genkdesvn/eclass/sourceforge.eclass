# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/xubuntu/berlios_backup/github/tmp-cvs/genkdesvn/Repository/genkdesvn/eclass/sourceforge.eclass,v 1.1 2005/08/05 22:51:43 unborn Exp $

#
# Original Author: Mario Tanev
# Purpose: 
#

ECLASS="sourceforge"
INHERITED="$INHERITED $ECLASS"

ECVS_BRANCH=""

# If no module indicated in ebuild, assume package name is it
[ -z $ESF_MODULE ] && ESF_MODULE="$PN"
[ -z $ESF_SUBDIR ] && ESF_SUBDIR="$ESF_MODULE"
ECVS_MODULE="$ESF_SUBDIR" 

# If no user indicated in ebuild, assume anonymous login
[ -z $ESF_USER ] && ESF_USER="anonymous"
ECVS_USER="$ESF_USER"

# If no server indicated in ebuild, assume cvs.sourceforge.net
[ -z $ESF_SERVER ] && ESF_SERVER="cvs.sourceforge.net"
ECVS_SERVER="$ESF_SERVER:/cvsroot/$ESF_MODULE"

# 
S=$WORKDIR/$ESF_SUBDIR

# Set homepage to project page on sourceforge
HOMEPAGE="http://$ESF_MODULE.sourceforge.net"

inherit cvs

function sourceforge_src_unpack() {

	cvs_src_unpack

}

EXPORT_FUNCTIONS src_unpack

