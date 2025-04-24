pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-node-app:latest'
        DOCKER_HUB_REPO = 'ensarmuriqi/my-node-app'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git 'https://github.com/ensarmuriqi/node-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                // e.g., bat 'npm test'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    bat 'docker login -u %DOCKER_HUB_USERNAME% -p %DOCKER_HUB_PASSWORD%'
                    bat 'docker tag %DOCKER_IMAGE% %DOCKER_HUB_REPO%:%BUILD_NUMBER%'
                    bat 'docker push %DOCKER_HUB_REPO%:%BUILD_NUMBER%'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
