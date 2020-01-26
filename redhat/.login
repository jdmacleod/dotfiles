# Shell variables are not passed from the .cshrc.user to child processes,
# so they must be set here.

umask 2
limit coredumpsize 0

# try to force loading of .Xdefaults
# to get app colors, like for XEmacs
# xrdb -load ~/.Xdefaults

