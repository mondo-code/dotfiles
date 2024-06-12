    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    disable_drag=True,
                    highlight_method='line',
                    active=colors["active_group"],
                    inactive=colors["inactive_group"],
                    this_current_screen_border=colors["background"],
                    this_screen_border=colors["unfocused_group"],
                    highlight_color=colors["window"],
                    decorations=[ PowerLineDecoration(
                                override_colour=colors["window"],
                        ) 
                    ]
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
                widget.Spacer(decorations=[PowerLineDecoration(override_colour=colors["dark_background"], override_next_colour=colors["widget1"], path='arrow_right')],
                              length=1),
                widget.CurrentLayout(foreground=colors["background"], fmt="╬ {}",
                                     decorations=[
                                         PowerLineDecoration(override_colour=colors["widget1"], 
                                                             override_next_colour=colors["widget2"],
                                                             path='arrow_right'),
                                         ]
                                     ),
                widget.CPU(foreground=colors["background"], format = "■ CPU: {freq_current}GHz ({load_percent}%)",
                           decorations=[
                               PowerLineDecoration(override_colour=colors["widget2"], 
                                                   override_next_colour=colors["widget3"],
                                                   path='arrow_right')
                               ]
                           ),
                widget.Memory(measure_mem='M', foreground=colors["background"], 
                              format="☰ RAM:{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm} ({MemPercent}%)",
                              decorations=[
                                  PowerLineDecoration(override_colour=colors["widget3"], 
                                                      override_next_colour=colors["widget4"],
                                                      path='arrow_right')
                                  ]
                              ),
                widget.Clock(format="● %Y-%m-%d %a %I:%M:%S %p", foreground=colors["background"],
                             decorations=[
                                 PowerLineDecoration(override_colour=colors["widget4"], 
                                                     path='arrow_right')
                                 ]
                             ),
                widget.Spacer(length=3),
                widget.Image(filename="~/Pictures/Icons/archlinux-logo-white.png", 
                             background=colors["dark_background"],
                             ),
                widget.Spacer(length=3),
            ],
            30,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            opacity=0.90,
            name="qtilebar",
            background=colors["dark_background"],
         ),
         wallpaper=colors["wallpaper"],
         wallpaper_mode='fill'
        ),

