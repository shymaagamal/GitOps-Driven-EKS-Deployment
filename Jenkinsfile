pipeline {
    agent any
    tools {
        nodejs 'node20' 
    }
    environment {
        IMAGE_TAG = "1.0.${BUILD_NUMBER}"
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
                echo "Using image tag: ${IMAGE_TAG}"
                sh 'docker build -t shaimaagsalem/myapp:${IMAGE_TAG} -f Dockerfile/dockerfile .'
            }
        }

        stage('Trivy Scan') {
            steps {
                echo "Scanning image with tag: ${IMAGE_TAG}"
                sh 'trivy image myapp:${IMAGE_TAG}'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_USER/myapp:${IMAGE_TAG}
                    '''
                }
            }
        }

    }
}
