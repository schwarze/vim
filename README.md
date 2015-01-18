vim
===
Portable vim configuration w/ self-installing plugins

Prerequisites:

- Windows:
  - @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
  - choco install git
  - choco install wget
  - choco install ctags
  - choco install ag

- OS X:
  - ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  - brew install ctags-exuberant
  - brew install the_silver_searcher

- Ubuntu:
  - sudo apt-get install git
  - sudo apt-get install exuberant-ctags
  - sudo apt-get install silversearcher-ag

- Fedora:
  - yum install the_silver_searcher
 
  
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

