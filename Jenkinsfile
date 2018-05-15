pipeline {
  agent any
  options { 
    buildDiscarder(logRotator(numToKeepStr: '7')) 
  }
  stages {
    stage('build') {
      steps {
        sh './gradlew clean build -x check -x test'
      }
    }
    stage('static-analysis') {
      parallel {
        stage('check') {
          steps {
            sh './gradlew check -x test'
          }
        }
        stage('sonarqube') {
          steps {
            sh './gradlew sonarqube -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_LOGIN_TOKEN'
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
    SONAR_HOST_URL = credentials('SONAR_HOST_URL')
    SONAR_LOGIN_TOKEN = credentials('SONAR_LOGIN_TOKEN')
  }
}
