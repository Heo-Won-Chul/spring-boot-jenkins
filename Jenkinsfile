pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git(url: 'https://github.com/heowc/spring-boot-jenkins.git', branch: 'dev')
      }
    }
    stage('build') {
      steps {
        sh 'chmod +x gradlew & ./gradlew -DskipTests clean build'
      }
    }
  }
}