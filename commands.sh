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
	if ! [[ $(findmnt "/media/Windows") ]]; then
		sudo mount -t ntfs-3g -o uid=1000,gid=1000,dmask=002,fmask=111 /dev/nvme0n1p3 /media/Windows
	fi
	cd /media/Windows/Users/joshu/Google\ Drive/Classes
}

export -f gdrive

function github {
	if ! [[ $(findmnt "/media/Windows") ]]; then
		sudo mount -t ntfs-3g -o uid=1000,gid=1000,dmask=002,fmask=111 /dev/nvme0n1p3 /media/Windows
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

function studio {
	/opt/android-studio/bin/studio.sh
}

export -f studio

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
