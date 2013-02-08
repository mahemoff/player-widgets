#!/bin/bash
# TODO uglify everything
JS=build/series/widget.js
haml src/host.haml build/host.html
stylus < src/series/index.stylus > build/series/index.css
tplcpl -t src/series/templates -o $JS
cat lib/jquery.js lib/jquery.jplayer.js lib/jplayer.playlist.js >> $JS
coffee -c -p src/series/index.coffee >> $JS
