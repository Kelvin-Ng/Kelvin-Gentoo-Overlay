# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SRC_URI="https://github.com/snwh/moka-gtk-theme/raw/master/moka-gtk-theme.zip"

LICENSE="GPL-3"
SLOT="0"

IUSE="+adwaita"	# Adwaita engine is recommended for rendering the angled tab geometry

RDEPEND="x11-themes/gtk-engines-murrine
	adwaita? ( x11-themes/gnome-themes-standard )"

S="${WORKDIR}"

src_install()
{
	mkdir -p ${D}/usr/share/themes/
	cp -R ./Moka-Dark/ ${D}/usr/share/themes/
	cp -R ./Moka/ ${D}/usr/share/themes/
}

