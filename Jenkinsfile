pipeline {
    agent any
    tools {
        nodejs 'node20' 
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
                    sh 'sonar-scanner '
                }
            }
        }
        // stage('Quality Gate') {
        //     steps {
        //         timeout(time: 6, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: false
        //         }
        //     }
        // }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest -f Dockerfile/dockerfile .'
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy image myapp:latest'
            }
        }


    }
}
