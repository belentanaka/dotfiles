# Dotfiles

![Screenshot of my desktop.](screenshot.png)

[Dotfiles](https://wiki.archlinux.org/title/Dotfiles) are plain text files used
to store user-specific application configurations. These files are found in
Unix-like operating systems, and often have names beginning with a `.`, hence
the name "dotfiles". There are many different ways to organize them, which you
can learn about [here](https://dotfiles.github.io/).

I am very particular about the way my system should look and behave, so I
created this git repository to save and keep track of my dotfiles. Locally
these files are stored in my home directory under `$HOME/dotfiles`, and they
are installed and managed using [GNU Stow](https://www.gnu.org/software/stow/).
I prefer Stow because it is free, portable, lightweight, and simple.

Each directory within the repository represents a package, and the path of each
file within a package's subtree represents the path where Stow will install the
file's symlink in the home directory. For example, the file `bash/.bashrc` will
correspond to a symlink at `$HOME/.bashrc`, the file
`kitty/.config/kitty/kitty.conf` will correspond to a symlink at
`$HOME/.config/kitty/kitty.conf`, and so on.

In the event that I want to install my configurations on a new system I can
simply clone this repository in the home directory of the system and install
symlinks to the files via `stow`. I can also easily edit the files and
reinstall them via `stow -R`.
