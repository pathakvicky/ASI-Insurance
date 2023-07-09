pipeline {
    agent any

    // environment {
    //     DOCKER_HUB_USERNAME = credentials('vicky12345pathak@gmail.com')
    //     DOCKER_HUB_PASSWORD = credentials('Vicky$_123#')
    // }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/pathakvicky/ASI-Insurance.git'
            }
        }
        stage('mvn Build'){
            steps{
                sh "mvn clean package"        
            }
        }
    
        // stage('Publish Test Reports'){
        //     steps{
        //     publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
       
        //     }
        // }
       

        //      stage('Build Docker Image') {
        //     steps {
        //         script {
        //             def dockerImage = docker.build("pathakvicky/asi_insurance:${env.BUILD_ID}")
        //             sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
        //             //docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
        //             dockerImage.push()
        //             //}
        //         }
        //     }
        // }

        // stage('Deploy with Ansible') {
        //     steps {
        //         ansiblePlaybook(
        //             credentialsId: 'your-ansible-credentials-id',
        //             playbook: 'path/to/your/ansible/playbook.yml',
        //             inventory: 'path/to/your/ansible/inventory.ini'
        //         )
        //     }
        // }
    }
}
