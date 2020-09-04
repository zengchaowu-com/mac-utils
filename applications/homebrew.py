#!/usr/bin/env python3
# coding: utf-8

import os
import system.gem_sources

def dependencies():
    gem_sources.ruby_china()
    pass

def check():
    dependencies()
    path = os.popen("which brew")
    return len(path.readlines()) > 0

def install():
    dependencies()
    if not check():
        os.system("brew install wget")

def uninstall():
    dependencies()
    if check():
        os.system("brew uninstall wget && rm -fr /usr/local/etc/wgetrc")

check()
install()
uninstall()