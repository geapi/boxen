class people::geapi::applications {
  include textmate::textmate2::release
  include iterm2::stable
  include flux
  include onepassword
  include chrome
  include divvy
  include googledrive
  include evernote
  include dropbox
  include vlc
  include calibre
  include atom
  include firefox
  include omnigraffle::pro
  include screenhero

  package {
    'alfred': provider => 'brewcask'
  }

  class { 'intellij':
    edition => 'ultimate',
    version => '14.1.4'
}
}
