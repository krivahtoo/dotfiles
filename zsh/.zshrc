# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions aliases fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

######
# FZF
######

function fzfcd {
  target=$1
  fzfargs=${@:3}
  if [ -z ${target} ]; then
    target="."
  fi
  moveto=$(fd ${target} -H -d ${maxdepth:=3} -t d | sed -e '/\.git/d' | fzf-tmux -p '90%,60%' --select-1 --exit-0 ${fzfargs} )
  if [ ${moveto} ]; then
    cd ${moveto}
  fi
}

compdef '_files -/' 'fzfcd'

alias ${MYCD:=zd}=fzfcd

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc_preview - checkout git commit with previews
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
    --ansi --preview="$_viewGitLogLine" ) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
  }

# fshow_preview - git commit browser with previews
fshow_preview() {
  glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
    --ansi --preview="$_viewGitLogLine" \
    --header "enter to view, alt-y to copy hash" \
    --bind "enter:execute:$_viewGitLogLine   | less -R" \
    --bind "alt-y:execute:$_gitLogLineToHash | xclip"
  }

# fkill - kill processes - list only the ones you can kill.
fkill() {
  local pid 
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf-tmux -p '90%,60%' -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf-tmux -p '90%,60%' -m | awk '{print $2}')
  fi  

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi  
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf-tmux -p '90%,60%' +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Install packages using yay (change to pacman/AUR helper of your choice)
function in() {
  paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S
}
# Remove installed packages (change to pacman/AUR helper of your choice)
function re() {
  paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

fman() {
  man -k . | fzf-tmux -p '90%,90%' -q "$1" --prompt='man> '\
    --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' |\
    tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# get owning package for a file
owner() {
  file=$1
  if [ -n "$file" ]; then
    echo $(paru -Ql | rg "$file" | awk '{print $1}' | uniq)
  else
    while read -r file; do
      echo $(paru -Ql | rg "$file" | awk '{print $1}' | uniq)
    done
  fi
}

xrg() {
  rg --color=always --line-number $@ | fzf --ansi -m\
    --bind=alt-a:select-all,alt-d:deselect-all,tab:select\
    --delimiter=: --preview="bat -fn --highlight-line {2} {1}"\
    --preview-window="+{2}/2" --border=horizontal
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# export PATH=$HOME/go/bin:$HOME/.local/bin:$HOME/.nimble/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias c=clear
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias ls='exa --icons'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Have less display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

export VISUAL=nvim
export EDITOR="$VISUAL"
export GPG_TTY=$(tty)

eval "$(zoxide init zsh)"

#source /home/krivah/.config/broot/launcher/bash/br

source /home/krivah/.config/fzf-git.sh

source <(starship init zsh --print-full-init)

# pnpm
export PNPM_HOME="/home/krivah/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/krivah/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/krivah/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/krivah/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/krivah/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/home/krivah/.bun/_bun" ] && source "/home/krivah/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
