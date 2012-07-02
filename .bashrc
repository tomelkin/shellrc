# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
   xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
       # We have color support; assume it's compliant with Ecma-48
       # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
       # a case would tend to support setf rather than setaf.)
       color_prompt=yes
   else
       color_prompt=
   fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   ;;
*)
   ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# ------------------------------------------------

# see http://www-106.ibm.com/developerworks/linux/library/l-tip-prompt/
# for ideas re: how to dick about with the prompt...

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -n "$PS1" ]; then
   export PS1="[\w \$(parse_git_branch)] "
fi

# ------------------------------------------------
# a conglomerate conundrum of alii

alias        ll='ls -Ghl'
alias       lla='ls -Ghal'
alias        ls='ls -Gh'
alias         l='ls -la'
alias         h='history'
alias        em='emacs -nw'
alias         d='export d=`pwd`;echo "d == $d"'
alias        pl='pstree -luap | less'
alias classpath='echo && echo "CLASSPATH:" && echo $CLASSPATH | tr ":" "\n" && echo'
alias         p='echo && echo "PATH:" && echo $PATH | tr ":" "\n" && echo'

# directory tree - http://www.shell-fu.org/lister.php?id=209
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

# ------------------------------------------------------------------------
# automagically generate an alias for each host known by ssh

#test -r ~/.ssh/known_hosts && for h in `cat ~/.ssh/known_hosts | while read l; do echo $l | cut -d, -f1 | cut -d" " -f1; done`; do alias $h="ssh $h"; done

# ------------------------------------------------------------------------

export PAGER='less'
export LESS='-r'

export PATH=/opt/local/bin:$PATH

# -----------------------------------------------------------------------

# setting the TERM title bar as part of the prompt
# see: http://en.tldp.org/HOWTO/Bash-Prompt-HOWTO/xterm-title-bar-manipulations.html

if [ -n "$PS1" ]; then
   case $TERM in
       xterm*)
           TITLEBAR='\[\033]0;\u@\h:\w\007\]'
           ;;
       *)
           TITLEBAR=''
           ;;
   esac
fi

# ------------------------------------------------------------------------

# fix bogus backspace malarky
#stty erase

# -----------------------------------------------------------------------

# lp
alias    gs='git status -s'
alias   gsf='git svn fetch'
alias   gsd='git svn dcommit'
alias   gsl='git stash list'
alias   gsr='git svn rebase'
alias    bc='./go.sh before-commit'
alias   abc="ant bc -Dtest.skip=true -Dcheckstyle.skip=true"
alias   killmysql="ps aux | grep mysql | awk '{print \$2}' | xargs sudo kill -9"

source /usr/local/etc/bash_completion.d/git-completion.bash

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

# -----------------------------------------------------------------------

source ~/.tomrc

# ------------------------------------------------

source ~/.bash-prompt

# ------------------------------------------------

fi # <= be sure to close the if at the end of the .bashrc.

