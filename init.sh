#!/bin/bash
# 初始化系统 此脚本用于第一次初始化电脑

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
    update_hosts
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}


# 先判断Xcode是否已安装
xcode_path=/Applications/Xcode.app
if  [ -d $xcode_path ];then
    update_hosts
else
    echo "install xcode to continue"
fi