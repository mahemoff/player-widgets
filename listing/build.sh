#!/bin/bash
JS=build/series/widget.js
TEMPCSS=/tmp/$$.css
haml src/host.haml build/host.html

tplcpl -t src/series/templates -o $JS
cat lib/jquery.js lib/jquery.jplayer.js lib/jplayer.playlist.js >> $JS
coffee -c -p src/series/index.coffee >> $JS

stylus < src/series/index.stylus > $TEMPCSS
echo "widgetCSS='"`uglifycss $TEMPCSS`"';" >> $JS

uglifyjs --overwrite $JS
