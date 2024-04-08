# .config
my linux configs

## Requirements - Wayland / Sway
<ul>
  <li>alacritty</li>
  <li>alsa-firmware</li>
  <li>autotiling</li>
  <li>brave-bin</li>
  <li>breeze-obsidian-cursor-theme</li>
  <li>brightnessctl</li>
  <li>brillo</li>
  <li>clipman</li>
  <li>dmenu</li>
  <li>dolphin</li>
  <li>galculator</li>
  <li>grimshot</li>
  <li>intel-media-driver</li>
  <li>intel-ucode</li>
  <li>networkmanager</li>
  <li>nm-connection-editor</li>
  <li>nm-tray</li>
  <li>papirus-icon-theme</li>
  <li>pavucontrol</li>
  <li>playerctl</li>
  <li>pulseaudio</li>
  <li>pulseaudio-nextsink</li>
  <li>rofi</li>
  <li>sddm-git</li>
  <li>spotify</li>
  <li>spotify-launcher</li>
  <li>sway</li>
  <li>swaybg</li>
  <li>swaylock-effects-git</li>
  <li>ttf-iosevka-nerd</li>
  <li>waybar</li>
  <li>wayland</li>
  <li>wl-clipboard</li>
  <li>wlroots</li>
</ul>

## Packages for pacstrap on fresh Arch Install
### Remember to <i>pacman-key --init</i> && <i>pacman-key --populate</i>
base linux linux-firmware mdadm neovim nnn firefox sof-firmware networkmanager network-manager-applet man-db man-pages texinfo sudo archlinux-keyring intel-ucode btrfs-progs curl coreutils efibootmgr efivar iw iwd mkinitcpio openssh polkit python python-pip git github-cli reflector rsync usb_modeswitch usbutils vim vim-runtime

## Using with .bashrc and .bash_profile
ln -s /home/$USER/.config/.bashrc $HOME/.bashrc && ln -s /home/$USER/.config/.bash_profile $HOME/.bash_profile

## Making themes work
ln -s ~/.config/icons/windows-xp/ ~/.icons/windows-xp
