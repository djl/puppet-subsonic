# == Class: subsonic::install
class subsonic::install() inherits subsonic::params {
  # wouldn't it be nice if Subsonic included its dependencies?
  case $::osfamily {
    'Debian': {
      $java = 'openjdk-7-jre'
    }
    'RedHat': {
      $java = 'java-1.7.0-openjdk'
    }
  }

  package { $java:
    ensure => present,
  }

  package { $subsonic::package_name:
    ensure  => present,
    require => [ Package[$java], ]
  }

  if ($subsonic::manage_user) {
    user { $subsonic::user:
      ensure => present,
      shell  => $subsonic::user_shell,
      system => true,
      home   => $subsonic::user_home,
    }
  }

  file { $subsonic::user_home:
    ensure  => directory,
    mode    => '0755',
    owner   => $subsonic::user,
    group   => $subsonic::user,
    require => User[$subsonic::user]
  }
}
