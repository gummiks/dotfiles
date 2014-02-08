# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

set noswapfile
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#GKS
#------------Various Aliases to make life easier-----------
alias vhelp="vim ~/Dropbox/Skoli/linux/vimHelp.tex"
alias lhelp="vim ~/Dropbox/Skoli/linux/linuxHelp.tex"
alias ssr="ssh -l ssr ssrdb.no-ip.org"
alias t="/home/gks/Dropbox/things/todo.sh"
alias sshgks4="sshfs gks4@katla.rhi.hi.is:/heima/gks4/.public_html /mnt/gks4"
alias myrafs="sshfs gws5257@myra.astro.psu.edu:/astro/grads/gws5257 /mnt/myra"
alias ssrftp="sftp ssr@ssrdb.no-ip.org"
alias sshssr="sshfs ssr@ssrdb.no-ip.org:/mnt/datadisk/ /mnt/datadisk"
alias sshMusic="sshfs ssr@ssrdb.no-ip.org:/home/ssr/Music /mnt/ssrMusic"
alias sshverpill="sshfs verpill@katla.rhi.hi.is:/heima/verpill/.public_html/ /mnt/verpill/"
alias imap="python2.7 /home/gks/.conky/imap.py"
alias ra="ranger"
alias py="python2.7"
alias def="python2.7 ~/.def/define.py -n 5"
alias pm="sudo pm-suspend"
alias xm="gvim ~/.xmonad/xmonad.hs"
alias xmr="xmonad --recompile"
alias ns="nmap -sS -p 22 192.168.1.1-254 | grep -B3 open | grep ports"
alias ipy="ipython2 --pylab"
alias sho="cd ~/Dropbox/dotfiles/shortcuts/"
alias ebrc="vim ~/Dropbox/dotfiles/bashrc"
alias evrc="vim ~/Dropbox/dotfiles/vimrc"
alias uu="urxvt"
alias sv="vim /home/gks/Dropbox/Skoli/vor2013/serverkefni/thingsDone/doneVerk.tex"
alias temp="cd /home/gks/Dropbox/dotfiles/vim/ftplugin/latex-suite/templates"
alias temp2="cd /home/gks/Dropbox/dotfiles/vim/bundle/vim-template/templates"
alias snfit="~/salt/bin/./snfit"
alias sjot="ssh gks4@jotunn.rhi.hi.is"
alias sfjot="sshfs gks4@jotunn.rhi.hi.is:/home/gks4/ /mnt/jotunn/"
alias matlab="/usr/local/MATLAB/R2012a/bin/./matlab"
alias sfsdr="sshfs gks@10.0.0.1:/home/gks/Dropbox /mnt/archDropbox/"
alias myx2x='ssh -X gks@10.0.0.1 "x2x -west -to :0." &'
alias single='~/.screenlayout/./lapOnly.sh'
alias cernR='~/.screenlayout/./cernRight.sh'
alias psuL='~/.screenlayout/./psuLeft.sh'
alias one='~/.screenlayout/./cernOne.sh'
alias hR='~/.screenlayout/./hR.sh'
alias dual='~/.screenlayout/./archRight.sh'
alias duall='~/.screenlayout/./oldLeft.sh'
alias snip="cd ~/Dropbox/dotfiles/vim/snippets/"
alias cups="sudo systemctl start cups.service"
alias backlight="asus-screen-brightness"
alias jsw="cd ~/Dropbox/jekyll/gummiks.github.io/ && jekyll serve --watch"
alias cernf="sftp gstefans@lxplus.cern.ch"
alias cernh="ssh gstefans@lxplus.cern.ch"
alias g="gvim"
alias sshw="ssh -X gws5257@128.118.147.79"
alias jeksize="mogrify -resize 800 *.jpg"
alias julia="~/julia/./julia"
alias myra="ssh -X gws5275@myra.astro.psu.edu"
alias myra1="ssh gws5275@myra.astro.psu.edu"
alias jul="ipython notebook --profile julia"


shopt -s autocd
#python /home/gks/.termquotes/termquotes.py
archey
xmodmap -e "keycode 49 = less greater bar bar bar bar"
PATH=$PATH:/home/gks/Dropbox/dotfiles/shortcuts
PATH=$PATH:/home/gks/.gem/ruby/2.0.0/bin

. /usr/bin/thisroot.sh

export PATH
export PATH=$PATH:/home/gks/intel/bin/
export EDITOR=vim
export LD_LIBRARY_PATH=$ROOTSYS/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
