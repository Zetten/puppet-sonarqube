# Class: sonarqube
# ===========================
#
# Documentation in README.md
#
# Parameters
# ----------
#
# * `manage_install`
# True if this module should install SonarQube, or false if it should manage
# an existing installation.
#   Default: true
#
# * `version`
# The SonarQube version to be installed. The default is the latest LTS
# release. Only used if `manage_install` is true.
#   Default: '5.6'
#
# * `sonar_home`
# The path to the SonarQube base directory. Note that if installed by this
# module, SonarQube will be installed in a version-specific directory in /opt,
# and this will be a symlink to that directory.
#   Default: '/opt/sonarqube'
#
# * `manage_user`
# True if this module should install and manage a SonarQube user and group.
#   Default: true
#
# * `user`
# The name of the SonarQube user. The user may or may not be managed by this
# package, but some resources make use of it.
#   Default: 'sonarqube'
#
# * `group`
# The primary group of the SonarQube user. The group may or may not be managed
# by this package, but some resources make use of it.
#   Default: 'sonarqube'
#
# * `manage_db`
# True if this module should manage the SonarQube database. Currently it is
# only possible to manage MySQL and PostgreSQL databases on localhost, and
# either option requires the installation of the puppetlabs-mysql or
# puppetlabs-postgresql module respectively.
#   Default: false
#
# * `db_type`
# The database engine type. Currently only 'mysql' and 'postgresql' are
# supported if `manage_db` is true.
#   Default: 'postgresql'
#
# * `db_host`
# The hostname of the database server. Currently only 'localhost' is supported
# if `manage_db` is true.
#   Default: 'localhost'
#
# * `db_name`
# The name of the database, if managed by this module.
#   Default: 'sonarqube'
#
# * `db_user`
# The database user. May not be used for some database engines.
#   Default: 'sonarqube'
#
# * `db_password`
# The database password. May not be used for some database engines.
#   Default: 'sonarqube'
#
# * `jdbc_url`
# The JDBC URL used to connect to the database. If not set and `manage_db` is
# true, this may be built automatically.
#   Default: undef
#
# * `manage_service`
# True if this module should install and manage the SonarQube service.
#   Default: true
#
# * `service_name`
# The name of the system service to be managed by this module.
#   Default: 'sonarqube'
#
# * `service_enable`
# Tells Puppet whether the managed service should be enabled to start at
# boot.
#   Default: true
#
# * `service_ensure`
# Tells Puppet whether the managed service should be running. Valid
# options: 'running' or 'stopped'.
#   Default: 'running'
#
# * `properties`
# Arbitrary key-values to be merged with `sonar_home`/conf/sonar.properties.
# This module will not completely take over the file, but any keys in this hash
# will override existing config in the file.
#   Default: {}
#
# Authors
# -------
#
# Peter van Zetten <peter.vanzetten@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Peter van Zetten, unless otherwise noted.
#
class sonarqube(
  # Installation parameters
  $manage_install,
  $version,
  $sonar_home,
  $manage_user,
  $user,
  $group,
  # Database parameters
  $manage_db,
  $db_type,
  $db_host,
  $db_name,
  $db_user,
  $db_password,
  $jdbc_url,
  # Service parameters
  $manage_service,
  $service_name,
  $service_enable,
  $service_ensure,
  # Configuration parameters
  $properties,
) {

  validate_bool($manage_install)
  validate_string($version)
  validate_absolute_path($sonar_home)
  validate_bool($manage_user)
  validate_string($user)
  validate_string($group)

  validate_bool($manage_db)
  # DB parameters are checked by sonarqube::config::db
  validate_string($jdbc_url)

  validate_bool($manage_service)
  validate_string($service_name)
  validate_bool($service_enable)
  validate_string($service_ensure)

  validate_hash($properties)

  contain ::sonarqube::install
  contain ::sonarqube::config
  contain ::sonarqube::service

}
