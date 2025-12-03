pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hsounaSellami/alpine:1.0.0"
        REGISTRY_CREDENTIALS = 'dockertoken'
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/hsounaSellami/lastdev.git', branch: 'main'
            }
        }

        stage('Clean & Build Project') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: REGISTRY_CREDENTIALS, passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                }
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }

    
}
