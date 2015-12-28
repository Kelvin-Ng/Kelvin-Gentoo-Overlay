# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="MuPDF-based backend for Okular"
HOMEPAGE="https://github.com/xylosper/okular-backend-mupdf"
EGIT_REPO_URI="https://github.com/xylosper/okular-backend-mupdf.git"
SRC_URI=""

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="kde-apps/okular media-libs/openjpeg app-text/mupdf dev-lang/mujs"
RDEPEND="${DEPEND}"
