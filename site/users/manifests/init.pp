class users { 
exec { 'this will output stuff':  path      => '/bin',  command   => 'echo Hello World!',  logoutput => true,}
}
