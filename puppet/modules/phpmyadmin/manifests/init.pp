# Install phpMyAdmin

class phpmyadmin {

  include apache2

  package { 'phpmyadmin':
    ensure => present,
  }

  file { '/etc/apache2/sites-enabled/001-phpmyadmin':
    ensure => link,
    target => '/etc/phpmyadmin/apache.conf',
    notify => Service['apache2'],
  }

}
