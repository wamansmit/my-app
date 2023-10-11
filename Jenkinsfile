pipeline {
    agent any

    environment {
        // Define environment variables here
        DOCKER_REGISTRY = 'docker.io'
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
                    // Set up environment variables specific to the build
                    MAVEN_HOME = tool name: 'maven', type: 'Maven'
                  
                    
                    // Build the Maven project
                    sh "mvn clean install"
                }
            }
        }

        stage('Package Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_REGISTRY}/my-app:${APP_VERSION} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a registry
                    sh "docker push ${DOCKER_REGISTRY}/my-app:${APP_VERSION}"
                }
            }
        }

        
    }
}

