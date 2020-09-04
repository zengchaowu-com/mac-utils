#!/usr/bin/env python3
# coding: utf-8

import os
import system.gem_sources
import system.hosts

def dependencies():
    gem_sources.ruby_china()
    hosts.raw_githubusercontent_com()
    hosts.api_github_com()
    pass

def check():
    path = os.popen("which brew")
    return len(path.readlines()) > 0

def install():
    dependencies()
    if not check():
        os.system("brew install wget")

def uninstall():
    if check():
        os.system("brew uninstall wget && rm -fr /usr/local/etc/wgetrc")

check()
install()
uninstall()