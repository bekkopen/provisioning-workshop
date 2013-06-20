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

	package { 'java-1.7.0-openjdk.x86_64' :
		ensure => present,
	}

	file { '/home/devops/devops.jar':
	  ensure => present,
	  source => 'puppet:///modules/devops/devops.jar',
	  owner  => devops,
	  group => devops,
	}

	file { '/home/devops/devops':
	  ensure => present,
	  source => 'puppet:///modules/devops/devops',
	  owner  => devops,
	  group => devops,
	  mode => 777,
	}


}
