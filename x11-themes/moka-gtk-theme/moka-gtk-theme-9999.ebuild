# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

SRC_URL=""
EGIT_REPO_URI="https://github.com/moka-project/moka-gtk-theme.git"

LICENSE="GPL-3"
SLOT="0"

IUSE="+adwaita"	# Adwaita engine is recommended for rendering the angled tab geometry

RDEPEND="x11-themes/gtk-engines-murrine
	adwaita? ( x11-themes/gnome-themes-standard )"

src_install()
{
	insinto /usr/share/themes
	doins -r ${WORKDIR}/${P}/Moka || die
	doins -r ${WORKDIR}/${P}/Moka-Dark || die
}

