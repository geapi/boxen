#custom time format
class people::geapi::osx::menubarclock (
  $date_format = "EEE MMM d H.mm.ss"
) {
  include people::geapi::osx::systemuiserver
  boxen::osx_defaults { 'Set time format for menubar clock':
    user      => $::boxen_user,
    key       => 'DateFormat',
    domain    => 'com.apple.menuextra.clock',
    value     => $date_format,
    type      => 'string',
    notify => Exec['killall SystemUIServer'];
  }
  
  killall -KILL SystemUIServer
}