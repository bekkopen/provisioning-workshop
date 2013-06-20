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

	file { '/etc/init.d/devops':
	  ensure => present,
	  source => 'puppet:///modules/devops/devops',
	  owner  => devops,
	  group => devops,
	  mode => 777
	}

	exec { 
		'/etc/init.d/devops start':
	}

	file { '/etc/yum.repos.d/nginx.repo':
	  ensure => present,
	  content => '[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/6/$basearch/
gpgcheck=0
enabled=1',
	notify => Package[nginx],
	}

	package { 'nginx' :
		ensure => present,
		notify => Service[nginx],
	}

	file { '/etc/nginx/conf.d/devops.conf':
	  ensure => present,
	  source => 'puppet:///modules/devops/devops.conf',
	  notify => Service[nginx],
	}

	file { '/etc/nginx/conf.d/default.conf':
	  ensure => absent,
	  notify => Service[nginx],
	}

	service { 'nginx' :
		ensure => running,

	}

}
