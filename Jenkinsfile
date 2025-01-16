pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone your repository
                git 'https://github.com/your-repo-url.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    def imageName = "my-c-python-app"
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        stage('Test Docker Image') {
            steps {
                // Optionally, test the Docker image
                sh "docker run my-c-python-app echo 'Test successful'"
            }
        }
    }
}