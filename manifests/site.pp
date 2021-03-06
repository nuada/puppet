node default {
	class { 'dotfiles':
		user => $default_user,
		home => $default_user_home,
		fullname => $default_user_fullname,
		email => $default_user_email,
	}
}

node laptop inherits default {
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

	apt::ppa { 'ppa:tuxpoldo/btsync': }
	package {
		'btsync': ensure => present, require => Apt::Ppa['ppa:tuxpoldo/btsync'];
	}
}

node spectre inherits laptop {}
