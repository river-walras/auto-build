#!/bin/bash

# 安装zsh
echo "Installing zsh..."
sudo apt update
sudo apt install -y zsh

# 安装oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 安装插件
echo "Installing plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 修改.zshrc配置文件
echo "Configuring .zshrc..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

# 将zsh设置为默认shell
echo "Setting zsh as default shell..."
chsh -s $(which zsh)

# 提示用户
echo "Installation complete! Please run these commands to finish setup:"
echo "1. zsh"
echo "2. source ~/.zshrc"
