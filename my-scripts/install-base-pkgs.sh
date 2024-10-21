(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh curl sway swaybg swayidle swaylock xdg-desktop-portal-wlr xwayland waybar brightnessctl feh rofi dunst grimshot neovim network-manager-gnome alacritty playerctl fonts-font-awesome neofetch btop copyq python3 pipx wlsunset -y \
	&& pipx install autotiling \
	&& pipx ensurepath \
	&& eval "$(register-python-argcomplete pipx)" \
	&& wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IosevkaTerm.zip \
	&& unzip "*.zip" "*.ttf" "*.otf" -d ${HOME}/.fonts \
	; sudo fc-cache -f -v
