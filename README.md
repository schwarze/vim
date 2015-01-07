vim
===
Portable vim configuration w/ self-installing plugins

Prerequisites:

- Windows:
  - http://git-scm.com/downloads

- OS X:
  - ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  - brew install ctags-exuberant

- Linux:
  - sudo apt-get install git
  - sudo apt-get install exuberant-ctags


Install
==

- Windows:
  - cd %HOMEPATH%
  - git clone https://github.com/schwarze/vim.git .\vim
  - mklink /H .vimrc vim\\.vimrc

- OS X / Linux:
  - cd ~
  - git clone https://github.com/schwarze/vim.git ./vim
  - ln -s vim/.vimrc .vimrc

