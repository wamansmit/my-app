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
                script {
                    // Add Docker to the PATH
                    def dockerPath = tool name: 'Docker', type: 'Tool Type' // Replace 'Tool Type' with the actual tool type
                    env.PATH = "${dockerPath}:${env.PATH}"

                    // Build the Docker image
                    sh "docker build -t ${DOCKER_REGISTRY}/my-app:${APP_VERSION} ."
        }
    }
}
