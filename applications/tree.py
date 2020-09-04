#!/usr/bin/env python3
# coding: utf-8

import os
import homebrew

def dependencies():
    homebrew.install()
    pass

def check():
    path = os.system("which tree")
    return path

def install():
    
    pass

def uninstall():
    pass

print(check())