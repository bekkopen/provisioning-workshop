class httpserver {

	user {
		'devops' : 
			ensure => present,
			home => '/home/devops',
			password => sha1('devops123'),
			shell => '/bin/bash',
	}

	user {
		'espenhh' : 
			ensure => present,
			home => '/home/espenhh',
			password => sha1('devops123'),
			shell => '/bin/bash',
	}

	user {
		'arp' : 
			ensure => present,
			home => '/home/arp',
			password => sha1('devops123'),
			shell => '/bin/bash',
	}

}
