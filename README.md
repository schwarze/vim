vim
===
Portable vim configuration w/ self-installing plugins

Needed:
- git

Optional:
- ctags 
  - Windows:
    - http://sourceforge.net/projects/ctags/files/
  - OS X:
    - ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    - brew install ctags-exuberant


Install
==

OS X:
- cd ~
- git clone https://github.com/schwarze/vim.git ./vim
- ln -s vim/.vimrc .vimrc

Windows:
- cd %HOMEPATH%
- git clone https://github.com/schwarze/vim.git .\vim
- mklink /H .vimrc vim\.vimrc
