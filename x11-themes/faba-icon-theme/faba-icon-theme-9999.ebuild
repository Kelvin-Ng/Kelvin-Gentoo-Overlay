# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SRC_URI="https://github.com/snwh/faba-icon-theme/raw/master/faba-icon-theme.zip"

LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}"

src_install()
{
	mkdir -p ${D}/usr/share/icons/
	cp -R ./Faba/ ${D}/usr/share/icons/
}

