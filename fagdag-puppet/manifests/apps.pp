import 'users'

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

	service { 'devopsjavaapp' :
		require => [Package['java'], File['jar'], File['init.sh']],
		ensure => running
	}
}
