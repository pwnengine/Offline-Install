# Offline-Install
Offline installation script to speed up the process of refurbishing old computers with Linux Mint. 

## How to
Simply place the archives that result from ```apt download <package>``` in the same directory as ```install.sh```.
The script will extract and install with apt, then delete the extracted folder.
It will do this for any ```.tar.gz``` in the same directory as itself.
```sublime-text.tar.gz``` is included in repo for example.

## And...
Well, nothing... This is only useful for a project that I'm involved with. The purpose is to refurbish old computers with Linux Mint and donate them to those in need. This script will be useful to speed the process up of installing educational/necessary software without an internet connection.
