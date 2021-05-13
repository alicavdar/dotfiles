curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz --silent
tar xzvf nvim-macos.tar.gz
trash ~/nvim-osx64
mv nvim-osx64 ~/
trash nvim-macos.tar.gz
