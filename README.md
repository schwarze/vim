vim
===
Portable vim configuration w/ self-installing plugins

Needed:
- git

Optional:
- ctags (http://sourceforge.net/projects/ctags/files/)


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
