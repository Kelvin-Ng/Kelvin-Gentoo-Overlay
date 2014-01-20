# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SRC_URI="https://github.com/snwh/moka-icon-theme/archive/master.zip"

LICENSE="CC-BY-SA-4.0"
SLOT="0"

S="${WORKDIR}/${PN}-master"

src_install()
{
	mkdir -p ${D}/usr/share/icons/
	cp -R ./Moka/ ${D}/usr/share/icons/
}

