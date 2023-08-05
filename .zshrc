if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi

# GPG for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Zsh settings for history
HISTORY_IGNORE="(ls|[bf]g|exit|reset|clear|cd|cd ..|cd..)"
HISTSIZE=25000
HISTFILE=~/.zsh_history
SAVEHIST=100000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

eval $(thefuck --alias)

# Alias
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Overwrite exa colors
EXA_COLORS="
  ur=1;35:
  uw=1;35:
  ux=1;35:
  gr=1;34:
  gw=1;34:
  gx=1;34:
  tr=1;33:
  tw=1;33:
  tx=1;33:
  su=1;31:
  sf=1;31:
  xa=1;32:
  sn=1;36:
  sb=1;36:
  da=1;35:
  uu=1;35:
  un=1;35:
  cl=1;35:
  di=1;34:
  ln=1;36:
  pi=1;33:
  so=1;35:
  bd=1;33:
  cd=1;33:
  or=1;31:
  mi=1;36:
  ex=1;32:
  *.rs=1;31:
  *.py=1;32:
  *.c=1;35:
  *.cpp=1;35:
  *.h=1;35:
  *.hpp=1;35:
  *.js=1;33:
  *.html=1;33:
  *.css=1;36:
  *.md=1;34
"


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if command -v conda &> /dev/null; then
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
fi

