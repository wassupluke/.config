#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colorizing
# [...[00...] is thin font
# [...[01...] is bold font
# [...[02...] is faded font
# [...[03...] is italics
# [...[04...] is underline
# [...[05...] is thin font
# [...[06...] is thin font
# [...[07...] is highlight
# [...[08...] is invisible
# [...[09...] is invisible
blk='\[\033[01;30m\]'   # Black
red='\[\033[00;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[00;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# Previous username line:
# PS1=${red}$'[\u@\h \W]'${clr}'$ '

# New username line with git branch
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.config/git/git-prompt.sh
PS1=${grn}'[\u@\h \W]'${clr}'\$'${blu}'$(__git_ps1 " (%s)") '${clr}

# Allows use of vim motions on the command line
set -o vi

alias c='clear'
alias r='fc -s'
alias rr='fc -s -2'
alias h=history
alias cd..='cd ..'
alias diff='diff -u'
alias ls='ls --color=always'
alias la='ls -a --color=always'
alias ll='ls -alF --color=always'
alias grep='grep --color=always'
alias mkdir='mkdir -pv'
alias gs='git fetch && git status'
alias ga='git add'
alias gc='git commit'
alias vim='nvim'
alias pylint="pylint --rcfile=~/.config/.pylintrc"
alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'

HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of the LINES and COLUMNS.
shopt -s checkwinsize
