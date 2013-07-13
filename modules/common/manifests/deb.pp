define common::deb ($url, $package = $title) {
	exec { "install-$package-deb":
		command => "wget '$url' -qO /tmp/$package && dpkg -i /tmp/$package; rm /tmp/$package",
		unless  => "dpkg -l $package 2> /dev/null",
		path => ['/bin', '/usr/bin']
	}
}
