class sonarqube::install::user {
  group { $sonarqube::group:
    ensure => present,
  }

  user { $sonarqube::user:
    ensure     => present,
    gid        => $sonarqube::group,
    managehome => false,
    require    => Group[$sonarqube::group],
    shell      => '/bin/bash',
    system     => true,
  }

}