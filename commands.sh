#!/bin/bash

# Google commands

function google {
	search="$@"
	google-chrome https://www.google.com/search?q=${search// /+}
}

function chrome {
        google-chrome $1
}

# Dir access commands

function gdrive {
	if ! [[ $(findmnt "/media/ander428/Windows") ]]; then
		sudo mount /dev/nvme0n1p3/ /media/ander428/Windows
	fi
	cd /media/ander428/Windows/Users/joshu/Google\ Drive/Classes
}

function github {
        if ! [[ $(findmnt "/media/ander428/Windows") ]]; then
                sudo mount /dev/nvme0n1p3/ /media/ander428/Windows
        fi
        cd /media/ander428/Windows/Users/joshu/Documents/Github
}

# Quick update files

function update-atom-style {
	cp ~/.atom/styles.less ~/scripts/
}
