# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/geogebra/geogebra-4.1.120.0.ebuild,v 1.1 2014/08/23 15:59:10 amynka Exp $

EAPI=5

inherit eutils

DESCRIPTION="Mathematics software for geometry"
HOMEPAGE="http://www.geogebra.org/cms/en"
SRC_URI="http://download.geogebra.org/installers/5.0/GeoGebra-Linux-Portable-${PV}.tar.bz2"

LICENSE="GPL-3 CC-BY-SA-3.0 BSD public-domain GPL-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jdk-1.6.0-r1
	${DEPEND}"

S="${WORKDIR}/GeoGebra-Linux-Portable-${PV}"

src_install() {
	install -dm755 ${D}/usr/share/geogebra
	install ${S}/geogebra/* -t ${D}/usr/share/geogebra/

	install -Dm644 ${FILESDIR}/geogebra.desktop ${D}/usr/share/applications/geogebra.desktop
	install -Dm644 ${S}/geogebra.png ${D}/usr/share/pixmaps/geogebra.png

	install -dm755 ${D}/usr/bin
	cd ${D}/usr/bin
	ln -s ../share/geogebra/geogebra geogebra
}
