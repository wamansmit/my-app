pipeline {
    agent {
        docker {
            image 'abhishekf5/maven-abhishek-docker-agent:v1'
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Build and Run Docker Container') {
            steps {
                sh 'echo "Running commands inside the Docker container"'
                sh 'docker ps'  // Example Docker command
            }
        }
    }
}
