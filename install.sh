files=".vimrc .zshrc .config/i3/config .config/Code/User/settings.json .config/kitty/kitty.conf .Xresources .oh-my-zsh/themes/oxide.zsh-theme .config/kitty/theme.conf .config/i3blocks/config .config/qutebrowser/config.py .config/rofi/config"

ln -sf ~/dev/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dev/dotfiles/.config/nvim/vimrc.vim ~/.config/nvim/vimrc.vim
#for file in $files; do
#   ln -sf ~/dev/dotfiles/$file ~/$file
#done
