apt-get update
apt-get install -y build-essential git ruby1.9.3 rubygems1.9.1 nodejs vim
update-alternatives --set ruby /usr/bin/ruby1.9.1
update-alternatives --set gem /usr/bin/gem1.9.1
apt-get -y autoremove

gem install bundler

cd /vagrant
bundle install
