class dotfiles {
	$user = 'nuada'
	$home = "/home/$user"

	notice("Setting dotfiles for: $user in: ${home}")
	file {
		"${home}/.bash_aliases":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_aliases';
		"${home}/.bash_logout":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_logout';
		"${home}/.bash_profile":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bash_profile';
		"${home}/.bashrc":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.bashrc';
		"${home}/.hgrc":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.hgrc';
		"${home}/.vimrc":
			ensure  => file,
			owner   => $user,
			group   => $user,
			mode    => '0644',
			source  => 'puppet:///modules/dotfiles/.vimrc';
	}
}
