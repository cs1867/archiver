pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('cs1867')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/cs1867/archiver.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t cs1867/archiver:latest .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push cs1867/archiver:latest'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}

