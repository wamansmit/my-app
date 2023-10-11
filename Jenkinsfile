pipeline {
    agent any

    environment {

        
        // Define environment variables as needed
        DOCKER_IMAGE = 'my-java-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out the source code from the Git repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/wamansmit/my-app.git']]])
            }
        }

        stage('Build with Maven') {
withMaven(globalMavenSettingsConfig: '', jdk: '', maven: 'maven', mavenSettingsConfig: '', traceability: true) {


            
            steps {
                // Build the Java project with Maven
                sh 'mvn clean package'
            }
        }
        }
        stage('Create Docker image') {
            steps {
                // Build a Docker image using a Dockerfile
                script {
                    def dockerfileContent = """
                    FROM openjdk:8-jre-alpine
                    WORKDIR /app
                    COPY target/*.jar app.jar
                    CMD ["java", "-jar", "app.jar"]
                    """
                    writeFile file: 'Dockerfile', text: dockerfileContent

                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Publish Docker image') {
            steps {
                // Publish the Docker image to a Docker registry (e.g., Docker Hub)
                withDockerRegistry([credentialsId: 'your-dockerhub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            // Optionally, you can perform additional actions on success
            echo 'Build and deployment successful.'
        }
        failure {
            // Optionally, you can handle failure scenarios
            echo 'Build or deployment failed.'
        }
    }
}
