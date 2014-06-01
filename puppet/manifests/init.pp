exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

include git
include subversion
include apache2
include php5
class { 'mysql::install': }
class { 'wordpress::install': }
include phpmyadmin
include phpqa
include envato_wordpress_toolkit
