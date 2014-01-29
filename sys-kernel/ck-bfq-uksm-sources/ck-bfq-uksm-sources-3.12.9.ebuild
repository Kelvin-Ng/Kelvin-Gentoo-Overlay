# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

ETYPE="sources"
KEYWORDS="~amd64 ~x86"
IUSE="+ck bfsonly +bfq +uksm +extra_cpu_opt"
REQUIRED_USE="bfsonly? ( ck )"

HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches/
	http://users.on.net/~ckolivas/kernel/
	http://kerneldedup.org/projects/uksm/
	https://github.com/graysky2/kernel_gcc_patch/"

K_WANT_GENPATCHES="base extras experimental"
K_EXP_GENPATCHES_PULL="1"
K_EXP_GENPATCHES_NOUSE="1"
K_GENPATCHES_VER="10"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"

inherit kernel-2
detect_version
detect_arch

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

DESCRIPTION="Full Linux ${K_BRANCH_ID} kernel sources with Con Kolivas' high performance patchset, BFQ, UKSM, pathset for additional cpu optimizations and Gentoo's genpatches"

#-- If Gentoo-Sources don't follow then extra incremental patches are needed -

XTRA_INCP_MIN=""
XTRA_INCP_MAX=""

#--

CK_VERSION="2"
BFS_VERSION="444"
UKSM_VERSION="0.1.2.2-for-v3.12"

CK_FILE="patch-${K_BRANCH_ID}-ck${CK_VERSION}.bz2"
BFS_FILE="${K_BRANCH_ID}-sched-bfs-${BFS_VERSION}.patch"
UKSM_FILE="uksm-${UKSM_VERSION}.patch"
EXTRA_CPU_OPT_FILE="enable_additional_cpu_optimizations_for_gcc.patch.gz"

CK_BASE_URL="http://ck.kolivas.org/patches/3.0"
CK_LVER_URL="${CK_BASE_URL}/${K_BRANCH_ID}/${K_BRANCH_ID}-ck${CK_VERSION}"
CK_URI="${CK_LVER_URL}/${CK_FILE}"
BFS_URI="${CK_LVER_URL}/patches/${BFS_FILE}"
UKSM_URI="http://kerneldedup.org/download/uksm/0.1.2.2/${UKSM_FILE}"
EXTRA_CPU_OPT_URI="http://repo-ck.com/source/gcc_patch/${EXTRA_CPU_OPT_FILE}"

#-- Build extra incremental patches list --------------------------------------

LX_INCP_URI=""
LX_INCP_LIST=""
if [ -n "${XTRA_INCP_MIN}" ]; then
	LX_INCP_URL="${KERNEL_BASE_URI}/incr"
	for i in `seq ${XTRA_INCP_MIN} ${XTRA_INCP_MAX}`; do
		LX_INCP[i]="patch-${K_BRANCH_ID}.${i}-$(($i+1)).bz2"
		LX_INCP_URI="${LX_INCP_URI} ${LX_INCP_URL}/${LX_INCP[i]}"
		LX_INCP_LIST="${LX_INCP_LIST} ${DISTDIR}/${LX_INCP[i]}"
	done
fi

#-- CK needs sometimes to patch itself... (3.7)--------------------------------

if use ck ; then
	CK_INCP_URI=""
	CK_INCP_LIST=""

#-- Local patches needed for the ck-patches to apply smoothly (3.4/3.5) -------

	PRE_CK_FIX=""
	POST_CK_FIX=""
fi

#--

SRC_URI="${KERNEL_URI} ${LX_INCP_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CK_INCP_URI}
	!bfsonly? ( ck? ( ${CK_URI} ) )
	bfsonly? ( ck? ( ${BFS_URI} ) )
	uksm? ( ${UKSM_URI} )
	extra_cpu_opt? ( ${EXTRA_CPU_OPT_URI} )"

UNIPATCH_LIST="${LX_INCP_LIST} ${PRE_CK_FIX} ${DISTDIR}"

if ! use bfsonly -a use ck ; then
	UNIPATCH_LIST="${UNIPATCH_LIST}/${CK_FILE}"
else
	UNIPATCH_LIST="${UNIPATCH_LIST}/${BFS_FILE}"
fi

if use uksm ; then
	UNIPATCH_LIST="${UNIPATCH_LIST} ${DISTDIR}/${UKSM_FILE}"
fi

if use extra_cpu_opt ; then
	UNIPATCH_LIST="${UNIPATCH_LIST} ${DISTDIR}/${EXTRA_CPU_OPT_FILE}"
fi

UNIPATCH_LIST="${UNIPATCH_LIST} ${CK_INCP_LIST} ${POST_CK_FIX}"

UNIPATCH_STRICTORDER="yes"

#-- Since experimental genpatches && we want BFQ irrespective of experimental -

if use bfq ; then
	K_EXP_GENPATCHES_LIST="50*_*.patch*"
fi

src_prepare() {

#-- Comment out CK's EXTRAVERSION in Makefile ---------------------------------

	sed -i -e 's/\(^EXTRAVERSION :=.*$\)/# \1/' "${S}/Makefile"
}

pkg_postinst() {

	kernel-2_pkg_postinst

	elog
	elog "For more info on this patchset, see: http://forums.gentoo.org/viewtopic-t-941030-start-0.html"
	elog
}
