
__TODO: Change contents of `home/dot/*` files__

Right now the dotfiles that make it into the home directory act as an index,
explaining which files to include.

However, I think these dotfiles should be as generic as possible and ultimately
never need to be edited.  To accomplish this, there should be version files in
the tool's directory.  (e.g. `src/vim/personal-laptop.version` or some better
file extension)  The user should also define which version to use in an env var,
maybe some textfile (in the same vain as .ruby-version)


# Better Dotfiles

This project is a major overhaul of my previous dotfile
repo. It is designed to maximize the ability to be both
customized and extended.

## Design

To accomplish the maximum flexibility, a few systems were implemented:

* different actions (install vs. configure vs. build (might be the same as
  * setup/install - setup dotfiles and also ensure that the software that uses them is
    installed on the system
  * build/rebuild - setup system to use the configured dotfiles
  * initialize - ...
* plugins and patches
  * plugins - will contain
    * _official dotfiles_ - the necessary configuration
      files for the particular command/tool.
    * _localfiles_ - various files to be sourced by the official dotfiles
    * _version files_ - configuration files dictating which
      subset of files/patches ars included
    * _patches_ - add-ons for other plugins (see next bullet)
  * patches - are basically add-ons (plugins) for other plugins.
    * for example, rbenv will have a `bash` or `zsh` patch for initializing
      itself when a new bash or zsh shell is started
* hooks
  * each plugin will be initialized in a certain order, this will allow patches
    to insert/apply different parts in the appropriate order
  * For each action or stage, there are normally 2 hooks: `pre-` and `post-`
  * There are also 2 types of hooks:
    * include file - probably more common, just insert itself into the sourcing
      of dotfiles
    * shell script - actually run a shell script to manipulate files or do any
      advanced processing that needs to be done outside of just being sourced in
      a dotfile

the files are organized by tool, and each tool has plugins.
For example, is our main editor is vim, but we use it for
ruby, rails, and rspec, the `src/` dir might be structured
like this:

> src/
>> vim/
>>> rails/
>>> rspec/
>>> ruby/
