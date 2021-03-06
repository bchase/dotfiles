Package { ensure => installed }

$dev_packages = [
  'git',
  'vim',
  'curl',
  'zsh',
  'rake',
  'lynx',
  'tree',
  'build-essential',
  'libcurl4-gnutls-dev',
  'libxslt1-dev',
  'libyaml-dev',
  'sqlite3',
  'libsqlite3-dev',
  'postgresql',
  'libpq-dev',
  'pgadmin3',
  'postgresql-contrib',
  'redis-server',
  'libmagickwand-dev',
  'libav-tools',
  'libsox-fmt-mp3',
  'pcregrep',
  'ack-grep',
  'xclip',
  'eog',
  'gnome-open',
  'ffmpeg',
]

$lang_packages = [
  'elixir',
]

$other_packages = [
  'language-pack-ja',
  'language-pack-gnome-ja',
  'language-pack-ja-base',
  'language-pack-gnome-ja-base',
  'mplayer',
  'gjiten',
  'gparted',
  'unetbootin',
  'audacity',
  'winff',
  'skype',
  'powertop',
  # ttf-takao
  # ttf-unfonts-core
  # libavcodec-extra-53
]

package { $dev_packages: }
package { $lang_packages: }
package { $other_packages: }

# package { 'rake': notify => Exec['rake-install-dotfiles'] }

# # puppet module install puppetlabs-vcsrepo
# vcsrepo { '/home/bosco/.dotfiles':
#   require  => Package['git'],
#   ensure   => present,
#   user     => 'bosco',
#   provider => 'git',
#   remote   => 'origin',
#   source   => {
#     'origin' => 'https://github.com/bchase/dotfiles.git'
#   },
#   notify   => [
#     Exec['rake-install-dotfiles'],
#     Exec['load-dconf-settings'],
#   ],
# }
exec { 'rake-install-dotfiles':
  # require     => Package['rake'],
  # refreshonly => true,
  path        => '/usr/bin/:/usr/local/bin/',
  cwd         => '/home/bosco/.dotfiles/',
  command     => 'sudo -u bosco rake install <.yeses',
}

# maestrodev/rvm
class { '::rvm': }

rvm::system_user { bosco: }

$ruby_ver = 'ruby-2.3.0'

rvm_system_ruby { $ruby_ver:
  ensure      => 'present',
  default_use => true,
}

Rvm_gem {
  ensure       => latest,
  ruby_version => $ruby_ver,
  require      => Rvm_system_ruby[$ruby_ver],
}

$gems = [ 'rails', 'pry', 'gist' ]
rvm_gem { $gems: }

# garethr-heroku
include 'heroku'

# puppet-nodejs
class { '::nodejs':
  manage_package_repo       => false,
  nodejs_dev_package_ensure => 'present',
  npm_package_ensure        => 'present',
  legacy_debian_symlinks    => true,
}

package { 'phantomjs':
  name     => 'phantomjs',
  ensure   => 'present',
  provider => 'npm',
}

# puppetlabs-postgresql
class { 'postgresql::server': }

postgresql::server::role { 'bosco':
  superuser => true,
  login     => true,
  password_hash => postgresql_password('bosco', '')
}

# jamesnetherton/google_chrome
include 'google_chrome'

package { 'scim-anthy':
  notify => Exec['set-input-method-to-scim'],
}

exec { 'set-input-method-to-scim':
  require     => Package['scim-anthy'],
  command     => 'sudo -u bosco im-config -n scim',
  path        => '/usr/bin/:/bin/',
}

exec { 'load-dconf-settings':
  path        => '/bin/:/usr/bin/',
  cwd         => '/home/bosco/.dotfiles/',
  command     => 'cat linux/mate/dconf-root-dump | sudo -u bosco dconf load /',
}

exec { 'set-up-scim':
  path        => '/bin/:/usr/bin/',
  # cwd         => '/home/bosco/.dotfiles/',
  command     => 'tar -xvf /home/bosco/.dotfiles/linux/scim.tar -C /home/bosco/',
}


# ### Puppetfile ### (for `librarian-puppet`)
# !/usr/bin/env ruby
#
# forge "https://forgeapi.puppetlabs.com"
#
# # # use dependencies defined in metadata.json
# # metadata
#
# # # use dependencies defined in Modulefile
# # modulefile
#
# mod 'puppetlabs-vcsrepo'
# mod 'maestrodev/rvm'
# mod 'garethr-heroku'
# mod 'puppet-nodejs'
# mod 'puppetlabs-postgresql'
# mod 'jamesnetherton/google_chrome'


# refactor
#   [ ] use $USER ... /home/bosco/ -> $USER_HOME && bosco -> $USER
# after...
#   [ ] chrome default browser + login
#   [ ] $ gist --login
#   [ ] ssh key (github / heroku / aws)
# issues
#   [ ] dconf dumps wrecks window theme on ubuntu mate
#   [ ] `mate-terminal` still requires profile config for zsh despite dconf
#   [ ] auto xmodmap CAPS
#   [ ] `gem` requires `sudo`... (rvm module)
#   [ ] update / upgrade / dist-upgrade
#   [ ] using librarian-puppet for modules, puppet's ruby 2.1 error?
