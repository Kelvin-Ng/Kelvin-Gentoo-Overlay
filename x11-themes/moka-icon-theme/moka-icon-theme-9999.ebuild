# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SRC_URI="http://jaist.dl.sourceforge.net/project/mokaproject/moka-icon-theme.zip"

LICENSE="CC-BY-SA-4.0"
SLOT="0"

S="${WORKDIR}"

src_install()
{
	mkdir -p ${D}/usr/share/icons/
	cp -R ./Moka/ ${D}/usr/share/icons/
}

