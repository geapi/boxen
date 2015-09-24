#custom time format
class people::geapi::menubarclock (
  $date_format = "EEE MMM d H.mm.ss"
) {
  boxen::osx_defaults { 'Set time format for menubar clock':
    user      => $::boxen_user,
    key       => 'DateFormat',
    domain    => 'com.apple.menuextra.clock',
    value     => $date_format,
    type      => 'string',
  }
}