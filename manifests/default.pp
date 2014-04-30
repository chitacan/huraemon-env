include apt

exec { 'update':
  path    => '/usr/bin',
  command => 'apt-get update'
}

Exec['update'] ->
apt::ppa { 'ppa:chris-lea/node.js': } ->
package {
  [
    'make',
    'nodejs',
    'git-core'
  ]:
    ensure => 'installed';
}
