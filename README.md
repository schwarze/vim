vim
===
Portable vim clipboard deployment w/ self-installing plugins

Windows:
===
  - @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
  - choco install vim
  - choco install git
  - choco install wget
  - choco install ctags
  - choco install ag
  - cd %HOMEPATH%
  - git clone https://github.com/schwarze/vim.git .\vim
  - mklink /H .vimrc vim\\.vimrc
  - gvim

OS X:
===
  - ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  - brew install macvim
  - brew install ctags-exuberant
  - brew install the_silver_searcher
  - cd ~
  - git clone https://github.com/schwarze/vim.git ./vim
  - ln -s vim/.vimrc .vimrc
  - gvim

Ubuntu:
===
  - sudo apt-get install gvim
  - sudo apt-get install git
  - sudo apt-get install exuberant-ctags
  - sudo apt-get install silversearcher-ag
  - cd ~
  - git clone https://github.com/schwarze/vim.git ./vim
  - ln -s vim/.vimrc .vimrc
  - gvim

Fedora:
===
  - yum install the_silver_searcher
  - cd ~
  - git clone https://github.com/schwarze/vim.git ./vim
  - ln -s vim/.vimrc .vimrc
  - gvim

