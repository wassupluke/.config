#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export MOZ_ENABLE_WAYLAND=1 firefox
# export QT_QPA_PLATFORMTHEME=qt6ct
# if [ x"$XDG_CURRENT_DESKTOP" = x"Sway" ] ; then 
#   QT_QPA_PLATFORMTHEME=qt5ct
#   export QT_QPA_PLATFORMTHEME
# fi
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland
export XDG_CURRENT_DESKTOP=sway
