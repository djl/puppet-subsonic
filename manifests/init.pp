# == Class: sadsonic
#
# Install Subsonic
#
# === Parameters
#
# [*package_name*]
#   The Subsonic package name
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
# [*home*]
#   The Subsonic data directory. Will also be used for the Subsonic
#   user home directory
#
# [*host*]
#   The address Subsonic should listening on
#
# [*port*]
#   The port number Subsonic should be running on
#
# [*https_port*]
#   The port number Subsonic should be running on for HTTPS
#   connections
#
# [*context_path*]
#   The URL path for subsonic (e.g. / or /subsonic)
#
# [*init_memory*]
#   The initial memory size
#
# [*max_memory*]
#   The memory limit
#
# [*pidfile*]
#   Subsonic's pidfile
#
# [*default_music_folder*]
#   The default music folder
#
# [*default_upload_folder*]
#   The default upload folder
#
# [*default_podcast_folder*]
#   The default podcast folder
#
# [*default_playlist_import_folder*]
#   The default playlist import folder
#
# [*default_playlist_export_folder*]
#   The default playlist export folder
#
# [*default_playlist_backup_folder*]
#   The default playlist export folder
#
# [*default_timezone*]
#   The default timezone
#
# === Examples
#
#  class { 'subsonic':
#    user => 'jim',
#  }
#
#
class subsonic (
  $user                           = $subsonic::params::user,
  $user_shell                     = $subsonic::params::user_shell,
  $manage_user                    = $subsonic::params::manage_user,
  $home                           = $subsonic::params::home,
  $host                           = $subsonic::params::host,
  $port                           = $subsonic::params::port,
  $https_port                     = $subsonic::params::https_port,
  $context_path                   = $subsonic::params::context_path,
  $init_memory                    = $subsonic::params::init_memory,
  $max_memory                     = $subsonic::params::max_memory,
  $pidfile                        = $subsonic::params::pidfile,
  $default_music_folder           = $subsonic::params::default_music_folder,
  $default_upload_folder          = $subsonic::params::default_upload_folder,
  $default_podcast_folder         = $subsonic::params::default_podcast_folder,
  $default_playlist_import_folder = $subsonic::params::default_playlist_import_folder,
  $default_playlist_export_folder = $subsonic::params::default_playlist_export_folder,
  $default_playlist_backup_folder = $subsonic::params::default_playlist_backup_folder,
  $default_timezone               = $subsonic::params::default_timezone,
) inherits subsonic::params {

  validate_bool($manage_user)
  validate_integer($port)

  class { 'subsonic::install': } ->
  class { 'subsonic::config': } ~>
  class { 'subsonic::service': } ->
  Class['subsonic']
}
