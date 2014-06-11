#!/bin/sh
VAGDIR=/vagrant
NVMDIR=$VAGDIR/.nvm
NVMSRC=$NVMDIR/nvm.sh
# Pull NVM repo
if [ ! -d $NVMDIR ]; then
    echo "Installing NVM"
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh
    # Add NVM home to .bachrc then enter NVM
    source ~/.bashrc
fi
# Install node using .nvmrc file for version
nvm install
nvm use



