# == Class: awstools
#
# Install AWS tools including: s3cmd, awscli, boto.
# Optionally the package will also create config files for s3cmd and boto in user's home directory
#
# === Parameters
#
# [user_name]
#   (optional) User to add AWS tools dotfiles for
#
# === Examples
#
#  class { 'aws_tools': }
#
class aws_tools(
  $user_name = ''
) {
  require python_pip

  validate_string($user_name)

  package { 's3cmd':
    ensure => present,
  }

  package { ['awscli','boto']:
    ensure   => present,
    provider => 'pip'
  }

  if ! empty($user_name) {
    aws_tools::config_files { $user_name: }
  }
}