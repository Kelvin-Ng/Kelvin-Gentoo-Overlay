# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

if [ "${ARCH}" == "amd64" ]; then
	SRC_URI="http://ftp.ubuntu-tw.net/mirror/ubuntu/pool/universe/h/hfsprogs/hfsprogs_332.25-11_amd64.deb"
else
	SRC_URI="http://ftp.ubuntu-tw.net/mirror/ubuntu/pool/universe/h/hfsprogs/hfsprogs_332.25-11_i386.deb"
fi

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

S="${WORKDIR}"

src_unpack()
{
	unpack ${A}
}

src_install()
{
	cd ${S}
	tar -xf data.tar.gz -C "${D}"
}

