class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}
include git
include nodejs
include install-npm-packages
