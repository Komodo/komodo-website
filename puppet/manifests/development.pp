class install-npm-packages{
  $npmPackages = ['bower']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    require => Class['nodejs'],
  }
}

#class npm-install{
#  exec{ "npm install":
#    cwd => "/vagrant",
#    path => 
#  }
#}
#
#class bower-install{
#  exec{ "bower install":
#    cwd => "/vagrant",
#  }
#}
include git
include nodejs
include install-npm-packages
#include npm-install
#include bower-install
