#
class amqpbeat (
  $version        = '0.0.1',
  $download_url   = 'https://github.com/robinpercy/amqpbeat'
  $logging_opts   = undef,
  $amqp_opts      = undef,
  $es_opts        = undef,
) inherits amqpbeat::params {

  contain amqpbeat::install
  contain amqpbeat::service

}
