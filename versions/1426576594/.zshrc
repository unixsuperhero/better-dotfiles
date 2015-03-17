#!/bin/zsh

export ZDOTDIR=~/dotfiles/zsh/prezto
source $ZDOTDIR/zshrc

# $HOME/dotfiles/zsh/CONFIGURING_ZSH_WITH_PREZTO_FIX_LINKS_TO_EVERYTHING_POINTING_TO_ZDOTDIR

export DOTDIR="$HOME/dotfiles"

function include_file() {
  f="${DOTDIR:-$HOME/dotfiles}/zsh/${1}"

  echo "including (${1}) ... $f"

  test -f "$f" && source "$f"
}

function include_patch() {
  f="${DOTDIR:-$HOME/dotfiles}/${1}/patches/zsh/init"

  echo "including (${1}) ... $f"

  test -f "$f" && source "$f"
}

zsh_includes=(local aliases export functions git heroku osxrc ps1 saveology vim)
zsh_includes=(local aliases export functions git heroku osxrc saveology vim paths)

for ifile in $zsh_includes
do
  include_file $ifile
done

zsh_patches=(rbenv fasd)

for ipatch in $zsh_patches
do
  include_patch $ipatch
done

#$HOME/dotfiles/zsh/aliases
#$HOME/dotfiles/zsh/battery
#$HOME/dotfiles/zsh/export
#$HOME/dotfiles/zsh/functions
#$HOME/dotfiles/zsh/git
#$HOME/dotfiles/zsh/heroku
#$HOME/dotfiles/zsh/local
#$HOME/dotfiles/zsh/osxrc
#$HOME/dotfiles/zsh/ps1
#$HOME/dotfiles/zsh/saveology
#$HOME/dotfiles/zsh/vim

[[ -f ~/dotfiles/rbenv/patches/zsh/init ]] && source ~/dotfiles/rbenv/patches/zsh/init
