# GitOps-Driven-EKS-Deployment


## Tools Used:
Jenkins: For managing the CI/CD pipeline.
SonarQube: For static code analysis.
Trivy: For scanning vulnerabilities in files and Docker images.
Docker: To containerize applications.
Kubernetes (AWS EKS): For managing containerized workloads.
Terraform: For EKS deployment.

# Table of Contents:

- Step 1: Set up Git Repository and create Security Token
- Step 2: Setup required servers (Jenkins, Sonarqube)
- Step 3: Set up Jenkins, Sonarqube 
- Step 4: Install Jenkins Plugins, and Configure  Trivy, SonarQube and DockerHub to use Jenkins
- Step 5: Create a complete CICD pipeline
- Step 6: Create the EKS cluster, Install AWS CLI, Kubectl and Terraform
- Step 7: Assign a custom domain to the deployed application



[](https://ougabriel.medium.com/cicd-project-production-level-blog-app-deployment-using-eks-nexus-sonarqube-trivy-with-40eb648a688a)


plugins needed for eclips temurin installer
sonarQube scanner
sonaegates 


[SonarQube](https://docs.sonarsource.com/sonarqube-server/10.4/setup-and-upgrade/install-the-server/introduction/)

## Running Play books
after run sonarQube.yaml 
run this command 
``` bash
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```
```Insufficient Virtual Memory (vm.max_map_count): Elasticsearch requires this setting to be at least 262144. You can set it using:```


# PLugins
- Eclipse Temurin installerVersion
1.7

- SonarQube ScannerVersion
2.18


- Sonar Quality Gates

- Quality GatesVersion
2.5

- docker 
- Docker Commons
- Docker Pipeline
-Docker API
- docker-build-step


# configurations in Jenkins 
- tools
- add nodejs

########
 install JDK tool
 - Install from adoptium.net
 - VERSION JDK-17.0.13.11 

#### 
Docker   installation 
-
 ### 
 SonarQube Scanner installations


##  SOnarQube COnfig
Pass -> St123456789@

tokens->>  squ_ddad47f3a1a1f37bb63a5f72e635c550aaab11e6

- administration 
- security 
- add token
- 
 

 add this tockn in credential of jenkins


 ---> in system 
 of jenkins 
 - add SonarQube servers



 in sonarQUbe Dashboard

 - Create QualityGate


 then go to administration tab 
 and under configuration choose webhooks

 - add private address for Ec2 





