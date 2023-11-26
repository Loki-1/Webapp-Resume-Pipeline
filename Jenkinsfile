pipeline{
agent any
tools
{
maven 'Maven3.9.5'
}
environment {
        // Define environment variables if needed
        DOCKER_REGISTRY = 'lokeshnagam121'
        dockerImage = 'lokeshnagam121/maven-webapp-resume'
        IMAGE_TAG = 'latest'
        registryCredential ='dockerhub'
}
stages
{
stage('Code Checkout')
  {
        steps{git credentialsId: 'github', url: 'https://github.com/Loki-1/webapp-resume.git'}
  }
stage('Building code as a war file')
  {
  steps
  {
  sh  "mvn clean package"
  }
  }
stage('Executing SonarQube Report')
  {
  steps
  {
  sh  "mvn clean sonar:sonar"
  }
  }
stage('Uploading Artifacts Into Nexus Repo')
  {
  steps
   {
  sh  "mvn clean deploy"
   }
  }
stage('Image Build for this application') {
            steps {
                // Build your Docker image
                script {
                     // Build your Docker image
                    sh 'docker build -t lokeshnagam121/maven-webapp-resume .'
                }
            }
        }
stage('pushing Image into docker-hub') {
            steps {
                script {
                    // Push the Docker image to the registry
                    docker.withRegistry('', registryCredential) {
                        docker.image("${dockerImage}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
stage('Deploy Application into a container') {
            steps {
                script {
                    // Run the Docker container
                    docker.image("${dockerImage}:${IMAGE_TAG}").run("-p 9093:8080 --name resume")

                }
            }
        }
}
}
