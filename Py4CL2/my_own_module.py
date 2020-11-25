import platform


def add1(n):
    return n + 1


def os_version():
    return platform.system() + " " + platform.release()
