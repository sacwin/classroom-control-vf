class nginx {
 
  file { "/var/www":
    ensure => 'directory',
    owner => 'root',
    group => 'root',
    mode => '0755',
    require => Package['nginx'],
  }

  file { "/etc/nginx/nginx.conf":
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => "puppet:///modules/nginx/nginx.conf",
    require => Package['nginx'],
  }
  
  file { "/etc/nginx/conf.d/default.conf":
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => "puppet:///modules/nginx/default.conf",
    require => Package['nginx'],
  }


  package { 'nginx' :
   ensure => 'present',
  }
  
  service { 'nginx' :
    ensure => running,
    enable => true,
    subscribe => File['/etc/nginx/nginx.conf'],
  }

}
