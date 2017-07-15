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

OBJ = obj

KIND  = icon
KIND += logo
KIND += rect
KIND += badge
KIND += badge_bw
KIND += badge_wb
KIND += banner
KIND += qrcode
KIND += twitter_bg
KIND += sticker
KIND += slogan
KIND += slogan_bw
KIND += slogan_wb

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
PDF += 1200
PDF += 2400

EXPORT  = $(PNG:%=$(OBJ)/icon/%.png)
EXPORT += $(PNG:%=$(OBJ)/logo/%.png)
EXPORT += $(PNG:%=$(OBJ)/rect/%.png)
EXPORT += $(PNG:%=$(OBJ)/badge/%.png)
EXPORT += $(PNG:%=$(OBJ)/badge_bw/%.png)
EXPORT += $(PNG:%=$(OBJ)/badge_wb/%.png)
EXPORT += $(PNG:%=$(OBJ)/banner/%.png)
EXPORT += $(PNG:%=$(OBJ)/qrcode/%.png)
EXPORT += $(PDF:%=$(OBJ)/twitter_bg/%.png)
EXPORT += $(PDF:%=$(OBJ)/sticker/%.png)
EXPORT += $(PNG:%=$(OBJ)/slogan/%.png)
EXPORT += $(PDF:%=$(OBJ)/slogan/%.pdf)
EXPORT += $(PNG:%=$(OBJ)/slogan_bw/%.png)
EXPORT += $(PDF:%=$(OBJ)/slogan_bw/%.pdf)
EXPORT += $(PNG:%=$(OBJ)/slogan_wb/%.png)
EXPORT += $(PDF:%=$(OBJ)/slogan_wb/%.pdf)

EXPORT += etc/headline.png

default: $(EXPORT)

%.png: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape -C -h `basename $@ .png` -e $@ src/`basename \`dirname $@\``.svg

%.pdf: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape -C -d `basename $@ .pdf` -A $@ src/`basename \`dirname $@\``.svg

etc/headline.png: $(OBJ)/rect/64.png
	cp -f $< $@
