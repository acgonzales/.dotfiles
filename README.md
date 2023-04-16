# My OSX dotfiles

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

`xcode-select --install`

2. Clone `.dotfiles` repository.

```
cd ~
git clone --branch osx git@github.com:acgonzales/.dotfiles.git .dotfiles
cd .dotfiles
```

3. Run `dotbot` install

```
cd ~/.dotfiles
./install
```
