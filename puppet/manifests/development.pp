class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}

class install-apt-packages{
  $packages = ['curl', 'build-essential', 'libssl-dev']
  package{ $packages:
    ensure => 'installed',
  }
}
include git
include nodejs
include install-npm-packages

#include make
#include install-apt-packages
