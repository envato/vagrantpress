exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

class { 'git::install': }
class { 'subversion::install': }
include apache2
class { 'php5::install': }
class { 'mysql::install': }
class { 'wordpress::install': }
class { 'phpmyadmin::install': }
include phpqa
include envato_wordpress_toolkit
