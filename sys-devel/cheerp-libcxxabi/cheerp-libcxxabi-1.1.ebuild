# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Cheerp is a C++ compiler for the Web, based and integrated into the LLVM/clang infrastructure."
HOMEPAGE="http://leaningtech.com/cheerp"
SRC_URI="https://github.com/leaningtech/${PN}/archive/cheerp-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		sys-devel/cheerp"

S="${WORKDIR}/${PN}-cheerp-${PV}"

src_compile() {
	cd "${S}/lib"
	export CXX="/opt/cheerp/bin/clang -target cheerp"
	./buildit
}

src_install() {
	cd "${S}/lib"
	mkdir -p ${D}/opt/cheerp/lib
	cp libcxxabi.bc ${D}/opt/cheerp/lib
}

