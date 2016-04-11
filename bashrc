# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#sb2 alias
alias sdk=/srv/syberos/sdks/sdk/syberos-sdk-chroot
alias sb2="sb2 -t syberos-target-armv7tnhl2 "
alias sb2-ba="sb2 -t syberos-target-armv7tnhl2 rpmbuild -ba "
alias sb2-bb="sb2 -t syberos-target-armv7tnhl2 rpmbuild -bb "
alias sb2-bp="sb2 -t syberos-target-armv7tnhl2 rpmbuild -bp "
alias sb2-inplace-ba="sb2 -t syberos-target-armv7tnhl2 rpmbuild --build-in-place -ba"
alias sb2-zypper="sb2 -t syberos-target-armv7tnhl2 -R zypper "
alias sb2-rpm="sb2 -t syberos-target-armv7tnhl2 -R rpm "
alias sb2-qmake="sb2 -t syberos-target-armv7tnhl2 /usr/lib/qt5/bin/qmake"

#sb2 alias
alias sb2-qt55="sb2 -t syberos-target-armv7tnhl "
alias sb2-ba-qt55="sb2 -t syberos-target-armv7tnhl rpmbuild -ba "
alias sb2-bb-qt55="sb2 -t syberos-target-armv7tnhl rpmbuild -bb "
alias sb2-bp-qt55="sb2 -t syberos-target-armv7tnhl rpmbuild -bp "
alias sb2-inplace-ba-qt55="sb2 -t syberos-target-armv7tnhl rpmbuild --build-in-place -ba"
alias sb2-zypper-qt55="sb2 -t syberos-target-armv7tnhl -R zypper "
alias sb2-rpm-qt55="sb2 -t syberos-target-armv7tnhl -R rpm "
alias sb2-qmake-qt55="sb2 -t syberos-target-armv7tnhl /usr/lib/qt55/bin/qmake"

#alias sdk=/srv/syberos/sdks/sdk/syberos-sdk-chroot
alias sb264="sb2 -t syberos-target-aarch64 "
alias sb2-ba64="sb2 -t syberos-target-aarch64 rpmbuild -ba "
alias sb2-bb64="sb2 -t syberos-target-aarch64 rpmbuild -bb "
alias sb2-bp64="sb2 -t syberos-target-aarch64 rpmbuild -bp "
alias sb2-zypper64="sb2 -t syberos-target-aarch64 -m sdk-install -R zypper "
alias sb2-rpm64="sb2 -t syberos-target-aarch64 -m sdk-install -R rpm "
alias sb2-qmake64="sb2 -t syberos-target-aarch64 /usr/lib/qt5/bin/qmake"alias sdk=/srv/syberos/sdks/sdk/syberos-sdk-chroot


#git 
function git_clone() {
    git clone ssh://pingwei_wu_dev@gerrit.insyber.com:29418/$1.git
}
alias gtc=git_clone

function git_new_branch {
    if [ X$1 == X ]; then
        git checkout -b main_dev remotes/origin/main_dev
    else
        git checkout -b $1 remotes/origin/$1
    fi
}
alias gnb=git_new_branch

function git_push {
    if [ X$1 == X ]; then
        git push origin main_dev:refs/for/main_dev
    else
        git push origin $1:refs/for/$1
    fi
}
alias gpb=git_push

alias gbs-arm="gbs build -A armv7tnhl"

function scp2phone {
   scp -r $1 developer@192.168.100.100:
}

alias pushfile=scp2phone


function scp2vm {
   scp -P 5555 $1 developer@localhost:/data/developer
}
alias pushvm=scp2vm

alias loginvm='ssh -p 5555 developer@localhost'
export PATH="/home/sheldon/Qt5.5.0/5.5/gcc_64/bin":$PATH
alias subl='LD_PRELOAD=/home/sheldon/workspace/tools/system-installation/libsublime-imfix.so subl'
