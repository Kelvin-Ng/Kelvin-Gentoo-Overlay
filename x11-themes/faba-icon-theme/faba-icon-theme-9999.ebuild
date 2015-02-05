# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

SRC_URL=""
EGIT_REPO_URI="https://github.com/moka-project/faba-icon-theme.git"

LICENSE="LGPL-3"
SLOT="0"

src_install()
{
	insinto /usr/share/icons
	doins -r ${WORKDIR}/${P}/Faba || die
}

