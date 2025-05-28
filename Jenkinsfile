pipeline {
    agent any
    tools {
        nodejs 'node18' 
    }
    stages {
        stage('Checkout') {
            steps {
                 git branch: 'main', url: 'https://github.com/shymaagamal/GitOps-Driven-EKS-Deployment.git'
            }
            
        }
        stage('create workspace'){
            steps{
                cleanWs()
                git branch: 'main', url: 'https://github.com/shymaagamal/GitOps-Driven-EKS-Deployment.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('Application') {
                    sh 'npm install'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarQube-Server') {
                    sh 'sonar-scanner'
                }
            }
        }

        // stage('Build Docker Image') {
        //     steps {
        //         sh 'docker build -t myapp:latest Dockerfile/'
        //     }
        // }

        // stage('Trivy Scan') {
        //     steps {
        //         sh 'trivy image myapp:latest'
        //     }
        // }

        // stage('Run on EC2') {
        //     steps {
        //         sh 'docker run -d -p 80:3000 myapp:latest'
        //     }
        // }
    }
}
