class dotfiles {
	$default_user = 'nuada'
	$home_dir = "/home/$default_user"

	notice("Setting dotfiles for: $default_user in: ${home_dir}")
	file {
		"${home_dir}/.bash_aliases":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_aliases';
		"${home_dir}/.bash_logout":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_logout';
		"${home_dir}/.bash_profile":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_profile';
		"${home_dir}/.bashrc":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bashrc';
		"${home_dir}/.hgrc":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.hgrc';
		"${home_dir}/.vimrc":
			ensure  => file,
			owner   => $default_user,
			group   => $default_user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.vimrc';
	}
}
