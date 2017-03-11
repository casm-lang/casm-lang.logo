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

ICON = $(PNG:%=var/export/icon/%.png)
LOGO = $(PNG:%=var/export/logo/%.png)
RECT = $(PNG:%=var/export/rect/%.png)
BANNER = $(PNG:%=var/export/banner/%.png)
SLOGAN = $(PNG:%=var/export/slogan/%.png)
QRCODE = $(PNG:%=var/export/qrcode/%.png)

default: $(ICON) $(LOGO) $(RECT) $(BANNER) $(SLOGAN) $(QRCODE) etc/headline.png

$(LOGO): src/logo.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(ICON): src/icon.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(RECT): src/rect.svg
	inkscape -C -h `basename $@ .png` -e $@ $<

$(BANNER): src/banner.svg
	inkscape -C -h `basename $@ .png` -e $@ $<

$(SLOGAN): src/slogan.svg
	inkscape -C -h `basename $@ .png` -e $@ $<

$(QRCODE): src/qrcode.svg
	inkscape -C -h `basename $@ .png` -e $@ $<

etc/headline.png: var/export/banner/64.png
	cp -f $< $@
