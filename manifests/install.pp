# == Class: subsonic::install
class subsonic::install() inherits subsonic::params {
  package { $subsonic::package_name:
    ensure  => present,
  }

  if ($subsonic::manage_user) {
    user { $subsonic::user:
      ensure => present,
      shell  => $subsonic::user_shell,
      system => true,
      home   => $subsonic::home,
    }
  }

  file { $subsonic::home:
    ensure  => directory,
    mode    => '0755',
    owner   => $subsonic::user,
    group   => $subsonic::user,
    require => User[$subsonic::user]
  }
}
