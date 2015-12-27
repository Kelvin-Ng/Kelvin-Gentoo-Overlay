# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Cheerp is a C++ compiler for the Web, based and integrated into the LLVM/clang infrastructure."
HOMEPAGE="http://leaningtech.com/cheerp"
SRC_URI="https://github.com/leaningtech/${PN}/archive/cheerp-${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/leaningtech/cheerp-libcxxabi/archive/cheerp-${PV}.tar.gz -> cheerp-libcxxabi-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/cheerp
		sys-devel/cheerp-utils"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-cheerp-${PV}"

src_configure() {
	cd "${S}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="/opt/cheerp" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/opt/cheerp/share/cmake/Modules/CheerpToolchain.cmake -DLIBCXX_ENABLE_SHARED=OFF  -DLIBCXX_LIBCXXABI_INCLUDE_PATHS=${WORKDIR}/cheerp-libcxxabi-cheerp-${PV}/include -DLIBCXX_CXX_ABI=libcxxabi ..

}

src_compile() {
	cd "${S}/build"
	emake
}

src_install() {
	cd "${S}/build"
	emake DESTDIR="${D}" install
}

