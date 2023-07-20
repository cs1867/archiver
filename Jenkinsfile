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
                sh 'docker build -t cs1867/archiver . ' 
            }
        }
   
}

}



