#!/bin/bash

# options to be displayed
option0="🔒 Lock"
option1="🚪 Logout"
option2="⏾ Suspend"
option3="🔃 Reboot"
option4="⏻ Shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

chosen="$(echo -e "$options" | rofi -dmenu -p "Power: ")"
case $chosen in
	$option0)
		exec i3lock-fancy-rapid 10 3;;
	$option1)
		i3-msg exit;;
	$option2)
		systemctl suspend;;
	$option3)
		exec reboot;;
	$option4)
		systemctl poweroff;;
esac
