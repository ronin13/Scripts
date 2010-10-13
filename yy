#!/bin/zsh
exclude="sudo,rm,^\."
pushd "$HOME"
command=$(cat ~/.histfile | /bin/grep -i -v -E ${exclude//,/|} | ${=DMENU})
[[ ! -z $command ]] && xterm -e "${=command};read"   #|| notify-send "Cannot run $command"
popd
