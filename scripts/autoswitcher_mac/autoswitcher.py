import os
import random
import sys

home = os.getenv("HOME")


def random_file(path: str) -> str:
    files = os.listdir(path)
    file = random.choice(files)
    for i in range(1, 10):
        file = random.choice(files)
        if not file.startswith("."):
            break
    return file


def get_wallpaper_path(mode: bool) -> str:
    dir = ""
    if mode is True:
        dir = home + "/Pictures/壁纸/Dark/"
    else:
        dir = home + "/Pictures/壁纸/Light/"
    file = random_file(dir)
    return dir + file


def wallpaper_change(mode: bool):
    command = """/usr/libexec/PlistBuddy -c \
    "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///{$path}" \
    ~/Library/Application\\ Support/com.apple.wallpaper/Store/Index.plist && \
    killall WallpaperAgent"""
    path = get_wallpaper_path(mode)

    os.popen(command.replace("{$path}", path))

def update_config(mode: bool):
    if mode:
        os.popen(
            "cp -f "
            + home
            + "/dotfiles/config/alacritty/alacritty_dark.toml "
            + home
            + "/.config/alacritty/alacritty.toml"
        )
    else:
        os.popen(
            "cp -f "
            + home
            + "/dotfiles/config/alacritty/alacritty_light.toml "
            + home
            + "/.config/alacritty/alacritty.toml"
        )

if __name__ == "__main__":
    mode = sys.argv[1] == "true"
    wallpaper_change(mode)
    update_config(mode)
