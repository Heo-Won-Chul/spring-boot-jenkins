pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''chmod +x gradlew
./gradlew clean build -x check -x test
'''
      }
    }
    stage('static-analysis') {
      steps {
        sh './gradlew check -x test'
      }
    }
    stage('test') {
      steps {
        sh './gradlew test'
      }
    }
  }
}