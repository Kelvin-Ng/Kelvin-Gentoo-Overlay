# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

SRC_URL=""
EGIT_REPO_URI="https://github.com/moka-project/moka-icon-theme.git"

LICENSE="GPL-3"
SLOT="0"

DEPEND="x11-themes/faba-icon-theme"
RDEPEND="${DEPEND}"

src_install()
{
	insinto /usr/share/icons
	doins -r ${WORKDIR}/${P}/Moka || die
}

