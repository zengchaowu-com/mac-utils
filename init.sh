#!/bin/bash
# 初始化系统 此脚本用于第一次初始化电脑

# 修改Gem源
function update_gem_sources()
{
    sources=`gem sources -l | grep gems.ruby-china.com`
    if [ ${#record} = 0 ]
    then
        gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
    fi
}

# 修改Hosts
function update_hosts()
{
    sudo chmod 777 /etc/hosts
    
    record=`cat /etc/hosts | grep raw.githubusercontent.com`
    if [ ${#record} = 0 ];then
        echo "update raw.githubusercontent.com dns"
        sudo echo 151.101.108.133 raw.githubusercontent.com >> /etc/hosts
    fi
    
    record=`cat /etc/hosts | grep api.github.com`
    if [ ${#record} = 0 ];then
        echo "update api.github.com dns"
        sudo echo 13.250.94.254 api.github.com >> /etc/hosts
    fi
    
    sudo chmod 755 /etc/hosts
}

# 安装Homebrew
function install_homebrew()
{
    update_gem_sources
    update_hosts
    if ! [ -x "$(command -v brew)" ]; then
        echo "install homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
}

# 安装cocoapods
function install_cocoapods()
{
    install_homebrew
    if ! [ -x "$(command -v cocoapods)" ]; then
        echo "install cocoapods"
        brew install cocoapods
    fi
}

# 安装fastlane
function install_fastlane()
{
    install_homebrew
    if ! [ -x "$(command -v fastlane)" ]; then
        echo "install fastlane"
        brew install fastlane
    fi
}

# 安装tree
function install_tree()
{
    install_homebrew
    if ! [ -x "$(command -v tree)" ]; then
        echo "install tree"
        brew install tree
    fi
}

# 安装node
function install_node()
{
    install_homebrew
    if ! [ -x "$(command -v node)" ]; then
        echo "install node"
        brew install node
        npm install yarn -g
    fi
}

# 安装flutter
function install_flutter()
{
    install_homebrew
    brew install flutter
}

# 安装Chrome
function install_chrome()
{
    install_homebrew
    brew install google-chrome
}

# 安装Lantern
function install_lantern()
{
    install_homebrew
    brew install lantern
}

# 安装Appcode
function install_appcode()
{
    install_homebrew
    brew install appcode
}

# 安装VSCode
function install_vscode()
{
    install_homebrew
    brew install visual-studio-code
}

# 先判断Xcode是否已安装
xcode_path=/Applications/Xcode.app
if  [ -d $xcode_path ];then
    install_tree
    install_cocoapods
    install_node
else
    echo "install xcode to continue"
fi