pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // make git clone
                git branch: 'main', credentialsId: 'e418357a-642f-4b88-a517-bb26bf80511e', url: 'https://github.com/Abdullah-Salhab/orange.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script{
                    def customImageTag = "abdallahsalhab/orange-httpd:abd"
                    docker.build(customImageTag,'.')
                }
            }
        }
        stage('Push docker image') {
            steps {
                script{
                    def customImageTag = "abdallahsalhab/orange-httpd:abd"
                    withDockerRegistry(credentialsId: 'e418357a-642f-4b88-a517-bb26bf80511e') {
                        docker.image(customImageTag).push()
                    }
                }
            }
        }
    }
}

