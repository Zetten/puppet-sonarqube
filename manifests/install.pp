class sonarqube::install {

  if $sonarqube::manage_user {
    contain ::sonarqube::install::user
  }

  if $sonarqube::manage_install {
    contain ::sonarqube::install::dist
  }

}