pipeline {
    agent any

    environment {
        // Define environment variables here
        DOCKER_REGISTRY = 'https://hub.docker.com/'
        APP_VERSION = '1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Git repository
                checkout scm
            }
        }
    
        stage('Build') {
            steps { 
                // Add Docker to the PATH
                    tool name: 'docker', type: 'dockerTool' // Replace 'Tool Type' with the actual tool type
                    
                script {
                   

                    // Build the Docker image
                    sh "docker build -t ${DOCKER_REGISTRY}/my-app:${APP_VERSION} ."
        }
    }
}
}
}
