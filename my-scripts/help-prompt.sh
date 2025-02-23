# alacritty --class help-prompt -T help-prompt -e help-prompt.sh
#!/bin/bash

echo "Here are your keybinds, my princess:
As a note, keys like Shift, Alt, Ctrl, and the Windows key are considered \"modifiers\".
It is common practice in tiling window managers like you have here to designate a
modifier key (aka a Super key) as the main one for activating keybindings. Let's set
the Windows key as your modifier and refer to it as \"mod\" from here on out.

mod+Enter:	Terminal
mod+A:		Applications (show all and search)
mod+B:		Browser
mod+E:		File Explorer
mod+F:		Fullscreen toggle
mod+Shift+Q:	kill focused window (close)
mod+2:		Focuses 2nd workspace
mod+3:		Focuses 3rd workspace, etc
mod+Shift+2:	Sends focused window to 2nd workspace
mod+Shift+3:	Sends focused window to 3rd workspace, etc
mod+Shift+Space:Toggles focused window between floating and tiling
mod+Escape:     Lock computer and blank the screen
mod+?:          Show this helper text (mod+Shift+/)
mod+/:          also shows this helper text
mod+N:          Quickly see calendar, weather, and notifications
mod+Y:          Toggles auto-tiling

prt sc:     	Screenshot
Ctrl+prt sc:	Screenshot custom area
Shift+prt sc:	Screenshot active window

Special commands:
\"magic\":      Works magic on bank statements
\"la\":         List All (shows hidden . files, ls -a)
\"ll\":         List like... everything (ls -alF)
"
printf "%s " "Press Enter to close this window."
read ans
