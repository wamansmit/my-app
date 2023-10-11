pipeline {
    agent any
        stages{
        stage("checkout"){
            steps{
            echo 'getting source code from GIT'
            git branch: 'main', url: 'https://github.com/wamansmit/my-app.git'
            }
                
            }
        stage("build"){
            steps{
                withMaven(globalMavenSettingsConfig: '', maven: 'maven') {
                 sh "mvn clean install"       // add secure shell command for maven it is also known as maven command block command        
                          } 
                
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    dockerImage = docker.build(
                        DOCKER_IMAGE_NAME,
                        "--file ${DOCKERFILE_PATH} ."
                    )
                }
            }
        }

        stage('Publish Docker Image') {
            steps {
                script {
                    // Authenticate with a Docker registry (e.g., Docker Hub)
                    docker.withRegistry(REGISTRY_CREDENTIALS) {
                        // Push the Docker image to the registry
                        dockerImage.push()
                    }
                }
            }
        }
            }
        }
