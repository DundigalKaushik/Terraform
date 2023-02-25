pipeline {
    agent any
    
    tools {
        terraform 'terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main', credentialsId: 'cde06f21-9ae7-4081-a549-f7bdb515dc6f', url: 'https://github.com/codepipe/tff.git'
            }
        }
