# asv

 [Atom Shell](https://github.com/atom/atom-shell) version manager

## Installation

    $ npm install -g asv

or

    $ git clone git://github.com/omnidan/asv.git && cd asv && make install

### Installing Binaries

Install a few versions, the version given becomes the active atom-shell binary once installation is complete.

    $ asv 0.20.5
    $ asv 0.20.4

List installed binaries:

    $ asv

      0.20.3
    ο 0.20.4
      0.20.5

Use or install the latest official release:

    $ asv latest

Use or install the stable official release (_Note: Right now there is no stable version of atom-shell, this will use the latest release_):

    $ asv stable

Install a custom or patched version of atom-shell from a tarball:

    $ asv custom 0.20.5-me https://github.com/atom/atom-shell/tarball/v0.20.5
    
Install a version of atom-shell from source (_Note: This is not available at the moment_):

    $ asv 0.20.5 source

### Removing Binaries

Remove some versions:

    $ asv rm 0.20.5 0.20.4 0.20.3

_Note that you cannot remove the actively running version. Change to a different version before removing._

### Binary Usage

When running multiple versions of atom-shell, we can target
them directly by asking `asv` for the binary path:

    $ asv bin 0.20.5
    /usr/local/asv/versions/0.20.5/bin/
    
Start up atom-shell 0.20.5 regardless of the active version:

    $ asv use 0.20.5

When installing or changing the active version we might want to run custom scripts:

    $ asv pre install /path/to/my/script
    $ asv post install /path/to/script
    $ asv pre change /path/to/my/script
    $ asv post change /path/to/script
    
Multiple scripts may be added for any event. To add two `pre change` scripts:

    $ asv pre change /path/to/script1
    $ asv pre change /path/to/script2
    
Scripts are executed in the order they were added.
    
List all pre change hooks:

    $ asv pre change
    
    /path/to/script1
    /path/to/script2
    
List all post install hooks:

    $ asv post install
    
    /path/to/scriptA
    /path/to/scriptB
    /path/to/scriptC
    
To remove a post install hook:

    $ asv post install rm /path/to/scriptB
    
Remove all post install hooks:

    $ asv post install rm

## Usage
Output from `asv --help`:
```
  Usage: asv [options] [COMMAND] [config]

  Commands:

    asv                            Output versions installed
    asv latest [config ...]        Install or activate the latest atom-shell release
    asv stable [config ...]        Install or activate the latest stable atom-shell release
    asv <version> [config ...]     Install and/or use atom-shell <version>
    asv custom <version> <tarball> [config ...]  Install custom atom-shell <tarball> with [args ...]
    asv use <version> [args ...]   Execute atom-shell <version> with [args ...]
    asv bin <version>              Output bin path for <version>
    asv rm <version ...>           Remove the given version(s)
    asv --latest                   Output the latest atom-shell version available
    asv --stable                   Output the latest stable atom-shell version available
    asv ls                         Output the versions of atom-shell available
    asv src <version>              Output the url for source used for the given <version>
                                     (useful if installed from source)
    asv pre <event> [script]       Declare one or list scripts to execute before <event>
                                     (scripts must use absolute paths)
    asv post <event> [script]      Declare one or list scripts to execute after <event>
                                     (scripts must use absolute paths)
    asv pre <event> rm [script]    Remove pre <event> script
    asv post <event> rm [script]   Remove post <event> script

  Events:

    change   Occurs when switching atom-shell versions
    install  Occurs when installing a previously uninstalled atom-shell version

  Options:

    -V, --version   Output current version of m
    -h, --help      Display help information

  Aliases:

    which   bin
    use     as
    list    ls
    custom  c
```

## Details

 `asv` by default installs atom-shell to _/usr/local/asv/versions_, from
 which it can see what you have currently installed, and activate previously installed versions of atom-shell when `asv <version>` is invoked again.

 Activated atom-shell versions are then installed to the prefix _/usr/local_, which may be altered via the __ASV_PREFIX__ environment variable.

 To alter where `asv` operates simply export __ASV_PREFIX__ to whatever you prefer.

## License

[MIT](https://github.com/omnidan/asv/blob/master/LICENSE)

## Inspiration

This is based on [m](https://github.com/aheckmann/m) by aheckmann. Thanks a lot for that, it's a great tool! Because of that, it's also nearly identical to [n](https://github.com/visionmedia/n). Thanks to tj too!
