pipeline {
    agent any

    stages {
        stage('git') {
            steps {
		git branch: 'main', credentialsId: 'f9e36d84-d996-469a-9fb1-2d1d6b68705f', url: 'https://github.com/Omar-AbuHijleh/Devops'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t image -from-jenkins:v1'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
