First off you need Apple's Xcode Command Line Tools:

http://mac-how-to.wonderhowto.com/how-to/install-command-line-developer-tools-without-xcode-0168115/

And Homebrew:

http://brew.sh/

And this is the list of brew packages you'll need installed:

```shell
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake
brew install homebrew/versions/gcc5
brew install binutils
brew install protobuf
brew install coreutils
```

Get all that installed, then run:

```shell
git clone https://github.com/radix42/zcash.git
cd zcash
git checkout v1.0.0-mac-gcc
./zcutil/build-mac.sh
```
When you are done building, you need to do a few things in the [Configuration](https://github.com/zcash/zcash/wiki/1.0-User-Guide#configuration) section of the Zcash User Guide differently because we are on the Mac. All instances of `~/.zcash` need to be replaced by `~/Library/Application\ Support/Zcash` and after you run `./zcutil/fetch-params.sh` you need to run `mv ~/.zcash-params ~/Library/Application\ Support/ZcashParams`

Happy Building,

David Mercer
Tucson, AZ

email <radix42@gmail.com> if you've followed the above
instructions to the letter and get stuck!
