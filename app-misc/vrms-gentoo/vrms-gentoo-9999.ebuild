# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

SRC_URI=""
EGIT_REPO_URI="https://github.com/z411/${PN}.git"
inherit git-r3

DESCRIPTION="vrms clone for Gentoo Linux"
HOMEPAGE="https://github.com/z411/vrms-gentoo"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="
	dev-lang/perl
"

DOCS=( README.md )

src_install() {
	dobin "${PN}"
	einstalldocs
}
