#!/bin/bash
echo "Updating system..."
sudo pacman -Syy
echo "Backing up mirrorlist..."
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed '/^#\S/ s|#||' -i /etc/pacman.d/mirrorlist.backup
echo "Ranking mirrors..."
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
echo "Updating system..."
sudo pacman -Syy
echo "Upgrading system..."
sudo pacman -Syu

#Install packer, an AUR helper
sudo pacman -S git
sudo pacman -S base-devel
sudo pacman -S fakeroot
sudo pacman -S wget
wget http://aur.archlinux.org/packages/pa/packer/packer.tar.gz
wget http://aur.archlinux.org/packages/pa/packer/PKGBUILD
makepkg -s PKGBUILD
sudo pacman -U packer-*.pkg.tar.xz

echo "Updating AUR..."
sudo packer -Syu
#Installing with packer
sudo packer -S dropbox
sudo packer -S google-chrome
sudo packer -S google-talkplugin
sudo packer -S asus-screen-brightness
sudo packer -S asus-
sudo packer -S archey
sudo packer -S xorg-backlight
sudo packer -S openafs
sudo packer -S x2x-git
sudo packer -S pdftk
sudo packer -S urxvt-font-size-git

echo "Installing utilities..."
sudo pacman -S vim
sudo pacman -S rxvt-unicode
sudo pacman -S trayer
sudo pacman -S nitrogen
sudo pacman -S gvim
sudo pacman -S nautilus
sudo pacman -S libreoffice
sudo pacman -S sshfs
sudo pacman -S openssh
sudo pacman -S htop
sudo pacman -S nautilus
sudo pacman -S ranger
sudo pacman -S evince
sudo pacman -S ipython
sudo pacman -S python-matplotlib
sudo pacman -S ipython2
sudo pacman -S python2-matplotlib
sudo pacman -S python-scipy
sudo pacman -S python2-scipy
sudo pacman -S xfce4-power-manager
sudo pacman -S acpi #For battery reading
sudo pacman -S cmake
sudo pacman -S qsynergy
sudo pacman -S tcsh
sudo pacman -S markdown

echo "Installing ranger - the best fileManager"
sudo pacman -S ranger

#To configure ranger better: 
#ranger --copy-config=all
#For image preview
sudo pacman -S libcaca
#for syntax highlighting
sudo pacman -S highlight
#for viewing archives
sudo pacman -S atool
#for viewing media info
sudo pacman -S mediainfo
#for previewing html
sudo pacman -S lynx

echo "Configuring slim"
sudo pacman -S slim-themes
sudo pacman -S archlinux-themes-slim
# edit /etc/slim.conf
# find the line current Opensky
# change to archlinux-darch-grey
# or other themes that you like from /usr/share/slim/themes/ directory

#Install LaTeX - I usually select the (default option) i.e. all packages
sudo pacman -S texlive-most

#FIX MULTILIB in /etc/pacman.conf first!
sudo pacman -S skype

echo "Installing xmonad"
sudo pacman -S xmobar
sudo pacman -S xmonad
sudo pacman -S xmonad-contrib

echo "Installing multimedia..."
sudo pacman -S vlc
sudo pacman -S mplayer
sudo pacman -S darktable
sudo pacman -S rawtherapee
sudo pacman -S digikam
sudo pacman -S gimp
sudo pacman -S ffmpeg
sudo pacman -S mencoder
sudo pacman -S kdenlive
sudo pacman -S imagemagick
sudo pacman -S hugin

echo "Installing mpd"
sudo pacman -S mpd
sudo pacman -S ncmpcpp

#Setting up mpd
#Make ~./mpd/
#~/mpd/database
#~/mpd/log
#~/mpd/state
#~/mpd/pid

#Then make
#~/.mpd/mpd.conf
#and specify:

#music_directory    "~/music"          # Can keep commented if XDG music dir.
#playlist_directory "~/.mpd/playlists"
#db_file            "~/.mpd/database"
#log_file           "~/.mpd/log"
#pid_file           "~/.mpd/pid"
#state_file         "~/.mpd/state"

echo "Installing jekyll"
#Installing jekyll - assuming you have ruby
gem install jekyll
gem install rdiscount
