# Flexible jPlayer Skin

### Installation

1. Install gem dependencies

  ```bash
  $ gem install bourbon
  $ gem install sass
  ```

2. Install bourbon files

  `$ cd sass && bourbon install`

### Run / Compiling Sass
Compiling Sass file to CSS

  `$ sass --watch sass:css`


### Running Bash script

  `$ ./bash`

### HTML

You should add the ff code at the top of your HTML code so that it will work on lower version of ie.

```html
<!DOCTYPE html>
<!--[if IE 6]> <html class="ie6 ltie8"> <![endif]-->
<!--[if IE 7]> <html class="ie7 ltie8"> <![endif]-->
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if gt IE 8]> <html> <!-- <![endif] -->
```

#### Playlist Code
````html
...
<div class='jp-playlist'>
  <ul style='display: block;'>
    <li class='jp-playlist-current'>
      <div>
        <a 
          class='jp-playlist-item'
          data-poster='http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png'
          data-url='http://5by5.tv/bigwebshow'
          href='http://d.ahoy.co/redirect.mp3/fly.5by5.tv/audio/broadcasts/bigwebshow/2013/bigwebshow-088.mp3'
        >
          The Big Web Show 88: Greg Storey
        </a>
      </div>
    </li>
  </ul>
</div>
...
````
* data-poster &mdash; Poster image source
* data-url &mdash; Poster link url
* href &mdash; Audio MP3 file url
* `The Big Web Show 88: Greg Storey` &mdash; Episode title

#### Publisher Code

````html
...
<div class='jp-publisher-container'>
  <a class='jp-publisher' href='http://5by5.tv/bigwebshow' target='_blank'>
    <img
      alt=''
      class='jp-global-poster'
      src='http://res.cloudinary.com/playerfm/image/fetch/d_graymike-bg.png,c_fill,h_270,w_270/http://icebox.5by5.tv/images/broadcasts/7/cover.jpg'
    />
  </a>
  <div class='jp-global-title'>Traffic and Weather</div>
</div>
...
````

* href='`http://5by5.tv/bigwebshow`' &mdash; default poster link
* src='`http://res.cloudinary.com/playerfm/image/fe...` &mdash; default poster image source
* &lt;div class='jp-global-title'>`Traffic and Weather`&lt;/div> &mdash; default poster text

