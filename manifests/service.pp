class sonarqube::service {

  if $sonarqube::manage_service {
    $unitpath = $::osfamily ? {
      'redhat' => '/usr/lib/systemd/system/sonarqube.service',
      'debian' => '/lib/systemd/system/sonarqube.service',
      default => fail("Management of the SonarQube systemd service is only available for RedHat and Debian families.")
    }

    file { $unitpath:
      ensure  => file,
      content => epp('sonarqube/sonarqube.service.epp', {
        'username'  => $sonarqube::user,
        'group'     => $sonarqube::group,
        'sonarhome' => $sonarqube::sonar_home,
        'arch'      => 'linux-x86-64',
      }),
    } ~>
    exec { 'systemctl-daemon-reload':
      command => 'systemctl daemon-reload',
    }

    service { 'sonarqube':
      name     => $sonarqube::service_name,
      ensure   => $sonarqube::service_ensure,
      enable   => $sonarqube::service_enable,
      require  => File[$unitpath]
    }
  }

}
