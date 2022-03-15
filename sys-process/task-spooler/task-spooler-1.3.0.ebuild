# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A scheduler for CPU tasks "
SRC_URI="https://github.com/justanhduc/${PN}/archive/refs/tags/v${PV}-cpu.tar.gz -> ${P}.tar.gz"

# A GPU version does exist, if anyone needs it, it can be added through a use flag

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
DOCS="Changelog OBJECTIVES PORTABILITY PROTOCOL README.md TRICKS"
HTML_DOCS=( web/index.html web/ts-0.2.1.png web/ts-0.5.4.ebuild web/article_linux_com.html )

S="${WORKDIR}/task-spooler-${PV}-cpu"

src_prepare() {
	default

	eapply "${FILESDIR}"/var-redefinition.patch

	cmake_src_prepare
}

src_test() {
	sh testbench.sh || die "tests failed"
}

src_install() {
	cd ${WORKDIR}/${P}-cpu_build
	mv ts tsp || die "Failed renaming ts executable into tsp"
	dobin tsp

	# When the use flag doc is enabled.
	if use doc; then
		cd ${S}
		einstalldocs
	fi
}