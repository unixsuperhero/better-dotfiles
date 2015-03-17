cat <<DEBUG

in file: /Users/macbookpro/better-dotfiles/src/zsh/home/dot/zshrc

going to run these lines:

  export ZDOTDIR=~/dotfiles/zsh/prezto
  source $ZDOTDIR/zshrc



$> ls -ld ~/dotfiles/zsh/prezto:
  $(ls -ld ~/dotfiles/zsh/prezto)


$> ls -ld ~/dotfiles/zsh/prezto/:
  $(ls -ld ~/dotfiles/zsh/prezto/*)

tmux new -s zshrc /bin/zsh -i
usage: new-session [-AdDP] [-c start-directory] [-F format] [-n window-name] [-s session-name] [-t target-session] [-x width] [-y height] [command]

DEBUG

export ZDOTDIR=~/dotfiles/zsh/prezto
source $ZDOTDIR/zshrc


[[ -f ~/dotfiles/rbenv/patches/zsh/init ]] && source ~/dotfiles/rbenv/patches/zsh/init
