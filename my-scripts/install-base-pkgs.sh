(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
\
\
&& sudo apt update \
&& sudo apt install curl gammastep gh sway swaybg swayidle swaylock xdg-desktop-portal-wlr xwayland waybar brightnessctl feh rofi mako-notifier grimshot neovim network-manager-gnome ntpdate alacritty playerctl fonts-font-awesome neofetch btop copyq python3 pipx wget wlsunset -y \
&& pipx install autotiling \
&& eval "$(register-python-argcomplete pipx)" \
\
\
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
\
\
&& sudo ntpdate pool.ntp.org \
&& sudo hwclock --systohc --utc \
\
\
&& wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.zip \
&& cd ~/.local/share/fonts \
&& unzip -n Iosevka.zip \
&& rm Iosevka.zip \
&& sudo fc-cache -fv \
\
\
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
&& sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
&& nvim +PlugInstall
