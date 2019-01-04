pipeline {
  agent any
  options { 
    buildDiscarder(logRotator(numToKeepStr: '7')) 
  }
  stages {
    stage('static-analysis') {
      parallel {
        stage('check') {
          steps {
            sh './gradlew check -x test'
          }
        }
        stage('sonarqube') {
          steps {
            //sh './gradlew sonarqube -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_LOGIN_TOKEN'
            sh 'echo TBD'
          }
        }
      }
    }
    stage('test') {
      steps {
        sh './gradlew test'
      }
    }
    stage('build') {
      steps {
        sh './gradlew clean build -x check -x test'
      }
    }
    stage('deploy') {
      steps {
        sh '''bash <<EOF
          echo TBD
EOF'''
      }
      post {
        success {
          slackSend channel: "#deploy", color: "good", message: "Job: ${env.JOB_NAME} with buildnumber ${env.BUILD_NUMBER} was successful"
        }
        failure {
          slackSend channel: "#deploy", color: "danger", message: "Job: ${env.JOB_NAME} with buildnumber ${env.BUILD_NUMBER} was failed"
        }
      }
    }
  }
  environment {
    SONAR_HOST_URL = credentials('SONAR_HOST_URL')
    SONAR_LOGIN_TOKEN = credentials('SONAR_LOGIN_TOKEN')
  }
}
