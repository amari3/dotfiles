#### alias
alias ls="ls -F"
alias l="ls -l"
alias ll="ls -Al"
alias la="ls -al"
#alias less="less"
alias sc="screen"
alias emacs="TERM=xterm-256color /usr/local/bin/emacs"
alias e="emacsclient -t"
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias perlsrc="perldoc -MPod::Strip"

#### bindkey
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

#### completion
autoload -U compinit
compinit
setopt auto_cd
setopt auto_name_dirs
setopt auto_pushd
setopt auto_remove_slash
setopt extended_glob
setopt no_flow_control

#### history
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_no_store
function history-all { history -E 1 }

#### prompt
setopt prompt_subst
PROMPT='%{[36m%}[%n@%m]%{[m%}%# '
RPROMPT='%{[33m%}[%(5~,%-2~/.../%2~,%~)]%{[m%}'

#### option
setopt auto_menu correct
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys

#### limit
limit coredumpsize 0

source ~/perl5/perlbrew/etc/bashrc
#source ~/.nvm/nvm.sh

umask 022

## create emacs env file
perl -wle 'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' PATH > ~/.emacs.d/shellenv.el
