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

ICON = $(PNG:%=icon/%.png)
LOGO = $(PNG:%=logo/%.png)
RECT = $(PNG:%=rect/%.png)
BANNER = $(PNG:%=banner/%.png)

default: $(ICON) $(LOGO) $(RECT) $(BANNER)

$(LOGO): logo.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(ICON): icon.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(RECT): rect.svg
	inkscape -C -h `basename $@ .png` -e $@ $<

$(BANNER): banner.svg
	inkscape -C -h `basename $@ .png` -e $@ $<
