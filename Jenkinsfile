pipeline{
    agent any
    
    environment {
        DOCKER_TAG = getVersion()
    }
    stages{
        stage("SCM checkout"){
            steps{
                git branch: 'main', credentialsId: 'git', url: 'https://github.com/wamansmit/my-app.git'  
                }
            }
        stage("Maven build"){
            steps{
                sh "mvn clean package"
                }
            }
        stage("Dockerize"){
            steps{
                sh "docker build . -t wamansmit/my-app:${DOCKER_TAG}"
                }
            }
        stage("DockerHub push"){
            steps{
                withCredentials([string(credentialsId: 'docker', variable: 'dockerHubPwd')]) {
                    sh "docker login -u wamansmit -p ${dockerHubPwd}"
                }
                sh "docker push arpanboss/javaapp:${DOCKER_TAG}"
                }
        }
            
            
    }
}
