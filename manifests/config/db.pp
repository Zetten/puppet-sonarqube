class sonarqube::config::db {

  $type = $sonarqube::db_type
  $hostname = $sonarqube::db_host
  $database = $sonarqube::db_name
  $username = $sonarqube::db_user
  $password = $sonarqube::db_password

  validate_string($type)
  validate_re($hostname, '^localhost$', 'Only databases with $hostname \'localhost\' may be managed by this module.')
  validate_string($database)
  validate_string($username)
  validate_string($password)

  case upcase($type) {
    'MYSQL': {
      require ::mysql::server

      mysql::db { 'sonarqubedb':
        host     => $hostname,
        dbname   => $database,
        user     => $username,
        password => $password,
        grant    => ['ALL'],
        before   => $before,
      }
    }
    'POSTGRESQL': {
      require ::postgresql::server

      postgresql::server::db { 'sonarqubedb':
        dbname   => $database,
        user     => $username,
        password => postgresql_password($username, $password),
        grant    => 'ALL',
        before   => $before,
      }
    }
    default: {
      fail("Only MySQL and PostgreSQL databases may be managed by this module.")
    }
  }

}