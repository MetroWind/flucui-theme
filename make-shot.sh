#!/usr/bin/env zsh

Curve="M 100,0 C 100,400 777,376 777,576"
magick -size 877x576 xc:black -fill white -draw "path '${Curve} V 1000 H 1000 V -10 H 100 L 100,0'" mask.png
magick -size 877x576 xc:transparent -fill none -strokewidth 3 -draw "stroke white path '${Curve}'" mask-line.png
composite dark.png light.png mask.png test.png
magick test.png \( light.png -channel a -separate +channel \) -alpha off -compose CopyOpacity -composite mask-line.png -channel A -compose Dst_Out -composite shot.png
rm test.png mask.png mask-line.png
