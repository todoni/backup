#!/bin/sh
ASCII_FONT_FILE="D2Coding-Ver1.3.2-20180524-all.ttc"
NON_ASCII_FONT_FILE="Droid Sans Mono Nerd Font Complete Mono.otf"
ITERM_COLORPRESET_FILE="monokai_pro.itermcolors"

clear
echo -e "\033[32;1m"\[Clone Backup Folder\]"\033[m"
git clone https://github.com/todoni/backup
cd backup

echo -e "\033[32;1m"\[Copy setting files\]"\033[m"
cp .zshrc ~/
cp .profile ~/

echo -e "\033[32;1m"\[Open font and terminal color preset setting file\]"\033[m"
open ${ASCII_FONT_FILE}
open ${NON_ASCII_FONT_FILE}
open ${ITERM_COLORPRESET_FILE}
echo -e "\033[32;1m"\[Press Enter to continue...\]"\033[m"
read;

cd ..
echo -e "\033[32;1m"\[Install Homebrew\]"\033[m"
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
source ~/.zshrc

echo -e "\033[32;1m"\[Install Vim-plug\]"\033[m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "\033[32;1m"\[Install coc-nvim\]"\033[m"
brew install neovim
brew install node
cp ~/backup/coc-settings.json ~/.config/nvim/
cp ~/backup/init.vim ~/.config/nvim/
