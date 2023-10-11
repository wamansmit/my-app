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
            
            echo 'building the application'
            
            }
            }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("wamansmit/myapp:${TAG}")
                }
            }
        }
    }
}
