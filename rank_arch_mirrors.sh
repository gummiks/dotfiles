#! /bin/bash
#
# rank_arch_mirrors.sh
# Copyright (C) 2014 gks <gks@zen>
#
# Distributed under terms of the MIT license.
#

#Has to be run with root privileges 

echo "Copying mirrorlist to mirrorlist.backup"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Uncommenting all mirrors in mirrorlist.backup"
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
echo "Ranking mirrors, will return 6 top ones"
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist



