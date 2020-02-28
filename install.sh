files=".vimrc .zshrc .config/i3/config .config/Code/User/settings.json .config/kitty/kitty.conf .Xresources .oh-my-zsh/themes/oxide.zsh-theme .config/kitty/theme.conf .config/i3blocks/config .config/qutebrowser/config.py .config/rofi/config"

for file in $files; do
	ln -sf ~/dev/dotfiles/$file ~/$file
done
