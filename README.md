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

### HTML Mark

You should add the ff code at the top of your HTML code so that it will work on lower version of ie.

```html
<!DOCTYPE html>
<!--[if IE 6]> <html class="ie6 ltie8"> <![endif]-->
<!--[if IE 7]> <html class="ie7 ltie8"> <![endif]-->
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if gt IE 8]> <html> <!-- <![endif] -->
```


More likely you'll be playing on sass/_config.sass file if you want to
change the colorscheme of the player.
