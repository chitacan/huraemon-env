include apt

exec { 'update':
  path    => '/usr/bin',
  command => 'apt-get update'
}

Exec['update'] ->
apt::ppa { 'ppa:chris-lea/node.js': } ->
class { 'nodejs': } ->
package {
  [
    'make',
    'g++',
    'git-core'
  ]:
    ensure => 'installed';
} ->
package { 'grunt-cli':
  ensure   => '0.1.9',
  provider => 'npm'
} ->
package { 'node-gyp':
  ensure   => '0.10.10',
  provider => 'npm'
} ->
class { 'timezone':
  timezone => 'Asia/Seoul'
}
