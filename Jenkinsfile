pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''chmod +x gradlew
./gradlew -DskipTests clean build pmd:pmd pmd:cpd findbugs:findbugs checkstyle:checkstyle
'''
      }
    }
    stage('test') {
      steps {
        sh './gradlew test'
      }
    }
  }
}