# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Cheerp is a C++ compiler for the Web, based and integrated into the LLVM/clang infrastructure."
HOMEPAGE="http://leaningtech.com/cheerp"
SRC_URI="https://github.com/leaningtech/${PN}/archive/cheerp-${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/leaningtech/cheerp-libcxx/archive/cheerp-${PV}.tar.gz -> cheerp-libcxx-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip"

DEPEND="sys-devel/cheerp"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-cheerp-${PV}"

src_configure() {
	cd "${S}/newlib"
	mkdir build
	cd build
	../configure --host=cheerp --with-cxx-headers="${WORKDIR}/cheerp-libcxx-cheerp-${PV}/include" --prefix="/opt/cheerp"

	cd "${S}"
	epatch -p1 "${FILESDIR}/build-bc-libs.sh.patch"
}

src_compile() {
	cd "${S}/newlib/build"
	emake
}

src_install() {
	cd "${S}/newlib/build"
	emake DESTDIR="${D}" install

	../build-bc-libs.sh
}

