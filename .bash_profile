#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export MOZ_ENABLE_WAYLAND=1 firefox
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland
export XDG_CURRENT_DESKTOP=sway

# Created by `pipx` on 2024-10-14 03:56:02
export PATH="$PATH:$HOME/.local/bin"
