class apps {
	
	package { 'java' :
		ensure => 'latest',
		name => 'openjdk-6-jre',
	}

	file { 'devops.jar' :
		ensure => present,
		source => '/etc/puppet/files/devops.jar'
	}

	exec { 'devops.jar' :
		require => [Package['java'], File['devops.jar']],
		command => 'java -jar /home/devops/devops.jar',
	}
}
