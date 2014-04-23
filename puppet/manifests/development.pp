class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}
include stdlib
include wget 
include ruby
include git
include nodejs
include bundler
include install-npm-packages
