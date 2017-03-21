#
#   Copyright (c) 2016-2017 CASM Organization
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 https://github.com/casm-lang/casm-lang.logo
#
#   This file is part of casm-lang.logo
#
#   casm-lang.logo is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   casm-lang.logo is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with casm-lang.logo. If not, see <http://www.gnu.org/licenses/>.
#

KIND  = icon
KIND += logo
KIND += rect
KIND += banner
KIND += slogan
KIND += qrcode

SOURCES = $(KIND:%=src/%.svg)

PNG  = 32
PNG += 48
PNG += 64
PNG += 96
PNG += 128
PNG += 192
PNG += 256
PNG += 384
PNG += 512
PNG += 768
PNG += 1024
PNG += 2048
PNG += 4096

PDF += 150
PDF += 300
PDF += 600

EXPORT  = $(PNG:%=var/export/icon/%.png)
EXPORT += $(PDF:%=var/export/icon/%.pdf)
EXPORT += $(PNG:%=var/export/logo/%.png)
EXPORT += $(PDF:%=var/export/logo/%.pdf)
EXPORT += $(PNG:%=var/export/rect/%.png)
EXPORT += $(PDF:%=var/export/rect/%.pdf)
EXPORT += $(PNG:%=var/export/banner/%.png)
EXPORT += $(PDF:%=var/export/banner/%.pdf)
EXPORT += $(PNG:%=var/export/slogan/%.png)
EXPORT += $(PDF:%=var/export/slogan/%.pdf)
EXPORT += $(PNG:%=var/export/qrcode/%.png)
EXPORT += $(PDF:%=var/export/qrcode/%.pdf)

EXPORT += etc/headline.png

default: $(EXPORT)

%.png: $(SOURCES)
	@echo
	@echo $@
	@inkscape -C -h `basename $@ .png` -e $@ src/`basename \`dirname $@\``.svg

%.pdf: $(SOURCES)
	@echo
	@echo $@
	@inkscape -C -d `basename $@ .pdf` -e $@ src/`basename \`dirname $@\``.svg

etc/headline.png: var/export/rect/64.png
	cp -f $< $@
