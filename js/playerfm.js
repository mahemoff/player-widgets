// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(document).ready(function() {
    var myPlaylist, playerfmClass, playerfmClassAncestor, playlist, publisherClass, setPlayerScreen, _def;
    playlist = [];
    playerfmClassAncestor = ".jp-skin.flexible";
    playerfmClass = "" + playerfmClassAncestor + " .playerfm";
    publisherClass = '.jp-publisher-container';
    _def = {
      poster: jQuery("" + publisherClass + " img", playerfmClassAncestor).attr('src') || jQuery('.jp-publisher').css('content').replace(/'/g, ""),
      url: jQuery("" + publisherClass + " a", playerfmClassAncestor).attr('href') || "javascript:;",
      title: jQuery("" + publisherClass + " .jp-global-title", playerfmClassAncestor).html() || jQuery('.jp-global-title').css('content').replace(/'/g, "")
    };
    jQuery('.jp-playlist li a', playerfmClassAncestor).each(function(index, el) {
      return playlist.push({
        title: jQuery(el).html() || _def.title,
        mp3: jQuery(el).attr('href'),
        poster: jQuery(el).attr('data-poster' || _def.poster),
        url: jQuery(el).attr('data-url' || _def.url)
      });
    });
    myPlaylist = new jPlayerPlaylist({
      jPlayer: playerfmClass,
      cssSelectorAncestor: playerfmClassAncestor
    }, playlist, {
      playlistOptions: {
        enableRemoveControls: false
      },
      swfPath: "js",
      supplied: "mp3",
      solution: "html, flash",
      wmode: "windows"
    });
    setPlayerScreen = function(obj) {
      jQuery('.jp-publisher').attr('href', obj.url || _def.url);
      jQuery('.jp-global-title').html(obj.title || _def.title);
      return jQuery('.jp-global-poster').attr('src', obj.poster || _def.poster);
    };
    jQuery(myPlaylist.cssSelector.jPlayer).bind(jQuery.jPlayer.event.ready, function(event) {
      return jQuery.each(myPlaylist.playlist, function(index, obj) {
        if (index === 0) {
          return setPlayerScreen(obj);
        }
      });
    });
    return jQuery(myPlaylist.cssSelector.jPlayer).bind(jQuery.jPlayer.event.play, function(event) {
      return jQuery.each(myPlaylist.playlist, function(index, obj) {
        if (index === myPlaylist.current) {
          return setPlayerScreen(obj);
        }
      });
    });
  });

}).call(this);
