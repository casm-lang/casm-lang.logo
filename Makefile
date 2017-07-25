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

SIZE  = 32
SIZE += 48
SIZE += 64
SIZE += 96
SIZE += 128
SIZE += 150
SIZE += 192
SIZE += 256
SIZE += 300
SIZE += 384
SIZE += 512
SIZE += 600
SIZE += 768
SIZE += 1024
SIZE += 1200
SIZE += 2048
SIZE += 2400
SIZE += 4096

EXPORT  = $(SIZE:%=$(OBJ)/icon/%.png)
EXPORT += $(SIZE:%=$(OBJ)/logo/%.png)
EXPORT += $(SIZE:%=$(OBJ)/rect/%.png)
EXPORT += $(SIZE:%=$(OBJ)/badge/%.png)
EXPORT += $(SIZE:%=$(OBJ)/badge_bw/%.png)
EXPORT += $(SIZE:%=$(OBJ)/badge_wb/%.png)
EXPORT += $(SIZE:%=$(OBJ)/banner/%.png)
EXPORT += $(SIZE:%=$(OBJ)/qrcode/%.png)
EXPORT += $(SIZE:%=$(OBJ)/twitter_bg/%.png)
EXPORT += $(SIZE:%=$(OBJ)/sticker/%.png)
EXPORT += $(SIZE:%=$(OBJ)/sticker/%.pdf)
EXPORT += $(SIZE:%=$(OBJ)/slogan/%.png)
EXPORT += $(SIZE:%=$(OBJ)/slogan/%.pdf)
EXPORT += $(SIZE:%=$(OBJ)/slogan_bw/%.png)
EXPORT += $(SIZE:%=$(OBJ)/slogan_bw/%.pdf)
EXPORT += $(SIZE:%=$(OBJ)/slogan_wb/%.png)
EXPORT += $(SIZE:%=$(OBJ)/slogan_wb/%.pdf)

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
