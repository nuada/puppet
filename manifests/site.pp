node laptop {
	include dotfiles
	include ssd
	include common
}

node mobile inherits laptop {
	file {
		'/usr/bin/brightness':
			ensure => file,
			owner  => 'root',
			group  => 'root',
			mode   => '0755',
			source => 'puppet:///modules/mobile/brightness';
		'/etc/rc.local':
			ensure => file,
			owner  => 'root',
			group  => 'root',
			mode   => '0755',
			source => 'puppet:///modules/mobile/rc.local';
	}

	apt::ppa { 'ppa:bumblebee/stable': }
	package {
		'bumblebee': ensure => present, require => Apt::Ppa['ppa:bumblebee/stable'];
		'linux-headers-generic': ensure => present;
		'virtualgl': ensure => present, require => Apt::Ppa['ppa:bumblebee/stable'];
	}

}
node spectre inherits laptop {}

node /^vagrant/ {
	class { 'dotfiles': 
		user => 'vagrant',
	}
}
