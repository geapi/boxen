class people::geapi::applications {
  include textmate::textmate2::release
  include iterm2::stable
  include flux
  include onepassword
  include chrome
  include evernote
  include vlc
  include calibre
  include atom
  include firefox
  include omnigraffle::pro
  include screenhero

  package {
    'alfred': provider => 'brewcask'
    'bartender': provider => 'brewcask'
  }
  
  package { 'utorrent':
      ensure   => 'installed',
      provider => 'appdmg',
      source   => 'http://download-new.utorrent.com/endpoint/utmac/os/osx/track/stable/'
    }

  class { 'intellij':
    edition => 'ultimate',
    version => '2016.3.2'
  }
}
