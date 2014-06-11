class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}

class install-apt-packages{
  $packages = ['curl']
  package{ $packages:
    ensure => 'installed',
  }
}
include git
include make
include install-apt-packages
#include nodejs
#include install-npm-packages
