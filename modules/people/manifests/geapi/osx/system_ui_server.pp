# Internal: Restart finder when necessary.
class people::geapi::osx::systemuiserver {
  exec { 'killall SystemUIServer':
    refreshonly => true
  }
}