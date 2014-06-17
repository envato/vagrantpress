#Install wp-cli

class wp_cli {

  $package_filename = 'php-wpcli_0.15.0ubuntu1_all.deb'
  $package_path = "/tmp/${package_filename}"
  $package_url = "https://github.com/wp-cli/builds/raw/gh-pages/deb/${package_filename}"

  exec { 'download package':
    command => "/usr/bin/wget ${package_url} -O ${package_path}",
    creates => $package_path,
  }

  package { 'install package':
    ensure   => installed,
    provider => dpkg,
    require  => Exec['download package'],
    source   => $package_path,
  }

}
