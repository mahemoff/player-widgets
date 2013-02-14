#!/bin/bash
cd `dirname $0`
SKIN=pink.flag
mkdir -p build/series

SKINDIR=src/series/skins/$SKIN
JS=build/series/widget.$SKIN.js
TEMPCSS=/tmp/$$.css
haml src/host.haml build/host.html

tplcpl -t src/series/templates -o $JS
cat lib/jquery.js lib/jquery.jplayer.js lib/jplayer.playlist.js >> $JS
coffee -c -p src/series/index.coffee >> $JS

#cp lib/jplayer.blue.monday.css $TEMPCSS
cp $SKINDIR/jplayer.$SKIN.css $TEMPCSS
echo "widgetCSS='"`uglifycss $TEMPCSS`"';" >> $JS
cp $SKINDIR/*.{jpg,gif,png} build/series
#stylus < src/series/index.stylus >> $TEMPCSS
#echo "widgetCSS='"`uglifycss $TEMPCSS`"';" >> $JS
#cp lib/*.{jpg,gif,png} build/series

uglifyjs --overwrite $JS
