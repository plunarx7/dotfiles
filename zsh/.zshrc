
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit
compinit

# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## Keep background processes at full speed
#setopt NOBGNICE
## Restart running processes on exit
#setopt HUP

## History
#setopt APPEND_HISTORY
## For sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## Never ever beep ever
setopt NO_BEEP
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
## Automatically decide when to page a list of completions
#LISTMAX=0

## Disable mail checking
#MAILCHECK=0

# Autoload -U colors
#colors

# History
export HISTFILE=~/.cache/zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugins/zsh-completions/src

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Alias
alias x='ranger'
alias v='nvim'

# Changing "ls" to "eza"
alias ls='exa -a --color=always --group-directories-first'
alias la='exa -al --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

## emacs
alias e='emacsclient -t'

# adding flags
alias df='df -h'
alias free='free -m'

# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# Networking
alias myip='curl http://ipecho.net/plain; echo' # Echo external IP

# Quick access
alias g='git'
alias j='jobs -l'

# Miscellaneous
alias reload='source ~/.zshrc'
alias h='history'

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias ytd='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best"'
# Exports
#export PATH=$PATH:$(npm config get prefix)/bin:$(HOME)/.emacs.d/bin
export PATH="$HOME/.cargo/bin:$HOME/.emacs.d/bin:$HOME/.cabal/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#export CUSTOM_NVIM_PATH="/usr/local/bin/nvim"
export EDITOR=nvim
export VISUAL=code
export NO_AT_BRIDGE=1
export GOPATH="$HOME/Prog/Go"

#[[ -s /home/gw/.autojump/etc/profile.d/autojump.sh ]] && source /home/gw/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Bare repository
#alias dotf='/usr/bin/git --git-dir=/home/axrave/.dotfiles/ --work-tree=/home/gw'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#source "$HOME/.cache/wal/colors.sh"
