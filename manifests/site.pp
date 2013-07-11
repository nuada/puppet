node default {
	include dotfiles
}

node laptop inherits default {
	include ssd
	include common
}

node mobile inherits laptop {
	# TODO brightness
}
node spectre inherits laptop {}

node vagrant inherits default {
	$default_user = 'vagrant'
	# TODO home_dir?
}
