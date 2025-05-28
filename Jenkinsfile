pipeline{
    agent any

    tools{
        jdk 'JDK17'
        nodejs 'node16'
    }
    environment{
        SCANNER_HOME=tool 'sonarqube-scanner'
    }
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    stages{
        stage('create workspace'){
            steps{
                cleanWs()
                git url: 'https://github.com/your-repo.git', branch: 'main'
            }
        }
        stage('SonarQube analysis'){
            steps{
            withSonarQubeEnv('sonarQube-Server') { 
                sh '''${SCANNER_HOME}/bin/sonar-scanner \
                      -Dsonar.projectKey=my-node-app \
                      -Dsonar.projectName="Node App" \
                      -Dsonar.sources=Application \
                      -Dsonar.exclusions=node_modules/**,dist/** \
                      -Dsonar.host.url=http://44.199.248.237:9000 \
                      -Dsonar.token=${SONAR_TOKEN} \
                      -Dsonar.language=js'''
            }
            }
        }

        stage("Quality Gate"){
            steps {
                 script {
                     waitForQualityGate abortPipeline: false, credentialsId: 'sonarQUbe-Token' 
                 }
             } 
         }
         stage('Debug Workspace') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
         stage('Install Dependencies') {
             steps {
                 sh "cd Application && npm install"
             }
         }


    }
}



node {
  stage('SonarQube analysis') {
    def scannerHome = tool '<sonarqubeScannerInstallation>'; // must match the name of an actual scanner installation directory on your Jenkins build agent
    withSonarQubeEnv('<sonarqubeInstallation>') { // If you have configured more than one global server connection, you can specify its name as configured in Jenkins
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}