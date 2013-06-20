class httpserver {

	user {
		'devops' : 
			ensure => present,
			home => '/home/devops',
			password => '$1$kgEDeytZ$owi1vkUAE6FKDpGGuPRJ/.',
			shell => '/bin/bash',
	}

	file { '/home/devops':
	  ensure => directory,
	  owner  => devops,
	  group => devops,
	}



}
