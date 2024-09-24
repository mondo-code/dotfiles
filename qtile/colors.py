import os
import random

home = os.path.expanduser("~")

tokyonight_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/tokyonight")
onedark_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/onedark")
nord_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/nord")
gruvbox_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/gruvbox")
catppuccin_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/catppuccin")
dracula_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/dracula")
moonfly_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/moonfly")

tokyonight = {
    "background": "#1a1b26",
    "dark_background": "#1a1b26",
    "active_group": "#9aa5ce",
    "unfocused_group": "#",
    "inactive_group": "#414868",
    "window": "#bb9af7",                # purple
    # "blue": "#2ac3de",                  # blue
    # "red": "#f7768e",                   # red
    # "orange": "#ff9e64",                # orange
    "widget1": "#7aa2f7",               # violet
    "widget2": "#7dcfff",             # light blue
    "widget3": "#9ece6a",                 # green
    "widget4": "#e0af68",                # yellow
    "urgent": "#ff9e64",                # orange
    # "lighterblue": "#b4f9f8",           # lighter blue
    "wallpaper": f"{home}/.config/qtile/Wallpapers/tokyonight/{random.choice(tokyonight_wallpapers)}"
}

onedark = {
    "background": "#282c34",
    "dark_background": "#282c34",
    "inactive_group": "#3E4451",
    "unfocused_group": "#545C6E",
    "active_group": "#abb2bf",
    "window": "#61afef",
    "widget1": "#e06c75",
    "widget2": "#98c379",
    "widget3": "#e5c07b",
    "widget4": "#c678dd",
    "urgent": "#56b6c2",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/onedark/{random.choice(onedark_wallpapers)}"
}

nord = {
    "background": "#2e3440",
    "dark_background": "#2e3440",
    "inactive_group": "#4c556a",
    "unfocused_group": "#616D88",
    "active_group": "#d8dee9",
    "window": "#88c0d0",
    "widget1": "#8fbcbb",
    "widget2": "#b48ead",
    "widget3": "#a3be8c",
    "widget4": "#ebcb8b",
    "urgent": "",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/nord/{random.choice(nord_wallpapers)}"
}

gruvbox = {
    "background": "#282828",
    "dark_background": "#1d2021",
    "inactive_group": "#3c3836",
    "unfocused_group": "#504945",
    "active_group": "#a89984",
    "window": "#b16286",
    "widget1": "#689d6a",
    "widget2": "#458588",
    "widget3": "#d79921",
    "widget4": "#cc241d",
    "urgent": "#fe8019",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/gruvbox/{random.choice(gruvbox_wallpapers)}"
}

catppuccin = {
    "background": "#1e1e2e",
    "dark_background": "#1e1e2e",
    "inactive_group": "#6c7086",
    "unfocused_group": "#45475a",
    "active_group": "#cdd6f4",
    "window": "#89b4fa",
    "widget1": "#f9e2af",
    "widget2": "#fab387",
    "widget3": "#f38ba8",
    "widget4": "#cba6f7",
    "urgent": "#fe8019",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/catppuccin/{random.choice(catppuccin_wallpapers)}"
}

dracula = {
    "background": "#282a36",
    "dark_background": "#282a36",
    "inactive_group": "#44475a",
    "unfocused_group": "#45475a",
    "active_group": "#6272a4",
    "window": "#ff5555",
    "widget1": "#8be9fd",
    "widget2": "#50fa7b",
    "widget3": "#ffb86c",
    "widget4": "#bd93f9",
    "urgent": "#f1fa8c",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/dracula/{random.choice(dracula_wallpapers)}"
}

moonfly = {
    "background": "#080808",
    "dark_background": "#080808",
    "inactive_group": "#2f2f2f",
    "unfocused_group": "#1b1b1b",
    "active_group": "#b2b2b2",
    "window": "#80a0ff",
    "widget1": "#ff5454",
    "widget2": "#8cc85f",
    "widget3": "#e3c78a",
    "widget4": "#cf87e8",
    "urgent": "#f09479",
    "wallpaper": f"{home}/.config/qtile/Wallpapers/moonfly/{random.choice(moonfly_wallpapers)}"
}
