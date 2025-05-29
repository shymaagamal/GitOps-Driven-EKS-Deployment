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
                    sh 'sonar-scanner'
                }
            }
        }

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
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag myapp:latest $DOCKER_USER/myapp:latest
                        docker push $DOCKER_USER/myapp:latest
                    '''
                }
            }
        }

    }
}
