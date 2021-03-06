#!/bin/bash
# 初始化系统 此脚本用于第一次初始化电脑

# 安装Homebrew
function install_homebrew()
{
    update_gem_sources
    update_hosts
    if ! [ -x "$(command -v brew)" ]
    then
        echo "install homebrew"
        
    fi
}

# 安装tree
function install_tree()
{
    install_homebrew
    if ! [ -x "$(command -v tree)" ]
    then
        echo "install tree"
        brew install tree
    fi
}

# 安装wget
function install_wget()
{
    install_homebrew
    if ! [ -x "$(command -v wget)" ]
    then
        echo "install wget"
        brew install wget
    fi
}

# 安装cocoapods
function install_cocoapods()
{
    install_homebrew
    if ! [ -x "$(command -v pod)" ]
    then
        echo "install cocoapods"
        brew install cocoapods
    fi
}

# 安装fastlane
function install_fastlane()
{
    install_homebrew
    if ! [ -x "$(command -v fastlane)" ]
    then
        echo "install fastlane"
        brew install fastlane
    fi
}

# 安装node
function install_node()
{
    install_homebrew
    if ! [ -x "$(command -v node)" ]
    then
        echo "install node"
        brew install node
        npm install yarn -g
    fi
}

# 安装Chrome
function install_chrome()
{
    install_homebrew
    path='/Applications/Google Chrome.app'
    if ! [ -d "$path" ]
    then
        brew cask install google-chrome
    fi
}

# 安装Lantern
function install_lantern()
{
    install_homebrew
    path='/Applications/Lantern.app'
    if ! [ -d "$path" ]
    then
        brew cask install lantern
    fi
}

# 安装Appcode
function install_appcode()
{
    install_homebrew
    path='/Applications/AppCode.app'
    if ! [ -d "$path" ]
    then
        brew cask install appcode
    fi
}

# 安装VSCode
function install_vscode()
{
    install_homebrew
    path='/Applications/Visual Studio Code.app'
    if ! [ -d "$path" ]
    then
        brew cask install visual-studio-code
    fi
}

# 安装AndroidStudio
function install_android_studio()
{
    install_homebrew
    path='/Applications/Android Studio.app'
    if ! [ -d "$path" ]
    then
        brew cask install android-studio
    fi
}

# 安装flutter
function install_flutter()
{
    install_homebrew
    if ! [ -x "$(command -v flutter)" ]
    then
        echo "install flutter"
        touch ~/.zshrc
        record=`cat ~/.zshrc | grep PUB_HOSTED_URL`
        if [ ${#record} = 0 ]
        then
            echo "update PUB_HOSTED_URL .zshrc"
            echo export PUB_HOSTED_URL=https://pub.flutter-io.cn >> ~/.zshrc
            source ~/.zshrc
        fi

        record=`cat ~/.zshrc | grep FLUTTER_STORAGE_BASE_URL`
        if [ ${#record} = 0 ]
        then
            echo "update FLUTTER_STORAGE_BASE_URL .zshrc"
            echo export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn >> ~/.zshrc
            source ~/.zshrc
        fi

        brew cask install flutter
    fi
}

# 先判断Xcode是否已安装
xcode_path='/Applications/Xcode.app'
if  [ -d "$xcode_path" ]
then
    install_tree
    install_wget
    install_cocoapods
    install_fastlane
    install_node

    install_chrome
    install_lantern
    install_appcode
    install_vscode
    install_android_studio

    install_flutter

else
    echo "install xcode to continue"
fi