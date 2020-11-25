# This file should be located in the $HOME/.local/lib/python3.7/site-packages directory

import platform


def add1(n):
    return n + 1


def os_version():
    return platform.system() + " " + platform.release()
