class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}
# needed stdlib as the NodeJS module won't work without it.
include git
include nodejs
include install-npm-packages
