pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git(url: 'https://github.com/heowc/spring-boot-jenkins.git', branch: 'dev')
      }
    }
  }
}