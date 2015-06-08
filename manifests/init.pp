# == Class: subsonic
#
# Install Subsonic
#
# === Parameters
#
# [*user*]
#   The user Subsonic should run as
#
# [*user_shell*]
#   The Subsonic user's shell
#
# [*manage_user*]
#   Should Puppet manage the user resource
#
# [*user_home*]
#   The home directory for the Subsonic user
#
# [*host*]
#   The address Subsonic should listening on
#
# [*port*]
#   The port number Subsonic should be running on
#
# [*extra_opts*]
#   Any extra options to be passed to the Subsonic daemon
#
# === Examples
#
#  class { 'subsonic':
#    user => 'jim',
#  }
#
#
class subsonic (
  $user        = $subsonic::params::user,
  $user_shell  = $subsonic::params::user_shell,
  $user_home   = $subsonic::params::user_home,
  $manage_user = $subsonic::params::manage_user,
  $host        = $subsonic::params::host,
  $port        = $subsonic::params::port,
  $extra_opts  = $subsonic::params::extra_opts,
) inherits subsonic::params {

  validate_bool($manage_user)
  validate_integer($port)

  class { 'subsonic::install': } ->
  class { 'subsonic::config': } ~>
  class { 'subsonic::service': } ->
  Class['subsonic']
}
