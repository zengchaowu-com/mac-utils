#!/usr/bin/env python3
# coding: utf-8

import os

def dependencies():
    pass

def check():
    return False

def install():
    os.system("brew install tree")
    pass

def uninstall():
    pass

print(check())