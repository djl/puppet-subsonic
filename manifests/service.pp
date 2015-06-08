# == Class: subsonic::service
class subsonic::service {
  if $::osfamily =~ /^Debian|RedHat/ {
    service { 'subsonic':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
