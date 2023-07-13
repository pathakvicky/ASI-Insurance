pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }

  stages {
     // Fetch code from GitHub
    stage('checkout') {
      steps {
        git branch: 'master', url: 'https://github.com/pathakvicky/ASI-Insurance.git'

      }
    }

   // Build Java application

    stage('Maven Build') {
      steps {
        sh 'mvn clean install'
      }

     // Post building archive Java application

      post {
        success {
          archiveArtifacts artifacts: '**/target/*.jar'
        }
      }
    }

  // Test Java application

    stage('Maven Test') {
      steps {
        sh 'mvn test'
      }
    }

   // Build docker image in Jenkins

    stage('Build Docker Image') {

      steps {
        sh 'docker build -t asi_insurance:latest .'
        sh 'docker tag asi_insurance pathakvicky/asi_insurance'
      }
    }

  // Login to DockerHub before pushing docker Image

    stage('Login to DockerHub') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }

  // Push image to DockerHub registry

    stage('Push Image to dockerHUb') {
      steps {
        sh 'docker push pathakvicky/asi_insurance:latest'
      }
      post {
        always {
          sh 'docker logout'
        }
      }

    }
  
    stage('Deploy Ansible') {
        steps{
         sh 'ansible-playbook -i inventory ansible-playbook.yml'
        }
    }
  }
}
