pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'chmod +x gradlew & sudo ./gradlew -DskipTests clean build'
      }
    }
  }
}