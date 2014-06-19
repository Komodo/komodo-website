class install_npm_packages{
  $npm_packages = ['docpad', 'bower', 'grunt']
  package{ $npm_packages:
    ensure => 'installed',
    provider => 'npm',
    before => Class['ko_bower_install'],
    require => Class['nodejs'],
  }
}

$nodepath = ["/usr/local/node/node-default/bin", "/usr/local/sbin", "/usr/local/bin",
"/usr/sbin", "/usr/bin", "/sbin", "/bin", "/usr/games", "/opt/vagrant_ruby/bin"]

class ko_npm_install{
  exec{ "npm install": #try this and see if all docpad will install
                        #otherwise, remove it from install_npm_packages
                        # and then must do symlink to /usr/local/node/...
    creates => "/vagrant/node_modules",
    cwd => "/vagrant",
    path => $nodepath,
    require => Class['nodejs'],
  }
}

class ko_bower_install{
  exec{ "yes | bower install 2> help.log":  # this does absolutely NOTHING
    creates => "/vagrant/src/public/vendor",
    cwd => "/vagrant",
    path => $nodepath,
    require => Class["install_npm_packages"],
    user => "vagrant"
  }
}

include git
include nodejs
include install_npm_packages
include ko_npm_install
#include ko_bower_install #At this point, this does nothing at all.
