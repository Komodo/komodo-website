class install-npm-packages{
  $npmPackages = ['docpad', 'bower', 'grunt']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}
# needed stdlib as the NodeJS module won't work without it.
include ruby
include git
include nodejs
include bundler
include install-npm-packages
