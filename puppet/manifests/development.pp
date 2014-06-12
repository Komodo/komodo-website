class install-npm-packages{
  $npmPackages = ['bower']
  package{ $npmPackages:
    ensure => 'installed',
    provider => 'npm',
    before => Class['ko-bower-install'],
    require => Class['nodejs']
  }
}

$nodepath = ["/usr/local/node/node-default/bin/", "/usr/local/bin"]

class ko-npm-install{
  exec{ "npm install":
    command => "npm install",
    creates => "/vagrant/node_modules",
    cwd => "/vagrant",
    path => $nodepath,
    require => Class['nodejs']
  }
}

class ko-bower-install{
  exec{ "bower install":
    command => "bower install",
    creates => "/vagrant",
    cwd => "/vagrant",
    path => $nodepath,
    require => Class["install-npm-packages"]
  }
}
include git
include nodejs
include install-npm-packages
include ko-npm-install
include ko-bower-install
