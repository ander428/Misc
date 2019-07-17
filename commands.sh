#!/bin/bash

# Google commands

function google {
	search="$@"
	google-chrome https://www.google.com/search?q=${search// /+}
}

export -f google

function chrome {
  google-chrome $1
}

export -f chrome

# Dir access commands

function gdrive {
	if [ "$1" == "-remount" ]; then
			cd ~
			sudo umount /media/Windows
			echo "unmounted"
	fi
	if ! [[ $(findmnt "/media/Windows") ]]; then
		sudo mount -t ntfs-3g /dev/nvme0n1p3 /media/Windows -o fmask=0000,dmask=0000,umask=0000
		echo "mounted"
	fi
	cd /media/Windows/Users/joshu/Google\ Drive/Classes
}

export -f gdrive

function github {
	if [ "$1" == "-remount" ]; then
			cd ~
			sudo umount /media/Windows
			echo "unmounted"
	fi
	if ! [[ $(findmnt "/media/Windows") ]]; then
		sudo mount -t ntfs-3g /dev/nvme0n1p3 /media/Windows -o fmask=0000,dmask=0000,umask=0000
		echo "mounted"
	fi
	cd /media/Windows/Users/joshu/Documents/Github
}

export -f github

function .. {
	cd ..
}

export -f ..

function ... {
	cd ../..
}

export -f ...

function .... {
	cd ../..
}

export -f ....

function ..... {
	cd ../../../..
}

export -f .....

# Aliases

function run {
	sudo /etc/init.d/$1 $2
}

export -f run

function studio {
	/opt/android-studio/bin/studio.sh
}

export -f studio

function vscode {
	code
}

export -f vscode

function intellij {
	/opt/idea-IC-191.6183.87/bin/idea.sh
}

export -f intellij

function webstorm {
	sudo /opt/WebStorm-191.6183.63/bin/webstorm.sh
}

export -f webstorm

function android {
	if [ "$1" == "-nexus" ]; then
		sudo ~/Android/Sdk/tools/emulator -avd Nexus_5X_API_27
	elif [ "$1" == "-pixel" ]; then
		sudo  ~/Android/Sdk/emulator/emulator -avd Pixel_XL_API_29
	fi
}

export -f android

# Quick update files

function update-atom-style {
	dir=`pwd`
	if [ "$1" = "-l" ]; then
                cp ~/scripts/styles.less ~/.atom/styles.less
        elif [ "$#" -eq "1" ]; then
               	cp ~/.atom/styles.less ~/scripts/styles.less
		cd ~/scripts
        	if [[ `git status --porcelain` ]]; then
                	git add styles.less
                	git commit -m "$1"
                	git push
                	echo "Changes Uploaded!"
        	fi
        	cd $dir
  fi
}

export -f update-atom-style
