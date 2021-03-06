# == Resource: awstools::config_files
#
# This resource creates config files for s3cmd and boto in user's home directory.
# Multiple instances of this resource can be created to install config files for
# multiple users.
#
# === Parameters
#
# [user_name]
#   (optional) User to add AWS tools dotfiles for
#
# === Examples
#
#  class { 'aws_tools::config_files':
#    user_name => 'vagrant'
#  }
#
define aws_tools::config_files(
  $user_name = $name
) {
  validate_string($user_name)

  file { "/home/${user_name}/.s3cfg":
    content => template('aws_tools/s3cfg'),
    mode    => '0700',
    owner   => $user_name,
    group   => $user_name,
  }

  file { "/home/${user_name}/.boto":
    content => template('aws_tools/boto'),
    mode    => '0700',
    owner   => $user_name,
    group   => $user_name,
  }
}