#!/bin/zsh
# 1 2 3
value=`cat /proc/acpi/video/VGA/LCD/brightness | tail -1 | awk '{ print $2 }'`

if [[ $1 = "1" ]];then [[ $value -lt 100 ]] && value=$(( $value + 8 ));fi

if [[ $1 = "2" ]];then [[ $value -gt 20 ]] && value=$(( $value - 8 ));fi

echo -n $value >| /proc/acpi/video/VGA/LCD/brightness
