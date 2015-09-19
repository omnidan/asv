# asv [![npm version](https://badge.fury.io/js/asv.svg?style=flat)](http://badge.fury.io/js/asv)

 [Electron / Atom Shell](https://github.com/atom/electron) version manager

## Installation

    $ npm install -g asv

or

    $ git clone git://github.com/omnidan/asv.git && cd asv && make install

### Quickstart
    $ asv latest
    $ atoms

Alternatively, you can use the `electron` command instead of `atoms`:

    $ electron

And, of course, you can launch apps with it:

    $ electron path/to/electron/app/
    $ electron electron_app.asar

### Installing Binaries

Install a few versions, the version given becomes the active electron/atom-shell binary once installation is complete.

    $ asv 0.20.5
    $ asv 0.20.4

Run `atoms` to run the selected version of electron/atom-shell.

List installed binaries:

    $ asv

      0.20.3
    ο 0.20.4
      0.20.5

Use or install the latest official release:

    $ asv latest

Use or install the stable official release (_Note: Right now there is no stable version of electron, this will use the latest release_):

    $ asv stable

Install a custom or patched version of electron/atom-shell from a zipball:

    $ asv custom 0.20.5-me https://github.com/atom/atom-shell/zipball/v0.20.5

Install a version of electron/atom-shell from source:

    $ asv 0.20.5 source

### Removing Binaries

Remove some versions:

    $ asv rm 0.20.5 0.20.4 0.20.3

_Note that you cannot remove the actively running version. Change to a different version before removing._

### Binary Usage

When running multiple versions of electron/atom-shell, we can target
them directly by asking `asv` for the binary path:

    $ asv bin 0.20.5
    /usr/local/asv/versions/0.20.5/bin/

Start up electron/atom-shell 0.20.5 regardless of the active version:

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

## Automatically keeping electron / atom-shell up-to-date
In order to automatically keep electron / atom-shell up-to-date, run `asv -y latest` in a cronjob.

Passing `-y` will skip the question asv asks you when installing a new version.

## Usage
Output from `asv --help`:
```
  Usage: asv [options] [COMMAND] [config]

  Commands:

    asv                            Output versions installed
    asv latest [config ...]        Install or activate the latest electron release
    asv stable [config ...]        Install or activate the latest stable electron release
    asv <version> [config ...]     Install and/or use electron <version>
    asv custom <version> <zipball> [config ...]  Install custom electron <zipball> with [args ...]
    asv use <version> [args ...]   Execute electron <version> with [args ...]
    asv bin <version>              Output bin path for <version>
    asv rm <version ...>           Remove the given version(s)
    asv --latest                   Output the latest electron version available
    asv --stable                   Output the latest stable electron version available
    asv ls                         Output the versions of electron available
    asv src <version>              Output the url for source used for the given <version>
                                     (useful if installed from source)
    asv pre <event> [script]       Declare one or list scripts to execute before <event>
                                     (scripts must use absolute paths)
    asv post <event> [script]      Declare one or list scripts to execute after <event>
                                     (scripts must use absolute paths)
    asv pre <event> rm [script]    Remove pre <event> script
    asv post <event> rm [script]   Remove post <event> script

  Events:

    change   Occurs when switching electron versions
    install  Occurs when installing a previously uninstalled electron version

  Options:

    -v, -V, --version   Output current version of asv
    -h, --help          Display help information
    -y                  Skips the question when installing a new version (useful for scripts that automatically update electron)

  Aliases:

    which   bin
    use     as
    list    ls
    custom  c
```

## Does this work with electron AND atom-shell?
Yes, `asv` checks the version string you passed, for versions <=0.23.0, atom-shell is downloaded and installed instead of electron, for newer versions, electron is downloaded and installed.

The command `atoms` works just like before. There is also an `electron` command, which is an alias to `atoms`.

Everything else should work just like nothing happened. If you do run into an issue, first make sure you have the latest `asv` version (>=1.1) installed, or update `asv` by running `npm install -g asv` - if it still doesn't work, please report your issue [on github](https://github.com/omnidan/asv/issues), it could be related to the fact that atom-shell was renamed to electron.

## Details

 `asv` by default installs electron/atom-shell to _/usr/local/asv/versions_, from
 which it can see what you have currently installed, and activate previously installed versions of electron/atom-shell when `asv <version>` is invoked again.

 Activated electron/atom-shell versions are then installed to the prefix _/usr/local_, which may be altered via the __ASV_PREFIX__ environment variable.

 To alter where `asv` operates simply export __ASV_PREFIX__ to whatever you prefer.

## License

[MIT](https://github.com/omnidan/asv/blob/master/LICENSE)

## Inspiration

This is based on [m](https://github.com/aheckmann/m) by aheckmann. Thanks a lot for that, it's a great tool! Because of that, it's also nearly identical to [n](https://github.com/visionmedia/n). Thanks to tj too!
