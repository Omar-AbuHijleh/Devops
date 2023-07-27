pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // make git clone
		git branch: 'main', credentialsId: 'f8d0588e-9bb2-4023-9788-75eaa1808c0a', url: 'https://github.com/Omar-AbuHijleh/Devops.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script{
                    def customImageTag = "omarabuhejleh/orange-httpd:omar"
                    docker.build(customImageTag,'.')
                }
            }
        }
        stage('Push docker image') {
            steps {
                script{
                    def customImageTag = "omarabuhejleh/orange-httpd:omar"
                    withDockerRegistry(credentialsId: '40efb7c1-dc58-4be9-b147-26dffac372b4') {
                        docker.image(customImageTag).push()
                    }
                }
            }
        }
    }
}

