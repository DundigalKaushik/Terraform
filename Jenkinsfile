pipeline {
    agent any
    
    tools {
        terraform 'terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main', credentialsId: 'Gitcredentials', url: 'https://github.com/DundigalKaushik/Terraform.git'
            }
        }
    }
}
        
