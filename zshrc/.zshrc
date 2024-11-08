# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$HOME/scripts:/usr/pgadmin4/bin:/usr/local/go/bin:$HOME/.emacs.d/bin:$PATH

export PNPM_HOME="/home/rdk/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
COMPLETION_WAITING_DOTS="true"

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
# ZSH_CUSTOM=$PATH:/.cargo/bin/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)

source $ZSH/oh-my-zsh.sh


# User configuration

#(cat ~/.cache/wal/sequences &)
# export MANPATH="/usr/local/man:$MANPATH"

# History size
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Auto tab completion
autoload -Uz compinit && compinit

# Edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -s '^f' 'ranger\n'
bindkey -s '^[s' 'exa -lh\n'

# bindkey '^e' edit-command-line
# You may need to manually set your language environment
#export LANG=en_IN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source /usr/local/fzf/completion.zsh
source /usr/local/fzf/key-bindings.zsh
export FZF_DEFAULT_COMPLETION='rg --files --hidden --follow --no-ignore-vcs '
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export WINIT_X11_SCALE_FACTOR=1
export WINIT_HIDPI_FACTOR=1
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export ROCKET_CLI_COLORS=false
export COINBASE_API="659a14d1-7720-4e6a-ab23-5aff85245846"
export RUST_LOG="debug"

# Environment variables
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias e="nvim"
# alias dust="dust -r"
# alias wallpaper="wal --backend colorz -i ~/Pictures/Wallpapers --iterative"
alias yta="youtube-dl -x --audio-format mp3 --prefer-ffmpeg"
# alias hdd="sudo mount /dev/sda1 ~/HDD/"
alias fzf="fzf --preview='cat {}'"
# alias ef="nvim $(fzf)"
# alias ls="exa"
alias mocp="mocp -T green_theme"
alias batt="cat /sys/class/power_supply/BAT0/capacity"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias tmux="tmux -u"
alias asdf="setxkbmap us -variant dvorak && echo 'Changed to Dvorak Layout'"
alias aoeu="setxkbmap us && echo 'Changed to QWERTY Layout'"
alias em="emacsclient -c -a 'emacs'"
alias fd="fdfind"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias python='python3'

# bun completions
[ -s "/home/rdk/.bun/_bun" ] && source "/home/rdk/.bun/_bun"

# Bun
export BUN_INSTALL="/home/rdk/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Load Angular CLI autocompletion.
# source <(ng completion script)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#export GOPHERJS_GOROOT="$(go1.17 env GOROOT)"  # Also add this line to your .profile or equivalent.

# pnpm
export PNPM_HOME="/home/rdk/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:/Users/rahulkulkarni/.modular/bin"
