#Install MySQL

class mysql {

  $password = 'vagrant'

  package { [
    'mysql-client',
    'mysql-server',
  ]:
    ensure => installed,
  }

  exec { 'Set MySQL server\'s root password':
    require     => [
      Package['mysql-server'],
      Package['mysql-client'],
      ],
    refreshonly => true,
    unless      => "mysqladmin -uroot -p${password} status",
    path        => '/bin:/usr/bin',
    command     => "mysqladmin -uroot password ${password}",
  }
}
