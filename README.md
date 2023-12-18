# Streamlined CI/CD Pipeline for Java Web Apps.

In our repository, we've successfully developed a basic Java web app. We can generate a .war package from the code and deploy it on a Tomcat server. Additionally, we've implemented SonarQube to generate detailed code quality reports. To enhance our development process, we can consider organizing the project structure more effectively, using build automation tools like Maven or Gradle, implementing continuous integration with Jenkins . Containerization using Docker and orchestration with Kubernetes can simplify deployment and management.

![image](https://github.com/Loki-1/webapp-resume/assets/134843197/f570ebf0-6d1e-408a-a56b-4f63577f3f3c)

## Webapp Interface : 

![image](https://github.com/Loki-1/webapp-resume/assets/134843197/e475f307-0b8a-46e0-94ed-2e3a13cc782a)
![image](https://github.com/Loki-1/webapp-resume/assets/134843197/47666a25-4a3b-4acd-8059-b4ce34826dae)
![image](https://github.com/Loki-1/webapp-resume/assets/134843197/71b772ae-7bef-4479-9936-65152543f992)

## Project Overview:
Embark on establishing an efficient Continuous Integration and Deployment (CI/CD) pipeline tailored for Java web applications. This project focuses on optimizing the development lifecycle, ensuring code quality, and simplifying deployment. The pipeline comprises seven stages, ensuring the reliability and efficiency of the entire process.

## Pipeline Stages:

### 1. Code Checkout from GitHub (Stage 1):
Automate code retrieval from GitHub, ensuring a continuous integration process with an up-to-date codebase.

### 2. Maven Package Build (Stage 2):
Configure Maven to build the Java web app, managing dependencies, and compiling source code.

### 3. Code Quality Scan with SonarQube (Stage 3):
Integrate SonarQube for static code analysis, evaluating quality against standards and identifying issues early.

### 4. Artifacts Upload to Nexus (Stage 4):
Automate artifact upload to a Nexus repository for centralized and versioned management.

### 5. Docker Image Build (Stage 5):
Implement Docker image creation for consistent and reproducible packaging.

### 6. Docker Image Push to Docker Hub (Stage 6):
Configure automation to push Docker images to Docker Hub, ensuring accessibility and version control.

### 7. App Deployment as Docker Container (Stage 7):
Automate deployment of the Java web app as a Docker container, utilizing a Tomcat Docker image for seamless deployment.

### Benefits:

#### Efficiency: Streamlined CI/CD accelerates the development lifecycle.
#### Quality Assurance: SonarQube enhances code quality and adherence to standards.
#### Artifact Management: Nexus simplifies versioning and management for enhanced traceability.
#### Containerization: Docker ensures consistent and portable deployments.
#### Collaboration: Integration with GitHub fosters collaborative development.

## Skills: 
Tomcat · Sonarqube · Nexus · Maven · Docker · Jenkins · Amazon Web Services (AWS)
