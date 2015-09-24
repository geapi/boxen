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
  
  $my_homedir = "/Users/${::luser}"
  # My dotfile repository
  repository { "${my_homedir}/dotfiles":
    source => 'geapi/dotfiles',
  }

  file { "${my_homedir}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/bash/bash_profile.sh",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  file { "${my_homedir}/.aliases":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/bash/aliases",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  file { "${my_homedir}/.tm_properties":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/tm_properties",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  
 include people::geapi::menubarclock


  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  
  include osx::global::enable_keyboard_control_access # enables the keyboard for navigating controls in dialogs
  include osx::global::enable_standard_function_keys # enables the F1, F2, etc. keys to be treated as standard function keys
  include osx::global::expand_print_dialog # expand the print dialog by default
  include osx::global::expand_save_dialog # expand the save dialog by default
  include osx::global::disable_remote_control_ir_receiver # disable remote control infrared receiver
  include osx::global::disable_autocorrect # disables spelling autocorrection

  include osx::dock::autohide # automatically hide the dock
  include osx::dock::clear_dock # ensures the dock only contains apps that are running

  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely # enable Secure Empty Trash
  include osx::finder::unhide_library # unsets the hidden flag on ~/Library
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_warning_before_emptying_trash
  include osx::finder::show_warning_before_changing_an_extension
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  include osx::safari::enable_developer_mode
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::keyboard::capslock_to_control # remaps capslock to control on attached keyboards

  include osx::global::natural_mouse_scrolling

  class { 'osx::dock::icon_size':
    size => 24
  }

  class { 'osx::dock::position':
    position => 'center'
  }
}
