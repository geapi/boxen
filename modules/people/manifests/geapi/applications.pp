class people::geapi::applications { 
  include textmate::textmate2::release 
  
  package { 
    'alfred': provider => 'brewcask' 
  }
}

