$ = null
#HOST = 'http://localhost:8000'
widgetTemplate = null

# http://pastie.org/379693
injectCSS = (newcss) ->
  if ('\v'=='v')
    document.createStyleSheet().cssText = newcss
  else
    window.tag = document.createElement('style')
    tag.type = 'text/css'
    document.getElementsByTagName('head')[0].appendChild(tag)
    property = if typeof document.body.style.WebkitAppearance=='string' then 'innerText' else 'innerHTML'
    tag[property] = newcss

log = -> console.log.apply console, arguments

##############################################################################

###
demoTracks =
  [
    title: "Cro Magnon Man"
    artist: "Crom"
    mp3: "http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3"
    poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
  ]
###

$ = jQuery
$ ->
  #url = $('a')'http://player.fm/series/10766.jsonp?callback=?'
  #a = $('<a/>').attr('href', $('script.playerfm-script').attr('src')).get(0)
  #prefix = a.protocol + '//' + a.host + '/series/'
  prefix = "https://dl.dropbox.com/u/8429420/player-widget/series/"
  resource = $('a.playerfm-widget').attr('href')
  #log widgetCSS.replace(/url\("/g, 'url("'+prefix)
  css = widgetCSS.replace(/url\("/g, 'url("'+prefix)
  injectCSS css
  $.getJSON "#{resource}.jsonp?callback=?", (series) ->
    log "Series response", series
    $('<div/>')
    .hide()
    .html(Templating.tpl('widget.jade', series))
    .insertBefore('.playerfm-widget')
    .show()
    tracks = setupTracks(series)
    setupPlaylist(series, tracks)

setupTracks = (series) ->
  episodes = $.map series.episodes.slice(0,5), (ep) ->
    [
      title: ep.title,
      artist: series.title,
      mp3: ep.url,
      poster: ep.image_url
    ]

setupPlaylist = (series, tracks) ->
  log 'setup series', series, tracks
  window.playlist = new jPlayerPlaylist(
    {
      jPlayer: '.jp'
      cssSelectorAncestor: '.jpc'
    },
      tracks,
    {
      playlistOptions: {
        enableRemoveControls: true
      },
      swfPath: '/js',
      supplied: 'mp3'
    }
  )

