## Cinnamox-Rhino

Cinnamox-Rhino features a deep grey colour scheme and light text. Cinnamon, Metacity, GTK2, GTK3.18 and GTK3.20+ themes are included along with a script to adjust the transparency of the Cinnamon theme.

## Credits

Build tools are at [Cinnamox-gtk-theme](https://github.com/smurphos/cinnamox-gtk-theme).

[Cinnamox-gtk-theme](https://github.com/smurphos/cinnamox-gtk-theme) is a fork of [Oomox-gtk-theme](https://github.com/themix-project/oomox-gtk-theme).

The Cinnamon themes in both [Cinnamox-gtk-theme](https://github.com/smurphos/cinnamox-gtk-theme) & [Oomox-gtk-theme](https://github.com/themix-project/oomox-gtk-theme) are authored by [@smurphos](https://github.com/smurphos).

GTK2, GTK3, GTK3.20 and Metacity themes in both [Cinnamox-gtk-theme](https://github.com/smurphos/cinnamox-gtk-theme) & [Oomox-gtk-theme](https://github.com/themix-project/oomox-gtk-theme) are authored by [@actionless and contributors](https://github.com/themix-project/oomox-gtk-theme/graphs/contributors).

Menu in screenshots is the excellent [Cinnamenu](https://cinnamon-spices.linuxmint.com/applets/view/282).

Icons in screenshots are from [ePapirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/tree/master/ePapirus).

[Licensed under GPL-3.0](https://github.com/smurphos/cinnamox-gtk-theme/blob/master/LICENSE)

## Installation

Install via Cinnamon's Themes module in Cinnamon settings or download from [Cinnamon Spices](https://cinnamon-spices.linuxmint.com/themes) and unzip into your `~/.themes` directory.

The themes are also available via [openDesktop.org](https://www.opendesktop.org/member/491875/) or [my Github repository](https://github.com/smurphos/cinnamox_themes/releases).

Select the Cinnamox theme as your Desktop, Controls and Window Borders in the Cinnamon Themes module.

To allow the GTK2, GTK3 and Metacity1 themes to apply to GUI apps running as root run this command in your terminal after installation to create symlinks to user themes in the system theme directory.

`sudo ln -s ~/.themes/* /usr/share/themes/`

## Tweaking

### Cinnamon Theme Transparency

The theme includes an interactive bash script that allows end users to adjust the transparency of the Cinnamon Theme. The default is no transparency.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_transparency.sh && ~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_transparency.sh`

If you are not happy with the end result simply run `~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_transparency.sh` again to chose another option including the default.

If you would like to control transparency of application windows then please check out my [opacify windows script](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#opacify-windows)

### Cinnamon Theme Panel Styling

The themes from the 25/11/18 release onwards have a new default styling for the window-list, panel and (in Cinnamon 4) grouped window list applet.

If you prefer the old styling a helper script is included to facilitate a switch to the old styling.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_toggle_cinnamon.sh && ~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_toggle_cinnamon.sh`

To revert to the new styling simply run `~/.themes/Cinnamox-Rhino/cinnamon/cinnamox_toggle_cinnamon.sh` again.

### GTK2 HIDPI support

If you need HIDPI Support in GTK2 the theme includes a HIDPI version of the gtkrc theme file and a helper script to toggle between the regular and HIDPI version.

To run the script open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Rhino/gtk-2.0/cinnamox_toggle_GTK2_HIDPI.sh && ~/.themes/Cinnamox-Rhino/gtk-2.0/cinnamox_toggle_GTK2_HIDPI.sh`

After the first run you can toggle between the two using `~/.themes/Cinnamox-Rhino/gtk-2.0/cinnamox_toggle_GTK2_HIDPI.sh`

### qt5ct support

If you need support for qt5ct configuration the theme includes a premade qt5ct.conf file and a helper script to install it to the correct location `~/.config/qt5ct/colors`

To run the script open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Rhino/qt5ct/cinnamox_enable_qt5ct.sh && ~/.themes/Cinnamox-Rhino/qt5ct/cinnamox_enable_qt5ct.sh`

## Compatibility

This theme is compatible with Cinnamon versions `3.2.x`, `3.4.x`, `3.6.x`, `3.8.x` & `4.0.x`

The GTK3 themes require GTK `3.18.x` or `3.20.x`+

The GTK2 theme requires the package `gtk2-engines-murrine` or `gtk-engine-murrine` to be installed. The former is a default package in Linux Mint.

Tested on Linux Mint `18.2`, `18.3`, `19`, & `19.1`  64bit with Cinnamon `3.4.x`, `3.6.x`, `3.8.x` & `4.0.x`; Also tested on Manjaro `17.0.6` 64Bit with Cinnamon `3.6.x`, `3.8.x` & `4.0.x`

### Firefox fix

If you have problems seeing text on input fields in Firefox with any particular theme this problem can be solved by adding a `~/.mozilla/firefox/********.default/user.js` file to your Firefox default profile including the line `user_pref("widget.content.gtk-theme-override", "Adwaita");` and restarting Firefox.

This forces firefox to use the GTK default Adwaita theme for rendering all website content.

The theme includes a helper script that creates the file with this content in the correct location. To access the tool open a terminal window and use the following command to make the script executable and launch it.

`chmod +x ~/.themes/Cinnamox-Rhino/cinnamox_firefox_fix.sh && ~/.themes/Cinnamox-Rhino/cinnamox_firefox_fix.sh`

## Make your own theme using Cinnamox / Oomox

The repository at [Cinnamox-gtk-theme](https://github.com/smurphos/cinnamox-gtk-theme) includes instructions to utilise the tools provided to make your own unique Cinnamox based theme.

The [Oomox app](https://github.com/themix-project/oomox) is a GUI app to design and build themes using the [Oomox-gtk-theme](https://github.com/themix-project/oomox-gtk-theme). From [version 1.60+](https://github.com/themix-project/oomox/releases) this app included a Cinnamon theme based on Cinnamox and has an option to export a Cinnamon theme. 

## Changelog & Previous Releases

See [my Github repository](https://github.com/smurphos/cinnamox_themes/releases)

## Additional Screenshots

![Cinnamox-Rhino](https://github.com/smurphos/cinnamox_themes/raw/master/Screenshots/Rhino-menu.png "Cinnamox-Rhino")
![Cinnamox-Rhino](https://github.com/smurphos/cinnamox_themes/raw/master/Screenshots/Rhino-calendar.png "Cinnamox-Rhino")
![Cinnamox-Rhino](https://github.com/smurphos/cinnamox_themes/raw/master/Screenshots/Rhino-GTK.png  "Cinnamox-Rhino")
![Cinnamox-Rhino](https://github.com/smurphos/cinnamox_themes/raw/master/Screenshots/Rhino-trans.png  "Cinnamox-Rhino")
