#!/bin/sh
VAGDIR=/vagrant
NVMDIR=$VAGDIR/.nvm
NVMSRC=$NVMDIR/nvm.sh
# Pull NVM repo
if [ ! -d $NVMDIR ]; then
    echo "Pulling NVM"
    git clone https://github.com/creationix/nvm.git $NVMDIR
    # Add NVM home to .bachrc then enter NVM
    echo "Adding .nvm to 'source'"
    
    echo "source "$NVMSRC >> ~/.bashrc && source $NVMSRC
fi
# Install node using .nvmrc file for version
nvm install
nvm use



