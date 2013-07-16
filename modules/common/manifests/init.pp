class common {
	class { 'apt': }

	apt::ppa { 'ppa:graysky/utils': }

	apt::ppa { 'ppa:bumblebee/stable': }

	apt::source { 'ubuntu-partner':
		location   => 'http://archive.canonical.com/ubuntu',
		repos      => 'partner',
	}

	apt::source { 'spotify':
		location   => 'http://repository.spotify.com',
		release    => 'stable',
		repos      => 'non-free',
		key        => '94558F59',
		key_server => 'keyserver.ubuntu.com',
	}

	package {
		'acroread': ensure => present, require => Apt::Source['ubuntu-partner'];
		'bind9utils': ensure => present;
		'bumblebee': ensure => present, require => Apt::Ppa['ppa:bumblebee/stable'];
		'calibre': ensure => present;
		'chromium-browser': ensure => present;
		'eclipse-cdt': ensure => present;
		'eclipse-jdt': ensure => present;
		'ettercap-text-only': ensure => present;
		'firefox-locale-pl': ensure => present;
		'firefox': ensure => present;
		'flashplugin-installer': ensure => present;
		'gimp': ensure => present;
		'git': ensure => present;
		'gqview': ensure => present;
		'ipcalc': ensure => present;
		'ipython': ensure => present;
		'keepassx': ensure => present;
		'krdc': ensure => present;
		'ktorrent': ensure => present;
		'libjpeg62': ensure => present;
		'linux-headers-generic': ensure => present;
		'localepurge': ensure => present;
		'lsof': ensure => present;
		'mercurial': ensure => present;
		'mplayer': ensure => present;
		'netcat-traditional': ensure => present;
		'nmap': ensure => present;
		'okular': ensure => present;
		'p7zip': ensure => present;
		'profile-sync-daemon': ensure => present, require => Apt::Ppa['ppa:graysky/utils'];
		'puppet-lint': ensure => present;
		'python-virtualenv': ensure => present;
		'rar': ensure => present;
		'r-base': ensure => present;
		'redshift': ensure => present;
		'screen': ensure => present;
		'scrot': ensure => present;
		'skype': ensure => present, require => Apt::Source['ubuntu-partner'];
		'spotify-client': ensure  => present, require => Apt::Source['spotify'];
		'thunderbird': ensure => present;
		'traceroute': ensure => present;
		'vagrant': ensure => present;
		'vim-gtk': ensure => present;
		'vim-puppet': ensure => present;
		'vim': ensure => present;
		'virtualbox': ensure => present;
		'virtualgl': ensure => present, require => Apt::Ppa['ppa:bumblebee/stable'];
		'wine': ensure => present;
	}

	common::deb { 'rstudio':
		url     => 'http://download1.rstudio.org/rstudio-0.97.551-amd64.deb',
		require => Package['libjpeg62'],
	}

	# Disable unused services
	file {
		'/etc/init/bluetooth.override':
			ensure  => file,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			content => 'manual';
		'/etc/init/puppet.override':
			ensure  => file,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			content => 'manual';
		'/etc/init/saned.override':
			ensure  => file,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			content => 'manual';
	}

	file {
		"${dotfiles::home}/.kde/Autostart/redshift":
			ensure  => file,
			owner   => $dotfiles::user,
			group   => $dotfiles::user,
			mode    => '0755',
			content => "#!/bin/bash\nredshift -l 50.1:19.9 -m vidmode -g 0.8";
		"${dotfiles::home}/.mplayer":
			ensure   => directory,
			recurse  => true,
			owner    => $dotfiles::user,
			group    => $dotfiles::user,
			mode     => '0644',
			source   => 'puppet:///modules/common/.mplayer';
	}

	# TODO add kate
	$users = "${dotfiles::user}"
	$browsers = 'chromium firefox'
	file {
		'/etc/psd.conf':
			ensure  => file,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			content => template('common/psd.conf.erb');
	}
}
