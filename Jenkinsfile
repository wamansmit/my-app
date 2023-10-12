pipeline {
  agent any

    
  stages {
    stage("Clone code from GitHub") {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/wamansmit/my-app.git']])
                }
            }
        }
     
    stage('Node JS Build') {
      steps {
        sh 'mvn install package'
      }
    }
  
     stage('Build Node JS Docker Image') {
            steps {
                script {
                  sh 'docker build -t wamansmit/my-app-1.0 .'
                }
            }
        }


        stage('Deploy Docker Image to DockerHub') {
            steps {
                script {
                 withCredentials([string(credentialsId: 'docker', variable: 'docker')]) {
                    sh 'docker login -u docker -p ${docker}'
            }
            sh 'docker push wamansmit/my-app-1.0'
        }
            }   
        }

  }
}
