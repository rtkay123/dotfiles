![rice-min](https://user-images.githubusercontent.com/70331483/227951037-1ee6ecbc-771b-4bbf-9677-d9544c4a7a04.png)

## Description
The bar, control center and the fzf launcher (I'm using `skim`) are all eww widgets. The top bar itself is divided into 3 sections.

<h3>Left</h3>

- A button (search icon) (bound to `alt+f`) that opens an eww widget and runs `sk` using the input field as a query. You can click to open the file in a `tmux` session.
- Quick Launch buttons 
    - Open `neovim` (in `alacritty`)
    - `firefox-developer-edition`
    - `inkscape`
    - Capture a screenshot (with `grim`)
- Workspace indicator (`blue` for current workspace, `green` for occupied workspaces)

<h3 align="center">Center</h3>
Output of a request to `wttr.in`

<h3 align="right">Right</h3>

- RAM indicator as a circular progress bar. The colour changes depending on load (`blue`, `green`, `yellow`, `red`).
- Bluetooth icon (if bluetooth is enabled according to `rfkill`)
- Wifi/Ethernet icon (you may need to update your interface names)
- Control Center button (clicking or `alt+c` toggles the control center):
    - The wifi, bluetooth and airplane mode buttons all toggle `rfkill` options.
    - The volume and brightness sliders are interactive
    - You need `playerctl` for the `music player` widget
- Battery indicator
- Day and time

# Misc

- There's a systemd timer available to check your newsboat feed. Edit it as needed.
- `Mod+C` is bound to open a rofi (dmenu themed) window that you can use to quickly find and edit your config files.
- If you use a laptop, I have a `udev` rule that turns off the compositor's blur and animations (as well as stops the docker service if no containers are running). The reverse is done when you plug in. You may need to remove that rule if it's not something you need.


## Applications

This config uses a number of open source projects to work properly:

- [Hyprland] - Wayland Compositor
- [Alacritty] - Terminal Emulator
- [eww] - Bar and popup widgets
- [Zathura] - PDF Reader
- [Colloid] - Icon themes
- [xplr] - File Manager
- [Neovim] - Code Editor

Have a look at the respective projects' READMEs for installation instructions.

## Installation

There's an install script that you can use if you don't feel like copying everything manually. If you choose to use it, take a look at it first and make sure you execute it from the repo's directory. 

```sh
./install
```

## License

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [Hyprland]: <https://github.com/hyprwm/Hyprland>
   [Alacritty]: <https://github.com/alacritty/alacritty>
   [eww]: <https://github.com/elkowar/eww>
   [Zathura]: <https://github.com/pwmt/zathura>
   [Colloid]: <https://github.com/vinceliuice/Colloid-icon-theme>
   [xplr]: <https://github.com/sayanarijit/xplr>
   [Neovim]: <https://github.com/neovim/neovim>  
