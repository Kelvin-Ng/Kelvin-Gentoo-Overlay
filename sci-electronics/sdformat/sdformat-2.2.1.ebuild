# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="XML format describing environments for robotic applications"
HOMEPAGE="http://sdformat.org"
SRC_URI="https://bitbucket.org/osrf/sdformat/get/sdformat2_${PV}.tar.bz2"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="
	>=dev-libs/tinyxml-2.6
	>=dev-libs/boost-1.40
"
RDEPEND="
	${DEPEND}
	>=dev-util/cmake-2.8
	doc? ( app-doc/doxygen )
"
S="${WORKDIR}/osrf-sdformat-fcfb17aa1b0e"

src_compile() {
	cmake-utils_src_compile

	if use doc; then
		cd "${CMAKE_BUILD_DIR}"
		emake doc
	fi
}

src_install() {
	cmake-utils_src_install

	if use doc; then
		dohtml -r "${CMAKE_BUILD_DIR}"/doxygen/html/*
	fi
}

