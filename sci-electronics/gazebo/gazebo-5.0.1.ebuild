EAPI=5

inherit eutils cmake-utils

DESCRIPTION="A 3D multiple robot simulator with dynamics."
HOMEPAGE="http://gazebosim.org"
SRC_URI="http://osrf-distributions.s3.amazonaws.com/gazebo/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+ffmpeg bullet +gts +gdal doc debug"	# TODO: dart, simbody, player

RDEPEND="
	>=dev-games/ogre-1.7.4
	>=dev-libs/protobuf-2.3
	dev-libs/protobuf-c
	>=dev-libs/tinyxml-2.6.2
	>=dev-libs/libxml2-2.7.7
	>=dev-cpp/tbb-3
	>=dev-libs/boost-1.40
	>=media-libs/freeimage-3[png]
	>=net-misc/curl-4[ssl,curl_ssl_openssl]
	>=dev-libs/libtar-1.2
	>=dev-games/cegui-0.7.5[ogre,truetype]
	media-libs/freeglut
	dev-qt/qtcore:4
	dev-qt/qttest:4
	media-libs/openal
	>=sci-electronics/sdformat-2.1.0
	ffmpeg? ( >=virtual/ffmpeg-0.8.3 )
	bullet? ( >=sci-physics/bullet-2.82 )
	gts? ( sci-libs/gts )
	gdal? ( sci-libs/gdal )"

DEPEND="${RDEPEND}
	>=dev-util/cmake-2.8
	virtual/pkgconfig
	>=sys-devel/libtool-2.4.2
	doc? ( app-doc/doxygen app-text/ronn )"

src_configure() {
	if use debug; then
		CMAKE_BUILD_TYPE=RelWithDebInfo
	else
		CMAKE_BUILD_TYPE=Release
	fi

    local mycmakeargs=(
		-DENABLE_TESTS_COMPILATION:BOOL=False
		$(cmake-utils_use_has ffmpeg)
		$(cmake-utils_use_has bullet)
		$(cmake-utils_use_has gts)
		$(cmake-utils_use_has gdal)
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	if use doc; then
		cd "${CMAKE_BUILD_DIR}"
		emake doc
	fi
}

src_install() {
	cmake-utils_src_install

	if use doc; then
		dohtml -r "${CMAKE_BUILD_DIR}"/doxygen/html/*
	fi
}

