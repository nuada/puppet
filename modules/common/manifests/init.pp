# TODO
#  * app-text/acroread
#  * media-sound/spotify
#  * net-im/skype
#  * www-misc/profile-sync-daemon add-apt-repository ppa:graysky/utils
#  * add-apt-repository ppa:bumblebee/stable
#  * apt-get install bumblebee virtualgl linux-headers-generic

class common {
	package {
		'bind9utils': ensure => present;
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
		'gvim': ensure => present;
		'ipcalc': ensure => present;
		'ipython': ensure => present;
		'keepassx': ensure => present;
		'krdc': ensure => present;
		'ktorrent': ensure => present;
		'localepurge': ensure => present;
		'lsof': ensure => present;
		'mercurial': ensure => present;
		'mplayer': ensure => present;
		'netcat-traditional': ensure => present;
		'nmap': ensure => present;
		'okular': ensure => present;
		'p7zip': ensure => present;
		'puppet-lint': ensure => present;
		'python-virtualenv': ensure => present;
		'rar': ensure => present;
		'r-base': ensure => present;
		'redshift': ensure => present;
		'rstudio': ensure => present;
		'screen': ensure => present;
		'scrot': ensure => present;
		'thunderbird': ensure => present;
		'traceroute': ensure => present;
		'vagrant': ensure => present;
		'vim-puppet': ensure => present;
		'vim': ensure => present;
		'virtualbox': ensure => present;
		'wine': ensure => present;
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
		"${dotfiles::home_dir}/.mplayer":
			ensure   => directory,
			recurse  => true,
			owner    => $dotfiles::default_user,
			group    => $dotfiles::default_user,
			mode     => '0644',
			source   => 'puppet:///modules/common/.mplayer';
	}
}
