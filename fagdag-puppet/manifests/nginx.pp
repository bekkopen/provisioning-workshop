class nginx {

	package { 'nginx' :
    		ensure => 'latest'
	}

	file { 'nginx.conf' :
		path => '/etc/nginx/conf.d/devops.conf',
		ensure => file,
		source => '/etc/puppy/files/devops.conf'
	}

	service { 'nginx' :
		require => Package['nginx'],
		require => File['nginx.conf'],
		ensure  => running
	}
}
