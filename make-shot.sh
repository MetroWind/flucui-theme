#!/usr/bin/env zsh

convert -size 877x576 xc:black -fill white -draw "path 'M 100,0 C 100,400 777,376 777,576 V 1000 H 1000 V -10 H 100 L 100,0'" mask.png
composite dark.png light.png mask.png test.png
convert test.png \( light.png -channel a -separate +channel \) -alpha off -compose CopyOpacity -composite shot.png
rm test.png mask.png
