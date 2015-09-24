# Internal: Restart SystemUIServer when necessary.
class people::geapi::osx::systemuiserver {
  exec { 'killall SystemUIServer':
    refreshonly => true
  }
}