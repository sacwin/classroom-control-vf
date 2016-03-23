class nginx {

 File {
  owner => 'root',
  group => 'root',
  mode => '0755',
 }
 
 file { "/var/www":
  ensure => 'directory',
  require => Package['nginx'],
 }

 file { "/etc/nginx/nginx.conf":
  ensure => 'file',
  source => "puppet:///modules/nginx/nginx.conf",
  require => Package['nginx'],
 }
  
 file { "/etc/nginx/conf.d/default.conf":
  ensure => 'file',
  source => "puppet:///modules/nginx/default.conf",
  require => Package['nginx'],
 }
  
 file { "/var/www/index.html":
  ensure => 'file',
  source => "puppet:///modules/nginx/index.html",
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
