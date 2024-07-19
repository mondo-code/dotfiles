import os
import random

home = os.path.expanduser("~")

tokyonight_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/tokyonight")
onedark_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/onedark")
nord_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/nord")
gruvbox_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/gruvbox")
catppuccin_wallpapers = os.listdir(f"{home}/.config/qtile/Wallpapers/catppuccin")

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
    "window": "#51afef",
    "widget1": "#4db5bd",
    "widget2": "#ecbe7b",
    "widget3": "#c678dd",
    "widget4": "#a9a1e1",
    "urgent": "",
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
