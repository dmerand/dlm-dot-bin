# DLM-DOT-BIN
This is a collection of scripts that help me do things in my daily life. I'm putting them on GitHub on the outside chance that they're of use to anybody else.

Note that these files have only been tested on my machines: Mostly OpenBSD 6.7, OS X and Windows 10 running Debian in WSL. Use at your own risk - I'd recommend knowing a bit about shell scripting. [This](http://tldp.org/LDP/abs/html/) is a fantastic guide.

Also note: many/most of these scripts assume that they're located in `$HOME/.bin/`, and that `$HOME/.bin` is in your path.


## Setup
I've got some scripts that have sensitive info in a `sensitive` folder, and I've also got an `external` folder for scripts and binaries that I want to manually put on my path. Both folders are `gitignore`d so that they don't end up in the repository. The script `_dlm_dot_bin_setup.sh` will install symlinks for any scripts in either of those folders into the main `bin` folder.


## License
All directories and files are MIT Licensed, unless otherwise specified in the file.
