# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PLOCALES="cs el en es eu fi gl he_IL hu ja ka lt ms_MY nn_NO pl pt_BR pt ru_RU sv tr uk zh_CN zh_TW"
inherit l10n qt4-r2

DESCRIPTION="YouTube Browser for SMPlayer"
HOMEPAGE="http://smplayer.sourceforge.net/smtube"
SRC_URI="mirror://sourceforge/smplayer/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtgui:4"
RDEPEND="${DEPEND}
	|| ( media-video/smplayer media-video/mplayer media-video/vlc kde-base/dragon media-video/totem media-video/gnome-mplayer )"

src_prepare() {
	eqmake4 src/${PN}.pro
}

gen_translation() {
	lrelease ${PN}_${1}.ts
	eend $? || die "failed to generate $1 translation"
}

src_compile() {
	emake

	cd "${S}"/src/translations
	l10n_for_each_locale_do gen_translation
}

install_locale() {
	insinto /usr/share/${PN}/translations
	doins "${S}"/src/translations/${PN}_${1}.qm
	eend $? || die "failed to install $1 translation"
}

src_install() {
	dobin ${PN}
	domenu ${PN}.desktop
	newicon icons/${PN}_64.png ${PN}.png
	dodoc Changelog

	l10n_for_each_locale_do install_locale
}

