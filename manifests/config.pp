class sonarqube::config {

  $sonarqube_config = "${sonarqube::sonar_home}/conf/sonar.properties"

  if $sonarqube::manage_db {
    contain sonarqube::config::db
  }

}
