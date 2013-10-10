##########
# System #
##########

# return 0 if the os is linux
function is_linux()
{
  return $([ `uname -s` = Linux ]);
}

# return 0 if the os is macosx
function is_macosx()
{
  return $([ `uname -s` = Darwin ]);
}

# return 0 if the os is bsd
function is_bsd()
{
  return $([[ `uname -s` =~ .*bsd.* ]]);
}

#########
# Hooks #
#########

# Before each prompt
precmd_functions=(
  # Refresh the prompt
  set_prompt
)

##########
# Colors #
##########

COLOR_RESET=$'%{\033[0m%}'

COLOR_BOLD=$'%{\033[1m%}'
COLOR_UNDERLINE=$'%{\033[4m%}'
COLOR_INVERSE=$'%{\033[7m%}'

COLOR_BLUE=$'%{\033[38;05;75m%}'
COLOR_SMOOTH_GREEN=$'%{\033[38;05;76m%}'
COLOR_GREEN=$'%{\033[38;05;34m%}'
COLOR_LIGHT_GREEN=$'%{\033[38;05;40m%}'
COLOR_YELLOW=$'%{\033[38;05;226m%}'
COLOR_RED=$'%{\033[38;05;1m%}'
COLOR_ORANGE=$'%{\033[38;05;202m%}'

################
# Autocomplete #
################

# enable advanced completion
autoload -U compinit && compinit

# cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zshcache

zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select # enable arrow-key drive interface
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*:warnings' format "${COLOR_RED}${COLOR_BOLD}%d${COLOR_RESET} not found" # change the warning message when no results were found

zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' # ignore compiled files on vim completion

setopt AUTO_REMOVE_SLASH        # autoremove slash when not needed
setopt AUTO_PARAM_SLASH         # automatically append a slash after a directory
setopt COMPLETE_ALIASES		      # autocomplete on aliases
setopt COMPLETE_IN_WORD         # complete word even if the cursor is not after the last character
setopt EXTENDED_GLOB            # advanced completion
unsetopt NOMATCH                # no mismatch due to advanced completion (e.g.: git checkout HEAD^)

###################
# Keyboard layout #
###################

setxkbmap -layout us -variant intl

#########
# Alias #
#########

alias clean='find . -type f -and \( -name ".*.sw[a-z]" -or -name "*~" \) -exec printf "\033[32m[-]\033[00m Delete file \033[31m{}\033[0m\n" \; -exec rm -f {} \;'

unalias vim &>/dev/null
alias vi=vim
alias v=vim
compdef vi=vim
compdef v=vim
alias connect-dev="ssh root@dev-axel.procheo.fr"

# bind some extension to be opened with $EDITOR
alias -s c=$EDITOR
alias -s cpp=$EDITOR
alias -s css=$EDITOR
alias -s h=$EDITOR
alias -s hh=$EDITOR
alias -s hpp=$EDITOR
alias -s html=$EDITOR
alias -s js=$EDITOR
alias -s xhtml=$EDITOR
alias -s txt=$EDITOR
alias -s md=$EDITOR
alias -s mkd=$EDITOR
alias -s markdown=$EDITOR

# bind some extension to be directly executed
alias -s ml=`which ocaml 2> /dev/null`
alias -s php3=`which php 2> /dev/null`
alias -s php4=`which php 2> /dev/null`
alias -s php5=`which php 2> /dev/null`
alias -s php=`which php 2> /dev/null`
alias -s pl=`which perl 2> /dev/null`
alias -s py=`which python 2> /dev/null`
alias -s rb=`which ruby 2> /dev/null`

# bind some extension to be opened with $VIEWER
alias -s bmp=$VIEWER
alias -s gif=$VIEWER
alias -s jpg=$VIEWER
alias -s png=$VIEWER

# common aliases
alias grep='grep --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'
is_linux && alias rmdir='rmdir -v'
alias j='jobs' ; compdef j=jobs
alias g='git' ; compdef g=git

alias -g A=' | awk'
alias -g G=' | grep' # e.g.: 'ls | grep -e toto' == 'ls G -e toto'
alias -g L=' | less'
alias -g H=' | head'
alias -g T=' | tail'
alias -g N=' &>/dev/null'
alias -g go='cd ~/Projects/no-ide/git/PropulseCore/'

###########
# Binding #
###########

bindkey -e

bindkey '^[OH'		beginning-of-line                   # Home
bindkey '^[OF'		end-of-line                         # End
bindkey '^[[6~'		history-search-forward              # Page down
bindkey '^[[5~'		history-search-backward             # Page up
bindkey '^[[2~'		overwrite-mode                      # Insert
bindkey '^[[1;5D'	backward-word                       # Ctrl <-
bindkey '^[[1;5C'	forward-word                        # Ctrl ->
bindkey '^[[3~'		delete-char                         # Delete

###############
# Environment #
###############

OLD_PATH=$PATH
export PATH="$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$PATH:$OLD_PATH"

export EDITOR=$(which vim)
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export VIEWER=`which open 2>/dev/null || which eog 2>/dev/null || echo $VIEWER`
export PAGER=`which less 2>/dev/null || which more 2>/dev/null || which cat 2>/dev/null || echo $PAGER`
export SHELL=`which zsh 2>/dev/null || which bash 2>/dev/null || echo $SHELL`

###########
# History #
###########

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history

setopt APPEND_HISTORY           # allow multiple parallel zsh sessions in history
setopt EXTENDED_HISTORY         # more information in history (beginning time, elpased time and command)
setopt HIST_IGNORE_DUPS         # avoid duplicate command lines in history
setopt HIST_REDUCE_BLANKS       # remove superfluous blanks from history
setopt HIST_IGNORE_SPACE        # do not store a command in history if it begins with a space
setopt HIST_NO_STORE            # do not store the `history` command
setopt HIST_FIND_NO_DUPS        # do not display dups when searching using ^R
setopt HIST_NO_FUNCTIONS        # remove function definition from history

######
# ls #
######

SPECIFIC_LS_OPTIONS=''
if is_linux ; then
  SPECIFIC_LS_OPTIONS=--color=auto
elif is_bsd || is_macosx ; then
  SPECIFIC_LS_OPTIONS=-G
else
  unalias ls &>/dev/null
fi
alias ls="ls -p -F $SPECIFIC_LS_OPTIONS"
alias ll='ls -hl'
compdef ll=ls
alias l='ll'
compdef l=ls
alias la='ll -A' # list .* files (but not . and ..)
compdef la=ls

# good ls colors (even on OSX)
unset LS_COLORS
unset LSCOLORS
if is_macosx || is_bsd ; then
  export CLICOLOR=1
  export LSCOLORS=ExGxxxdxCxDxDxxxaxExEx
else
  export CLICOLOR=0
fi

###########
# Options #
###########

# Directory
setopt AUTO_CD			            # change directory without cd
setopt CDABLE_VARS              # autocd in ~ directory if the folder isn't found in the current directory
setopt PUSHD_IGNORE_DUPS        # don't push dup to cd history

# Automatic URL escaping
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

# No beep
unsetopt BEEP			              # no beep
unsetopt HIST_BEEP		          # no beep
unsetopt LIST_BEEP		          # no beep

# Input/Output
setopt ALIASES			            # expand aliases
setopt CORRECT                  # auto correct command
unsetopt CORRECT_ALL		        # do not auto correct all command line
setopt MAIL_WARNING             # warn for new mail
setopt RC_QUOTES                # allow '' to type a single quoted string
unsetopt RM_STAR_WAIT           # don't wait after `rm *`

# Job Control
setopt AUTO_CONTINUE		        # background process stay alive on shell exit
setopt CHECK_JOBS               # warn about background jobs before shell exit

# Scripts and Functions
setopt C_BASES                  # write base X numbers using C-style (e.g.: 0xFF instead of 16#FF)
setopt C_PRECEDENCES            # alter operators precedence to be more C-like

# Expansion and Globbing
setopt RC_EXPAND_PARAM          # expand foo${xx}bar to 'fooabar foobbar foocbar' if xx='a b c'

##########
# Prompt #
##########

setopt TRANSIENT_RPROMPT        # remove right prompt after accepting a command line

# Git prompt
if [ -r /opt/zsh-git-prompt/zshrc.sh ] ; then
  source /opt/zsh-git-prompt/zshrc.sh

  # Set install directory
  export __GIT_PROMPT_DIR=/opt/zsh-git-prompt/

  # Change defaults values
  ZSH_THEME_GIT_PROMPT_PREFIX="("
  ZSH_THEME_GIT_PROMPT_SUFFIX=")"
  ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
  ZSH_THEME_GIT_PROMPT_BRANCH="${COLOR_YELLOW}"
  ZSH_THEME_GIT_PROMPT_STAGED="${COLOR_GREEN}±"
  ZSH_THEME_GIT_PROMPT_CONFLICTS="${COLOR_ORANGE}×"
  ZSH_THEME_GIT_PROMPT_CHANGED="${COLOR_RED}≠"
  ZSH_THEME_GIT_PROMPT_REMOTE=""
  ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
  ZSH_THEME_GIT_PROMPT_CLEAN="${COLOR_LIGHT_GREEN}✓"
fi

# set content
function set_prompt()
{
  # get git prompt
  git_prompt="$(git_super_status)"

  # left prompt
  PROMPT=''
  PROMPT="${PROMPT:+$PROMPT }[$COLOR_SMOOTH_GREEN%j$COLOR_RESET&|?$COLOR_SMOOTH_GREEN%?$COLOR_RESET]"
  PROMPT="${PROMPT:+$PROMPT }$COLOR_BLUE%25<...<%~%<<$COLOR_RESET${git_prompt:+ $git_prompt}"
  PROMPT="${PROMPT:+$PROMPT }%(!.#.$) "

  # right prompt
  RPROMPT=''
  RPROMPT="${RPROMPT:+ $RPROMPT}[%n$COLOR_BLUE@$COLOR_RESET%M]"
  if [ -n "$SHLVL" ] && [ $SHLVL -gt 1 ] ; then
    RPROMPT="${RPROMPT:+ $RPROMPT}{^$COLOR_BLUE%L$COLOR_RESET}"
  fi
}

# Disable flow control
stty stop undef
stty start undef

########
# Sudo #
########

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

############
# Terminal #
############

# set the tab name
function tabname {
  printf "\e]1;${1:-default}\a"
}

# set the window name
function winname {
  printf "\e]2;$1\a"
}

str=`whoami`@`hostname`

tabname $str
winname $str

########
# Tmux #
########

if [ -n "$TMUX" ] ; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi
