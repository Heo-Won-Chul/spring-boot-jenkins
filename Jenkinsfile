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
      parallel {
        stage('static-analysis') {
          steps {
            sh './gradlew check -x test'
          }
        }
        stage('sonarqube') {
          steps {
            sh './gradlew sonarqube -Dsonar.host.url=${params.SONAR_HOST_URL} -Dsonar.login=${params.SONAR_LOGIN_TOKEN}'
          }
        }
      }
    }
    stage('test') {
      steps {
        sh './gradlew test'
      }
    }
  }
  environment {
    SONAR_HOST_URL = 'http://localhost:9000'
    SONAR_LOGIN_TOKEN = '20dab863141e7d16334aa4deb969773782af0e97'
  }
}