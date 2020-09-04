#!/usr/bin/env python3
# coding: utf-8

import os
import homebrew

def dependencies():
    homebrew.install()
    pass

def check():
    path = os.popen("which trees")
    return len(path.readlines()) > 0

def install():
    return os.system("brew install tree")

def uninstall():
    return os.system("brew uninstall tree")

print(check())