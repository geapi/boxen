class people::geapi {
  
  include people::geapi::applications

  notify { 'class people::geapi declared': }

  ##################################
  ## Facter, Puppet, and Envpuppet##
  ##################################

  repository { "${::boxen_srcdir}/puppet":
    source => 'puppetlabs/puppet',
  }

  repository { "${::boxen_srcdir}/facter":
    source => 'puppetlabs/facter',
  }

  file { '/bin/envpuppet':
    ensure  => link,
    mode    => '0755',
    target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
    require => Repository["${::boxen_srcdir}/puppet"],
  }
  
  # Disable Gatekeeper so you can install any package you want
   property_list_key { 'Disable Gatekeeper':
     ensure => present,
     path   => '/var/db/SystemPolicy-prefs.plist',
     key    => 'enabled',
     value  => 'no',
   }

   $my_homedir = "/Users/${::luser}"

   # NOTE: Dock prefs only take effect when you restart the dock
   
   property_list_key { 'Hide the dock':
     ensure     => present,
     path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
     key        => 'autohide',
     value      => true,
     value_type => 'boolean',
     notify     => Exec['Restart the Dock'],
   }

   exec { 'Restart the Dock':
     command     => '/usr/bin/killall -HUP Dock',
     refreshonly => true,
   }

   file { 'Dock Plist':
     ensure  => file,
     require => [
                  Property_list_key['Hide the dock'],
                  Property_list_key['Align the Dock Center'],
                  Property_list_key['Lower Right Hotcorner - Screen Saver'],
                ],
     path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
     mode    => '0600',
     notify     => Exec['Restart the Dock'],
   }

}