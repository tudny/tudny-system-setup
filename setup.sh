#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# Install packages
if [ -f apts.list ]; then
    echo "Installing packages from apts.list"
    xargs sudo apt install <apts.list
fi

# Install Bazel
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install bazel
sudo apt install bazel-6.0.0 bazel-5.4.0

# Install Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# Install Chrome
pushd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
popd

# Install JetBrain Toolbox
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Install GHcup
sudo apt install build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ghcup install 8.10.4

# Install gh
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Create dirs
mkdir -p ~/Documents/UW/MIMUW/ZPP
mkdir -p ~/Documents/UW/MIMUW/JPP
mkdir -p ~/Documents/UW/MIMUW/JNP3
mkdir -p ~/Documents/UW/MIMUW/WBO
mkdir -p ~/Documents/UW/MIMUW/WNUMAD

# Move dotfiles
mv dotfiles/.zshrc ~/
mv dotfiles/.zsh_scripts ~/
mv dotfiles/.gitconfig ~/

# Remind to setup .ssh and gpg
echo "Don't forget to setup .ssh and gpg!"
echo "Run dark-chrome to enable dark mode in Chrome"
echo "gchup tui to setup ghcup"
echo "Install JetBrain Toolbox and install IntelliJ IDEA Ultimate"
echo "Run gh auth login to setup GitHub CLI"
