## there's no place like ~

These are dotfiles - a combination of the work of many others with my tweaks.

Dotfiles are personalized configuration files for UNIX-like systems, they usually reside in your home (`~`) directory.

Like several others [@parkr|@tombell|@holman|@cowboy], my dotfiles are organized into modules (macos, git, zsh etc). For more information about dotfiles and @holman's specifically check out his [repo][holman-repo] and [blog post][holman-post] on the subject. Read more about oh-my-zsh at [repo][oh-my-zsh-repo].

[holman-repo]: https://github.com/holman/dotfiles
[holman-post]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
[oh-my-zsh-repo]: https://github.com/ohmyzsh/ohmyzsh

## Install

* `git clone git://github.com/jdmacleod/dotfiles ~/.dotfiles`
* `cd ~/.dotfiles`
* `rake install`

The install rake task will do the work to set up any needed software and symlink all the correct files from `~/.dotfiles` to your home directory. You will want to configure and tweak everything inside the `~/.dotfiles` directory though.

## Components

Taken from @holman's, there are a few special files in the repository:

* `bin/`, anything in `bin/` will get added to your `$PATH` and made available
  everywhere
* `<module>/*.zsh`, any files ending with `.zsh` will get loaded into your
  environment
* `<module>/*.symlink`, any files ending with `.symlink` will get symlinked into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded in your home directory. These get symlinked when you run `rake install`
* `<module>/*.completion.sh`, any files ended in `completion.sh` get loaded last so that they get loaded after we set up zsh autocomplete functions

## Extras

* If you want some more colors for things like `ls`, install `grc`:
  `brew install grc`
* If you want `rvm` or `rbenv` to manage your ruby installs, install either and you'll get the current ruby version in your prompt

## Bugs

These are mainly intended for personal use but suggestions are appreciated. Just open an issue and/or pull request.

## Thanks

Starting with @parkr, traced changes, additions and suggestions back to @holman @ryanb @cowboy and @mathiasbynens. Thanks to @robbyrussell for ohmyzsh. We all pay it forward.
