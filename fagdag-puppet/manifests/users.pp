class users {
  
	user { 'devops': 
	  ensure => 'present',
	  home => '/home/devops',
	  managehome => true,
	  shell => '/bin/bash',
	  password => '$1$a3tz7NNH$/m6XpNpZBwJtAlakqd5mU0'
	}
	
	file { "init.sh": 
	  path => '/home/devops/init.sh',
	  ensure => 'present',
	  source => '/etc/puppet/files/init.sh'
	}
}

