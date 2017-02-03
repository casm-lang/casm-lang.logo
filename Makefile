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

default: $(ICON) $(LOGO) $(RECT)

$(LOGO): logo.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(ICON): icon.svg
	inkscape -C -w `basename $@ .png` -e $@ $<

$(RECT): rect.svg
	inkscape -C -h `basename $@ .png` -e $@ $<


# Available options:
#   -V, --version                             Print the Inkscape version number
#   -z, --without-gui                         Do not use X server (only process files from console)
#   -g, --with-gui                            Try to use X server (even if $DISPLAY is not set)
#   -f, --file=FILENAME                       Open specified document(s) (option string may be excluded)
#   -p, --print=FILENAME                      Print document(s) to specified output file (use '| program' for pipe)
#   -e, --export-png=FILENAME                 Export document to a PNG file
#   -d, --export-dpi=DPI                      Resolution for exporting to bitmap and for rasterization of filters in PS/EPS/PDF (default
#                                             96)
#   -a, --export-area=x0:y0:x1:y1             Exported area in SVG user units (default is the page; 0,0 is lower-left corner)
#   -D, --export-area-drawing                 Exported area is the entire drawing (not page)
#   -C, --export-area-page                    Exported area is the entire page
#       --export-margin=VALUE                 Only for PS/EPS/PDF, sets margin in mm around exported area (default 0)
#       --export-area-snap                    Snap the bitmap export area outwards to the nearest integer values (in SVG user units)
#   -w, --export-width=WIDTH                  The width of exported bitmap in pixels (overrides export-dpi)
#   -h, --export-height=HEIGHT                The height of exported bitmap in pixels (overrides export-dpi)
#   -i, --export-id=ID                        The ID of the object to export
#   -j, --export-id-only                      Export just the object with export-id, hide all others (only with export-id)
#   -t, --export-use-hints                    Use stored filename and DPI hints when exporting (only with export-id)
#   -b, --export-background=COLOR             Background color of exported bitmap (any SVG-supported color string)
#   -y, --export-background-opacity=VALUE     Background opacity of exported bitmap (either 0.0 to 1.0, or 1 to 255)
#   -l, --export-plain-svg=FILENAME           Export document to plain SVG file (no sodipodi or inkscape namespaces)
#   -P, --export-ps=FILENAME                  Export document to a PS file
#   -E, --export-eps=FILENAME                 Export document to an EPS file
#       --export-ps-level=PS Level            Choose the PostScript Level used to export. Possible choices are 2 and 3 (the default)
#   -A, --export-pdf=FILENAME                 Export document to a PDF file
#       --export-pdf-version=PDF_VERSION      Export PDF to given version. (hint: make sure to input the exact string found in the PDF
#                                             export dialog, e.g. "PDF 1.4" which is PDF-a conformant)
#       --export-latex                        Export PDF/PS/EPS without text. Besides the PDF/PS/EPS, a LaTeX file is exported, putting
#                                             the text on top of the PDF/PS/EPS file. Include the result in LaTeX like:
#                                             \input{latexfile.tex}
#   -M, --export-emf=FILENAME                 Export document to an Enhanced Metafile (EMF) File
#   -m, --export-wmf=FILENAME                 Export document to a Windows Metafile (WMF) File
#   -T, --export-text-to-path                 Convert text object to paths on export (PS, EPS, PDF, SVG)
#       --export-ignore-filters               Render filtered objects without filters, instead of rasterizing (PS, EPS, PDF)
#   -X, --query-x                             Query the X coordinate of the drawing or, if specified, of the object with --query-id
#   -Y, --query-y                             Query the Y coordinate of the drawing or, if specified, of the object with --query-id
#   -W, --query-width                         Query the width of the drawing or, if specified, of the object with --query-id
#   -H, --query-height                        Query the height of the drawing or, if specified, of the object with --query-id
#   -S, --query-all                           List id,x,y,w,h for all objects
#   -I, --query-id=ID                         The ID of the object whose dimensions are queried
#   -x, --extension-directory                 Print out the extension directory and exit
#       --vacuum-defs                         Remove unused definitions from the defs section(s) of the document
#       --verb-list                           List the IDs of all the verbs in Inkscape
#       --verb=VERB-ID                        Verb to call when Inkscape opens.
#       --select=OBJECT-ID                    Object ID to select when Inkscape opens.
