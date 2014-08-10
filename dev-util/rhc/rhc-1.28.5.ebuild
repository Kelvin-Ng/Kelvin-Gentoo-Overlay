# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19 ruby20 ruby21"

inherit ruby-fakegem

DESCRIPTION="The client tools for the OpenShift Express platform that allow for application management."
HOMEPAGE="https://openshift.redhat.com/app/express"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc64 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RUBY_FAKEGEM_EXTRAINSTALL="conf/"

ruby_add_rdepend "
	dev-ruby/archive-tar-minitar
	>=dev-ruby/commander-4.0
	>=dev-ruby/highline-1.6.11
	>=dev-ruby/httpclient-2.2
	>=dev-ruby/net-scp-1.1.2
	>=dev-ruby/net-ssh-2.0.11
	>=dev-ruby/net-ssh-multi-1.2.0
	dev-ruby/open4
	"

