pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/pathakvicky/ASI-Insurance.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t your-image-name .'
            }
        }
        
        
        stage('Publish') {
            steps {
                // Log in to Docker Hub or GitHub Packages
                // You need to provide your credentials or use credentials stored in Jenkins credentials
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'Vicky$_123#', usernameVariable: 'vickypathak')]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                }
                
                // Push the Docker image to Docker Hub or GitHub Packages
                sh 'docker push java-project'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy your Java application using the Docker image
                // This step can vary depending on your deployment strategy
                // For example, using Docker Compose or Kubernetes manifests
            }
        }
    }
    
    post {
        success {
            // Actions to perform if the pipeline succeeds
        }
        
        failure {
            // Actions to perform if the pipeline fails
        }
    }
}
