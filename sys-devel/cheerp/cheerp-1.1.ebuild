# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Cheerp is a C++ compiler for the Web, based and integrated into the LLVM/clang infrastructure."
HOMEPAGE="http://leaningtech.com/cheerp"
SRC_URI="https://github.com/leaningtech/cheerp-llvm/archive/cheerp-${PV}.tar.gz -> cheerp-llvm-${PV}.tar.gz
         https://github.com/leaningtech/cheerp-clang/archive/cheerp-${PV}.tar.gz -> cheerp-clang-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-devel/cheerp-libcxx
sys-devel/cheerp-libcxxabi
sys-devel/cheerp-libs
sys-devel/cheerp-newlib
sys-devel/cheerp-utils"

S="${WORKDIR}/cheerp-llvm-cheerp-${PV}"

src_unpack() {
	default

	mv "${WORKDIR}/cheerp-clang-cheerp-1.1" "${S}/tools/clang"
}

src_configure() {
	cd "${S}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="/opt/cheerp" -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="ARM;CheerpBackend;X86" ..
}

src_compile() {
	cd "${S}/build"
	emake
}

src_install() {
	cd "${S}/build"
	emake DESTDIR="${D}" install
}

