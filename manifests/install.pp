#
class amqpbeat::install (
  $version      = $amqpbeat::version,
  $download_url = $amqpbeat::download_url,
) inherits amqpbeat::params {

  include 'archive'

  archive { "/opt/amqpbeat-${version}.tar.gz":
    ensure        => present,
    user          => 'root',
    group         => 'root',
    source        => $download_url,
    extract_path  => '/opt',
    extract_flags => '-x --no-same-owner -f',
    creates       => "/opt/kibana-${version}",
    extract       => true,
    cleanup       => true,
    notify        => Exec['chown_amqpbeat_directory'],
  }

  $symlink_require = Archive["/opt/amqpbeat-${version}.tar.gz"]

  exec { 'chown_amqpbeat_directory':
    command     => "chown -R root:root /opt/amqpbeat-${version}",
    path        => ['/bin','/sbin'],
    refreshonly => true,
    require     => $symlink_require,
  }

  file { '/opt/amqpbeat':
    ensure  => link,
    require => $symlink_require,
    target  => "/opt/amqpbeat-${version}",
    owner   => 'root',
    group   => 'root',
  }

}
