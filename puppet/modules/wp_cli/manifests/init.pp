#Install wp-cli

class wp_cli {

  $package_filename = 'php-wpcli_0.15.0_all.deb'
  $package_path = "/tmp/${package_filename}"
  $package_url = "https://github.com/wp-cli/builds/raw/gh-pages/deb/${package_filename}"

  exec { 'download package':
    command => "/usr/bin/wget ${package_url} -O ${package_path}",
    creates => $package_path,
  }

  package { 'wp_cli':
    ensure   => installed,
    provider => dpkg,
    require  => Exec['wp_cli_source'],
    source   => $package_path,
  }

}
