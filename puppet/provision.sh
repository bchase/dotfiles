# apt-get update &&
#   apt-get upgrade -y &&
#   apt-get dist-upgrade -y &&

apt-get install -y puppet &&

  puppet module install puppetlabs-vcsrepo &&
  puppet module install maestrodev/rvm &&
  puppet module install garethr-heroku &&
  puppet module install puppet-nodejs &&
  puppet module install puppetlabs-postgresql &&
  puppet module install jamesnetherton/google_chrome &&

  puppet apply manifest.pp
