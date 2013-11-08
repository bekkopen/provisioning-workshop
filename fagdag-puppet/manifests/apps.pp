class apps {
	
	package { 'java' :
		ensure => 'latest',
		name => 'openjdk-6-jre',
	}

	file { 'jar' :
		path => '/home/devops/devops.jar',
		ensure => present,
		source => '/etc/puppet/files/devops.jar'
	}

	exec { 'devops.jar' :
		require => [Package['java'], File['jar']],
		path => '/home/devops/',
		command => 'java -jar devops.jar',
	}
}
