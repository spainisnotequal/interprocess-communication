import platform


def os_version():
    return platform.system() + " " + platform.release()


if __name__ == "__main__":
    print(os_version())
