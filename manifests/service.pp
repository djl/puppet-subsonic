# == Class: subsonic::service
class subsonic::service {
  service { 'subsonic':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
