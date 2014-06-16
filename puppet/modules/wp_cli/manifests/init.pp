#Install wp-cli

class wp_cli {

  exec { "wp_cli_source":
    command => "/usr/bin/wget https://github.com/wp-cli/builds/blob/gh-pages/deb/php-wpcli_0.15.0_all.deb",
    cwd => "/tmp/",
    creates => "/tmp/php-wpcli_0.15.0_all.deb",
    before => Package['wp_cli']
  }

  package { 'wp_cli':
    require  => File['/tmp/php-wpcli_0.15.0_all.deb'],
    provider => dpkg,
    ensure => installed,
    source => "/tmp/php-wpcli_0.15.0_all.deb"
  }

}