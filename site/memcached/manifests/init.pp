class memcached {

file { '/etc/sysconfig/memcached' :
  ensure => 'present',
  owner => 'root',
  group => 'root',
  mode => '0755',
  source => 'puppet:///modules/memcached/memchached',
  require => Package['memcached'],
}

package { 'memchaced' :
 ensure => 'present',
}

service { 'memchached' :
  ensure => running,
  enable => true,
  subscribe => File['/etc/sysconfig/memcached'],
}

}
