$ = null
HOST = 'http://localhost:8000'
widgetTemplate = null
URL = 'http://player.fm/series/10766.jsonp?callback=?'

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

$ = jQuery
$ ->
  log 'start'
  #$.get "#{HOST}/series/index.css", (css) -> injectCSS(css)
  injectCSS(widgetCSS)
  $.getJSON URL, (series) ->
    log 'series', series
    html = Templating.tpl('widget.jade', series)
    log 'html', html
    $('<div/>')
    .html(html)
    .insertBefore('.playerfm-widget')
