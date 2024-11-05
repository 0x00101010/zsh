#/bin/bash
set -e

# install zsh if needed
if [ -f /etc/os-release ]; then
    if grep -q "Ubuntu" /etc/os-release; then
        sudo apt install zsh -y
    fi
fi

# install oh-my-zsh and powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/plugins && git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# link .zshrc file
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
ln -s ~/.zsh/.zshrc ~/.zshrc
