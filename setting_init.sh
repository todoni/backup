#!/bin/zsh
ASCII_FONT_FILE="D2Coding-Ver1.3.2-20180524-all.ttc"
NON_ASCII_FONT_FILE="Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono.otf"
ITERM_COLORPRESET_FILE="monokai_pro.itermcolors"
NVIM_CONFIG_PATH="~/.config/nvim"
ZSH_THEME="agnoster.zsh-theme"

clear

echo -e "\033[32;1m"\[Install oh-my-zsh\]"\033[m"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wait
echo -e "\033[32;1m"\[Copy setting files\]"\033[m"
cp .zshrc ~/
cp .profile ~/
cp ${ZSH_THEME} ~/.oh-my-zsh/themes

echo -e "\033[32;1m"\[Open font and terminal color preset setting file\]"\033[m"
open ${ASCII_FONT_FILE}
open ${NON_ASCII_FONT_FILE}
open ${ITERM_COLORPRESET_FILE}
echo -e "\033[32;1m"\[Press Enter to continue...\]"\033[m"
read;

cd ..
echo -e "\033[32;1m"\[Install Homebrew\]"\033[m"
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
wait
source ~/.zshrc

echo -e "\033[32;1m"\[Install Vim-plug\]"\033[m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wait

echo -e "\033[32;1m"\[Install coc-nvim\]"\033[m"
brew install neovim
wait
brew install node
wait
mkdir -p ${NVIM_CONFIG_PATH}
cp ~/backup/coc-settings.json ${NVIM_CONFIG_PATH}
cp ~/backup/init.vim ${NVIM_CONFIG_PATH}

echo -e "\033[32;1m"\[Install ncdu\]"\033[m"
brew install ncdu
wait

echo -e "\033[32;1m"\[Generate ssh key\]"\033[m"
ssh-keygen
cd .ssh
cat id_rsa.pub

echo -e "\033[32;1m"\[Don\'t forget to add ssh key to intra net!\]"\033[m"
echo -e "\033[32;1m"\[Now you can open nvim editor and install vim plugin\]"\033[m"
