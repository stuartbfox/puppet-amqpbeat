#
class amqpbeat::params (
) {

  $service_ensure = 'running',

  case $::operatingsystem {
    'CentOS': {
      if $::operatingsystemmajrelease == 6 {
        $init_file     = 'puppet:///modules/amqpbeat/centos/6/amqpbeat'
        $init_name     => 'amqpbeat',
        $init_location = '/etc/init.d'
      } elsif if $::operatingsystemmajrelease == 7 {
        $init_file     = 'puppet:///modules/amqpbeat/centos/6/amqpbeat.service'
        $init_name     => 'amqpbeat.service',
        $init_location = '/usr/lib/systemd/system'
      }
    }
    'Ubuntu': {
      $init_file     = 'puppet:///modules/amqpbeat/ubuntu/amqpbeat'
      $init_name     => 'amqpbeat',
      $init_location = '/etc/init.d'
    }
    default: {
      fail('Operating system not supported')
    }
  }

}
