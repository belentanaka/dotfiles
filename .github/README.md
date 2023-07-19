# Dotfiles

![A screenshot of my desktop.](./images/screenshot_desktop.png)

[Dotfiles](https://wiki.archlinux.org/title/Dotfiles) are plain text files used to store user-specific application configurations. These files are found in Unix-like operating systems, and often have names beginning with a `.`, hence the name "dotfiles". There are many different ways to organize them, which you can learn about [here](https://dotfiles.github.io/).

I am very particular about the way my system should look and behave, so I created this git repository to save and keep track of my dotfiles. Locally these files are stored in my home directory under `$HOME/dotfiles`, and they are installed and managed using [GNU Stow](https://www.gnu.org/software/stow/). I prefer Stow because it is free, portable, lightweight, and simple.

Each directory within the repository represents a package, and the path of each file within a package's subtree represents the path where Stow will install the file's symlink in the home directory. For example, the file `bash/.bashrc` will correspond to a symlink at `$HOME/.bashrc`, the file `kitty/.config/kitty/kitty.conf` will correspond to a symlink at `$HOME/.config/kitty/kitty.conf`, and so on.

In the event that I want to install my configurations on a new system I can simply clone this repository in the home directory of the system and install symlinks to the files via `stow`. I can also easily edit the files and reinstall them via `stow -R`.

# Breakdown

This section will be dedicated to breaking down the more complex configurations stored in this repository.

## Eww

Viewable [here](/eww/.config/eww). To be used with the [eww](https://github.com/elkowar/eww) widget system.

There are a couple of complex widgets used in my eww configuration:

### player

This is a media player widget used to display song metadata retrieved from [playerctl](https://github.com/altdesktop/playerctl). It is compatible with several applications such as ncspot, spotify, vlc, firefox, and more.

The widget is only made visible when an application is communicating with playerctl. The widget itself has buttons for skipping to the next or previous song, a button for toggling pause and playback, and a scale used for seeking forward and backward in a song. Hovering over the widget will also reveal a window showing song metadata (artist, title, album) along with the song's artwork.

Several listening variables defined in `eww.yuck` are used to keep track of the metadata with calls to `playerctl --follow`.

Because eww doesn't support remote images, I had to develop a workaround for displaying the artwork. I use a listening variable which continuously runs and gets output from the script `player`. The script uses a call to `playerctl --follow` to monitor changes in the art URL. When the URL changes, the script generates an ID from the URL using a hash and checks if there is a file with the same name as the hash in the cache directory `$HOME/.cache/eww/player/art`. If there is, the script simply returns the path to the file. If not, the script downloads the file from the URL, stores it in the cache directory under the ID name, and returns the path to the file. The script uses a random eviction algorithm to clear out the cache when it gets too full. Memory-based LRU caching is also used for the generation of IDs.

### workspaces

This widget contains buttons representing opened [hyprland](https://github.com/hyprwm/Hyprland) workspaces. Clicking on a button will switch you to it's corresponding workspace. This is intended to work similarly to the workspace switching buttons used in [i3bar](https://github.com/i3/i3).

This widget uses a listening variable defined in `eww.yuck` which continously runs and gets output from the script `hyprland`. The script connects and listens to a hyprland socket and waits for events involving workspaces. When these events occur, the script uses hyprctl to retrieve workspace data and outputs a string representing an array of JSON objects, with each object representing a hyprland workspace. From there it is easy to use yuck and scss code to translate the JSON data into buttons for the widget.
