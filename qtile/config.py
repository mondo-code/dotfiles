# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen # Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.lazy import lazy
from libqtile import qtile
from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration, BorderDecoration
import colors

mod = "mod4"
terminal = "alacritty"
browser = "librewolf"

# keybinds
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # switch monitor binds
    Key([mod], "comma", lazy.next_screen(), desc="Focus next monitor"),
    Key([mod], "period", lazy.prev_screen(), desc="Focus previous monitor"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod, "shift"], "m", lazy.window.toggle_minimize(), desc="Toggle minimize"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("rofi -show drun")),

    # Open browser
    Key([mod], "b", lazy.spawn(browser)),
    # screenshot tool
    Key([mod, "shift"], "s", lazy.spawn("escrotum -s '~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S_$wx$h.png'")),
    # doom emacs
    Key([mod], "e", lazy.spawn("emacs")),
]

groups = [Group(i) for i in "1234567890"]
# there is absolutely a smarter way to do this, but i don't really care
groups[0].label = "I"
groups[1].label = "II"
groups[2].label = "III"
groups[3].label = "IV"
groups[4].label = "V"
groups[5].label = "VI"
groups[6].label = "VII"
groups[7].label = "VIII"
groups[8].label = "IX"
groups[9].label = "X"

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# multiple color schemes defined in colors.py
colors = colors.gruvbox

layouts = [
    layout.MonadTall(border_width=2,
                     border_focus=colors["window"],
                     border_normal=colors["inactive_group"],
                     margin=12),
    # layout.Columns(border_width=2,
    #                border_focus=colors["window"],
    #                border_normal=colors["background"],
    #                margin=12),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=3,
    #              border_width=2,
    #              border_focus=colors["window"],
    #              border_normal=colors["backgkound"]),
    # layout.Bsp( border_width=2,
    #             border_focus=colors["window"],
    #             border_normal=colors["background"],),
    layout.Matrix(border_width=2,
                  border_focus=colors["window"],
                  border_normal=colors["inactive_group"],
                  margin=12
                  ),
    layout.Floating(border_focus=colors["window"],
                    border_normal=colors["inactive_group"],
                    border_width=2),
    layout.MonadWide(border_width=2,
                     border_normal=colors["inactive_group"],
                     border_focus=colors["window"],
                     margin=12),
    # layout.RatioTile(),
    layout.Tile(border_width=2,
                     border_focus=colors["window"],
                     border_normal=colors["inactive_group"],
                     margin=12),
    layout.TreeTab(
            active_bg=colors["window"],
            fontsize=14,
            inactive_bg=colors["background"],
            urgent_bg=colors["widget3"],
            background=colors["dark_background"],
            margin=12
        ),
    layout.VerticalTile(border_width=2,
                        border_focus=colors["window"],
                        border_normal=colors["background"],
                        margin=12),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrains Mono Bold",
    fontsize=12,
    padding=8,
)
extension_defaults = widget_defaults.copy()

# initializing bar
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(filename="~/.config/qtile/Icons/archlinux-logo.png", 
                             background=colors["dark_background"],
                             ),
                # widget.LaunchBar(default_icon="~/.config/qtile/Icons/archlinux-logo.png",
                #                  progs=[('rofi', 'rofi -show drun')])
                widget.Spacer(length=3),
                widget.GroupBox(
                    disable_drag=True,
                    highlight_method='line',
                    active=colors["active_group"],
                    inactive=colors["inactive_group"],
                    this_current_screen_border=colors["window"],
                    this_screen_border=colors["unfocused_group"],
                    highlight_color=colors["dark_background"],
                    urgent_border=colors["urgent"],
                    urgent_bg=colors["urgent"],
                    # spacing=2
                    # decorations=[ PowerLineDecoration(
                    #             override_colour=colors["window"],
                    #     ) 
                    # ]
                ),
                widget.Prompt(),
                widget.WindowName(foreground=colors["window"]),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Spacer(decorations=[
                                           # PowerLineDecoration(
                                           #  override_colour=colors["dark_background"],
                                           #  override_next_colour=colors["widget1"],
                                           #  path='arrow_right')
                                           ],
                              length=1),
                widget.CurrentLayout(foreground=colors["widget1"], fmt="╬ {}",
                                     decorations=[
                                         BorderDecoration(
                                             colour=colors["widget1"],
                                             border_width = [0, 0, 3, 0],
                                             extrawidth=2,
                                             padding_x=4
                                             )
                                         # PowerLineDecoration(override_colour=colors["widget1"],
                                         #                     override_next_colour=colors["widget2"],
                                         #                     path='arrow_right'),

                                         ]
                                     ),
                widget.CPU(foreground=colors["widget2"], format = "■ CPU: {freq_current}GHz ({load_percent}%)",
                           decorations=[
                               BorderDecoration(
                                   colour=colors["widget2"],
                                   border_width = [0, 0, 3, 0],
                                   extrawidth=2,
                                   padding_x=4
                                   )
                               # PowerLineDecoration(override_colour=colors["widget2"],
                               #                     override_next_colour=colors["widget3"],
                               #                     path='arrow_right')
                               ]
                           ),
                widget.Memory(measure_mem='M', foreground=colors["widget3"],
                              format="☰ RAM:{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm} ({MemPercent}%)",
                              decorations=[
                                  BorderDecoration(
                                      colour=colors["widget3"],
                                      border_width = [0, 0, 3, 0],
                                      extrawidth=2,
                                      padding_x=4
                                      )
                                  # PowerLineDecoration(override_colour=colors["widget3"],
                                  #                     override_next_colour=colors["widget4"],
                                  #                     path='arrow_right')
                                  ]
                              ),
                widget.Clock(format="● %Y-%m-%d %a %I:%M:%S %p", foreground=colors["widget4"],
                             decorations=[
                                  BorderDecoration(
                                      colour=colors["widget4"],
                                      border_width = [0, 0, 3, 0],
                                      extrawidth=2,
                                      padding_x=4
                                      )
                                 # PowerLineDecoration(override_colour=colors["widget4"], 
                                 #                     path='arrow_right')
                                 ]
                             ),
            ],
            30,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            opacity=1.0,
            name="qtilebar",
            background=colors["dark_background"],
         ),
         wallpaper=colors["wallpaper"],
         wallpaper_mode='fill'
        ),
    Screen(
        top=bar.Bar(
            [
                widget.Image(filename="~/.config/qtile/Icons/archlinux-logo.png",
                             background=colors["dark_background"],
                             ),
                # widget.LaunchBar(default_icon="~/.config/qtile/Icons/archlinux-logo.png",
                #                  progs=[('rofi', 'rofi -show drun')])
                widget.Spacer(length=3),
                widget.GroupBox(
                    disable_drag=True,
                    highlight_method='line',
                    active=colors["active_group"],
                    inactive=colors["inactive_group"],
                    this_current_screen_border=colors["window"],
                    this_screen_border=colors["unfocused_group"],
                    highlight_color=colors["dark_background"],
                    urgent_border=colors["urgent"],
                    urgent_bg=colors["urgent"],
                    # spacing=2
                    # decorations=[ PowerLineDecoration(
                    #             override_colour=colors["window"],
                    #     )
                    # ]
                ),
                widget.Prompt(),
                widget.WindowName(foreground=colors["window"]),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Spacer(decorations=[
                                           # PowerLineDecoration(
                                           #  override_colour=colors["dark_background"],
                                           #  override_next_colour=colors["widget1"],
                                           #  path='arrow_right')
                                           ],
                              length=1),
                widget.CurrentLayout(foreground=colors["widget1"], fmt="╬ {}",
                                     decorations=[
                                         BorderDecoration(
                                             colour=colors["widget1"],
                                             border_width = [0, 0, 3, 0],
                                             extrawidth=2,
                                             padding_x=4
                                             )
                                         # PowerLineDecoration(override_colour=colors["widget1"],
                                         #                     override_next_colour=colors["widget2"],
                                         #                     path='arrow_right'),

                                         ]
                                     ),
                widget.CPU(foreground=colors["widget2"], format = "■ CPU: {freq_current}GHz ({load_percent}%)",
                           decorations=[
                               BorderDecoration(
                                   colour=colors["widget2"],
                                   border_width = [0, 0, 3, 0],
                                   extrawidth=2,
                                   padding_x=4
                                   )
                               # PowerLineDecoration(override_colour=colors["widget2"],
                               #                     override_next_colour=colors["widget3"],
                               #                     path='arrow_right')
                               ]
                           ),
                widget.Memory(measure_mem='M', foreground=colors["widget3"],
                              format="☰ RAM:{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm} ({MemPercent}%)",
                              decorations=[
                                  BorderDecoration(
                                      colour=colors["widget3"],
                                      border_width = [0, 0, 3, 0],
                                      extrawidth=2,
                                      padding_x=4
                                      )
                                  # PowerLineDecoration(override_colour=colors["widget3"],
                                  #                     override_next_colour=colors["widget4"],
                                  #                     path='arrow_right')
                                  ]
                              ),
                widget.Clock(format="● %Y-%m-%d %a %I:%M:%S %p", foreground=colors["widget4"],
                             decorations=[
                                  BorderDecoration(
                                      colour=colors["widget4"],
                                      border_width = [0, 0, 3, 0],
                                      extrawidth=2,
                                      padding_x=4
                                      )
                                 # PowerLineDecoration(override_colour=colors["widget4"],
                                 #                     path='arrow_right')
                                 ]
                             ),
            ],
            30,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            opacity=1.0,
            name="qtilebar",
            background=colors["dark_background"],
         ),
         wallpaper=colors["wallpaper"],
         wallpaper_mode='fill'
        ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
        border_focus=colors["window"],
        border_normal=colors["inactive_group"],
        border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        # same settings from above layout
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"

# run shell commands that complete the DE
# some of this is specific to my system, like the display command and the wayland
# display script, so I'm leaving this commented
# if qtile.core.name == "x11":
#     os.system('xrandr --output DP-0 --mode 1920x1080 --rate 144 --left-of HDMI-0')
#     os.system('picom -b')
# if qtile.core.name == "wayland":
#     home = os.path.expanduser("~")
#     subprocess.Popen(["wlmonitorsetup"])

os.system('dunst &')
