pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''chmod +x gradlew
./gradlew -DskipTests clean build'''
      }
    }
  }
}