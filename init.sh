#!/bin/bash
# 初始化系统 此脚本用于第一次初始化电脑

# 修改Hosts
function update_hosts()
{
    echo "修改Hosts文件"
    sudo chmod 777 /etc/hosts

    record=`cat /etc/hosts | grep raw.githubusercontent.com`
    if [ -z $record ];then
        sudo echo 151.101.108.133 raw.githubusercontent.com >> /etc/hosts
    fi

    record=`cat /etc/hosts | grep api.github.com`
    if [ -z $record ];then
        sudo echo 13.250.94.254 api.github.com >> /etc/hosts
    fi
    
    sudo chmod 755 /etc/hosts
}


# 先判断Xcode是否已安装
xcode_path=/Applications/Xcode.app
if  [ -d $xcode_path ];then
    update_hosts
else
    echo "请先安装Xcode"
fi