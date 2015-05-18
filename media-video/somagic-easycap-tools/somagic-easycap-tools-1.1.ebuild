# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Linux Somagic EasyCAP DC60, EzCAP USB 2.0, and EasyCAP002 capture software"
HOMEPAGE="https://code.google.com/p/easycap-somagic-linux"
SRC_URI="https://easycap-somagic-linux.googlecode.com/files/${PN}_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/libusb dev-libs/libgcrypt"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}_${PV}"

src_install()
{
	emake PREFIX="${D}usr" install
}

