node default {
	include dotfiles
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

}
node spectre inherits laptop {}

node vagrant inherits default {
	$default_user = 'vagrant'
	# TODO home_dir?
}
