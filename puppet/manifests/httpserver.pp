class httpserver {

	user {
		'devops' : 
			ensure => present,
			home => '/home/devops',
			password => sha1('devops123'),
			shell => '/bin/bash',
	}

}
