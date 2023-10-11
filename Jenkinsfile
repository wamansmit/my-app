pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the Git repository
              git branch: 'main', url: 'https://github.com/wamansmit/my-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    def customImageTag = "myapp:${env.BUILD_NUMBER}" // Customize the image tag
                    docker.build(customImageTag, './Dockerfile') // Path to your Dockerfile
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to a registry (e.g., Docker Hub)
                script {
                    docker.withRegistry('https://hub.docker.com', 'docker') {
                        docker.image(customImageTag).push()
                    }
                }
            }
        }
    }
}
