(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
\
\
&& sudo apt update \
&& sudo apt install curl gammastep gh sway swaybg swayidle swaylock xdg-desktop-portal-wlr xwayland waybar brightnessctl feh rofi mako-notifier grimshot neovim network-manager-gnome ntpdate alacritty playerctl fonts-font-awesome fonts-noto-color-emoji fonts-clear-sans neofetch btop copyq python3 pipx wget wlsunset -y \
\
\
&& pipx_pkgs=("autotiling" "flake8" "pydocstyle" "bandit" "mypy" "black" "isort") \
&& for pkg in "${pipx_pkgs[@]}"; do
pipx install "$pkg"
done \
&& eval "$(register-python-argcomplete pipx)" \
\
\
&& sudo ntpdate pool.ntp.org \
&& sudo hwclock --systohc --utc \
\
\
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
&& sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
&& nvim +PlugInstall
