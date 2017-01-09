Zcash for Windows
=================

THIS PORT IS NOT YET COMPLETE

Tucson, AZ - Nov 11,2016

These instructions are for experienced C++ POSIX developers who wish
to collaborate on bringing [Zcash](https//z.cash/) to Windows. Its current
incomplete state represents over a month of blind alleys and false starts
with a number of different toolchains, compilers and dependendency build
strategies.

If you do not know what mingw is, the difference between gcc and clang, or
why you want to make sure to launch the right kind of shell to run all these
commands, then this guide is NOT for you!

Dev environment setup
---------------------

First you need to install msys2 and follow their instructions for updating the
package index:

http://msys2.github.io/

Next, open ```c:\msys64\msys2_shell.cmd``` and find and uncomment the following line
(remove "rem" at the start of it):

```rem set MSYS2_PATH_TYPE=inherit```

Save that file, then open an MSYS2 shell (normally you'll use a MinGW64 shell for
doing things with this project, but not for package installation). Run the following
commands:

```
mkdir /mingw64
pacman -S mingw-w64-x86_64-toolchain
pacman -S git
pacman -S autoconf
pacman -S tar
pacman -S mingw-w64-x86_64-winpthreads-git
pacman -S make
pacman -S automake
pacman -S patch
pacman -S libtool
```

Now exit the MSYS2 shell, and in a MinGW64 shell, checkout the Windos branch of v1.0.2
in my fork of Zcash:

```
git clone https://github.com/radix42/zcash.git
git checkout v1.0.4-win-native
```

You're now ready to attempt a build, which, unless there are updates to it after the date
of this README, WILL FAIL, but not until after it builds all the dependencies and starts
compiling Zcash itself:

```
cd zcash
./zcutil/build-win.sh
```

I have the issue tracker and Pull Requests enabled in my github repo at the address above,
please open tickets and contribute code there for now, Windows support isn't on the roadmap
for ZcashCo until some undetermined point down the road.

Happy hacking! I've hit the wall with my knowledge of C++ and need the help of the community
to get this port to Windows finished!

Cheers,

David Mercer
Tucson, AZ
radix42@gmail.com
radix42 on twitter,
forum.z.cash, chat.zcashcommunity.com
and elsewhere
