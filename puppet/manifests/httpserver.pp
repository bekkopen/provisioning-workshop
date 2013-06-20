class httpserver {

	user {
		'devops' : 
			ensure => present,
			home => '/home/devops',
			password => '$1$kgEDeytZ$owi1vkUAE6FKDpGGuPRJ/.',
			shell => '/bin/bash',
	}

	user {
		'espenhh' : 
			ensure => present,
			home => '/home/espenhh',
			password => '$1$kgEDeytZ$owi1vkUAE6FKDpGGuPRJ/.',
			shell => '/bin/bash',
	}

	user {
		'arp' : 
			ensure => present,
			home => '/home/arp',
			password => '$1$kgEDeytZ$owi1vkUAE6FKDpGGuPRJ/.',
			shell => '/bin/bash',
	}

}
