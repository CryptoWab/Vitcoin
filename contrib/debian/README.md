
Debian
====================
This directory contains files used to package vitcoind/vitcoin-qt
for Debian-based Linux systems. If you compile vitcoind/vitcoin-qt yourself, there are some useful files here.

## vitcoin: URI support ##


vitcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install vitcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your vitcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/vitcoin128.png` to `/usr/share/pixmaps`

vitcoin-qt.protocol (KDE)

