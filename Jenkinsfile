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
            
                    // Set up environment variables specific to the build
        withMaven(globalMavenSettingsConfig: '', jdk: '', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
     // Build the Maven project
                    sh "mvn clean install"
}
                  
            
            }
    stage('Build') {
    steps {
        script {
            // Add Docker to the PATH
            def dockerPath = tool name: 'docker', type: 'dockertool' // Replace 'Tool Type' with the actual tool type
            env.PATH = "${dockerPath}:${env.PATH}"}

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

