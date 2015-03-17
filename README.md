
# Dotfiles (by unixsuperhero)

## Table of Contents

* versions
* plugins
  * dir structure
    * `<plugin>/home/`
    * `<plugin>/home/dot/`
    * `<plugin>/patches/`
    * `<plugin>/scripts/` (or) `<plugin>/hooks/`
    * `<plugin>/customizations`
  * home
  * home/dot
  * patches
  * scripts
  * customizations
  * scripts/hooks
    * install
    * setup

* setup instructions
  * setup script
  * todo

## Versions



## Plugins


### <plugin>/home/

### <plugin>/home/dot/

This is where dotfiles go that need to be in the `$HOME`
directory. Make them here, but omit the leading `.` (dot)
from the filename.

These files should be generic include files, and all the real configuring should
be done in the `<plugin>/<customization-files>`

### <plugin>/<customization-file>

These are the files that will be included by the files in
`home/` and `home/dot/`

### <plugin>/patches/

config scripts that can be included by the other plugins

### <plugin>/scripts/

any install or setup scripts necessary:

* install - make sure the tool/cmd is available on the machine, if not, have
  instructions on how to install it
* setup - any necessary actions to ensure that it is configured properly



# OLD README.md IS BELOW THIS LINE
----------------------------------

# Dotfiles (by unixsuperhero)

## Table of Contents

* concept
* setup instructions
  * setup script
  * todo

## Concept



## Setup Instructions


### `sh setup`

### Setup To Do

Create 3 scripts:

1. build
2. install
3. setup (build + install)

Details:

1. `build`
  * create a `./builds/<timestamp>/` folder and symlink
    `./builds/latest` to it
    * before anything is created or overwritten in the
      `$HOME` directory, everything is prepared in this
      `build` folder
    * probably a symlink to the real folder which is
      timestamped in `tmp/` like this: `tmp/build.20150313/`
2. `install`
  * everything in `./builds/latest` is copied to `$HOME/` as-is
    * anything that already exists in `$HOME/` will be
      copied to `./build/backup/`
    * all copy/backup information can be stored in the
      `./build/install.log` file

