# == Class: subsonic::params
class subsonic::params {
  $package_name = 'subsonic'
  $user         = 'subsonic'
  $user_shell   = '/bin/false'
  $user_home    = '/var/subsonic'
  $manage_user  = true
  $host         = '0.0.0.0'
  $port         = 4040
  $extra_opts   = ''
}
