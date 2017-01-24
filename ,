convinient-dots
===============

Default configuration for unix work environment:

QuickInstall (probably not working atm)
---------------------------------------
```ruby
curl https://raw.githubusercontent.com/scusy/dotfiles/master/install.sh | sh
```

Install
-------

```ruby
# Install zsh
sudo apt-get install zsh
# Change shell to zsh
chsh -s /bin/zsh
# Install rbenv
curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
# Install ruby
rbenv install 2.1.4
rbenv global 2.1.4
# Install tmuxinator
gem install tmuxinator
#Install vim
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev mercurial libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

sudo mkdir /usr/include/lua5.1/include
sudo ln -s /usr/include/luajit-2.0 /usr/include/lua5.1/include
 
cd ~
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope 
make 

sudo make install

cd ..
sudo mkdir /usr/share/vim
sudo mkdir /usr/share/vim/vim74
sudo cp -fr runtime/* /usr/share/vim/vim74/
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install dots
git clone http://github.com/scusy/dotfiles ~/.dots
ln -s ~/.cdots/vim ~/.vim
ln -s ~/.cdots/vim/.vimrc ~/.vimrc
rm ~/.zshrc
ln -s ~/.cdots/.zshrc ~/.zshrc
ln -s ~/.cdots/tmux.conf ~/.tmux.conf
~/.cdots/base16-google.dark.sh
```

