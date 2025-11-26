pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "monuser/monapp:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/hsounaSellami/lastdev.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
                sh 'docker push $DOCKER_IMAGE'
            }
        }
    }
}
