# == Class: subsonic::params
class subsonic::params {
  $package_name                   = 'subsonic'
  $user                           = 'subsonic'
  $user_shell                     = '/bin/false'
  $manage_user                    = true
  $home                           = '/var/lib/subsonic'
  $host                           = '0.0.0.0'
  $port                           = 4040
  $https_port                     = 0
  $context_path                   = '/'
  $init_memory                    = 192
  $max_memory                     = 384
  $pidfile                        = undef
  $default_music_folder           = '/var/media/artists'
  $default_upload_folder          = '/var/media/incoming'
  $default_podcast_folder         = '/var/media/podcast'
  $default_playlist_import_folder = '/var/media/playlists/import'
  $default_playlist_export_folder = '/var/media/playlists/export'
  $default_playlist_backup_folder = '/var/media/playlists/backup'
  $default_timezone               = undef
}
