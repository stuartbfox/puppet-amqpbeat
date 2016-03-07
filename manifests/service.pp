#
class amqpbeat::service (
  $amqp_opts      = $amqpbeat::params::amqp_opts,
  $es_opts        = $amqpbeat::params::es_opts,
  $init_file      = $amqpbeat::params::init_file,
  $init_name      = $amqpbeat::params::init_name,
  $init_location  = $amqpbeat::params::init_location,
  $logging_opts   = $amqpbeat::params::logging_opts,
  $service_ensure = $amqpbeat::params::service_ensure,
) inherits amqpbeat::params {

  if !($service_ensure in [ 'running', 'stopped' ]) {
    fail('ensure parameter must be running or stopped')
  }

  File {
    ensure => present,
    mode   => '0640',
    owner  => 'root',
    group  => 'root',
  }

  file { "${init_location}/${init_name}":
    source => $init_file,
    notify => Service['amqpbeat'],
  }

  file { '/etc/amqpbeat':
    ensure => directory,
    mode   => '0755'
  }

  file { '/etc/amqpbeat/amqpbeat.yml':
    content      => template('amqpbeat/amqpbeat.yml.erb'),
    notify       => Service['amqpbeat'],
    amqp_opts    => $amqp_opts,
    es_opts      => $es_opts,
    logging_opts => $logging_opts,
  }

  service { 'amqpbeat':
    ensure    => $service_ensure,
    hasstatus => true,
    require   => File['/etc/amqpbeat/amqpbeat.yml'],
  }

}
