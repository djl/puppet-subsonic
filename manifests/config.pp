# == Class: subsonic::config
class subsonic::config {
  case $::osfamily {
    'Debian': { $default_file = '/etc/default/subsonic' }
    default: { fail("Unsupported OS: ${::osfamily}") }
  }

  file { $default_file:
    ensure  => present,
    content => template('subsonic/config.erb'),
    mode    => '0644',
  }
}
