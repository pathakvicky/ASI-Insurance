pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('vicky12345pathak@gmail.com')
        DOCKER_HUB_PASSWORD = credentials('Vicky$_123#')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/pathakvicky/ASI-Insurance.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t your-docker-image-name:${env.BUILD_ID} .'
                sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                sh 'docker push your-docker-image-name:${env.BUILD_ID}'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'your-ansible-credentials-id',
                    playbook: 'path/to/your/ansible/playbook.yml',
                    inventory: 'path/to/your/ansible/inventory.ini'
                )
            }
        }
    }
}
