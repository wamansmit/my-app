pipeline {
    agent any // You can specify a node to run the pipeline if needed

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the Git repository
                git branch: 'main', url: 'https://github.com/wamansmit/my-app.git' // Replace with your Git repository URL
            }
        }

        stage('Build') {
            steps {
                // Use Maven to build the project
                sh 'mvn clean package' // You may need to adjust this command based on your Maven setup
            }
        }

        stage('Copy Artifacts') {
            steps {
                // Copy built artifacts to a directory
                sh 'cp -R target/* /workspace/' // Replace with your artifact destination directory
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests (if applicable)
                sh 'mvn test' // Example command for running Maven tests
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image from the copied artifacts
                    docker.build("your-image-name:${env.BUILD_NUMBER}") // Replace with your desir
    }
}
