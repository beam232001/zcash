LATEST GUI RELEASE
==================

Go to https://zcash4mac.com to download the dmg of zcash4mac,
includes the latest release of zcash and a GUI wallet, no
command line needed!

Command-line version
--------------------

The User Guide for the command-line version is at:
https://github.com/radix42/zcash/wiki/Mac-User-Guide

It includes links to a pre-built binary release of the command-line
zcash for mac, usage instructions, and an improved version of the
following instructions to build from source.

Building from source
--------------------

First off you need Apple's Xcode (at least version 7, preferably 8.x) and the Xcode Command Line Tools:

https://itunes.apple.com/us/app/xcode/id497799835?mt=12

And Homebrew:

http://brew.sh/

And this is the list of brew packages you'll need installed:

```shell
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake
brew tap homebrew/versions; brew install homebrew/versions/gcc5
brew install binutils
brew install protobuf
brew install coreutils
brew install wget
```

Get all that installed, then run:

```shell
git clone https://github.com/radix42/zcash.git
cd zcash
git checkout v1.0.4-mac-gcc
./zcutil/build-mac.sh
```
When you are done building, you need to do a few things in the [Configuration](https://github.com/zcash/zcash/wiki/1.0-User-Guide#configuration) section of the Zcash User Guide differently because we are on the Mac. All instances of `~/.zcash` need to be replaced by `~/Library/Application\ Support/Zcash` 
The fetch-params.sh script, however, has already been altered to fetch the proving keys into the correct directory to conform to Mac specific naming conventions.

Happy Building,

David Mercer

Tucson, AZ

email <radix42@gmail.com> if you've followed the above
instructions to the letter and get stuck!

This is a volunteer effort, I'm not a ZcashCo employee, and your support is what allows me
to continue porting Zcash to more platforms.

Donations in BTC to: 1L33E8M1LdXmAtgWaSgAVr4TEyDrLWk69B

in ZEC to: t1WeYg7Vwe1E2N5sxY6MQ335x4i12KZwSMu

or in dollars via PayPal to radix42@gmail.com

Watch my website for upcoming versions and ports:

https://zcash.mercerweiss.com
