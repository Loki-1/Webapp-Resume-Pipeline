# Streamlined CI/CD Pipeline for Maven Web Apps.

## Overview
- This project involves creating a web application that showcases my resume, personal projects, and professional details. The application includes links to my GitHub, LinkedIn, Docker Hub profiles, and provides an option to download my resume. The application is built using HTML, CSS, and JavaScript.
- In our repository, we've successfully developed a basic Java web app. We can generate a .war package from the code and deploy it on a Tomcat server. Additionally, we've implemented SonarQube to generate detailed code quality reports. To enhance our development process, we can consider organizing the project structure more effectively, using build automation tools like Maven or Gradle, implementing continuous integration with Jenkins . Containerization using Docker and orchestration with Kubernetes can simplify deployment and management.


![image](https://github.com/Loki-1/Webapp-Resume-Pipeline/assets/134843197/d6212022-7388-468f-bc74-dafaa54ef488)
![image](https://github.com/Loki-1/Webapp-Resume-Pipeline/assets/134843197/3cccac90-df88-43a9-92d3-36691435ecb7)
![image](https://github.com/Loki-1/Webapp-Resume-Pipeline/assets/134843197/3f7afcba-5af1-405e-aa37-b5fa9879d889)

### Tools Used
- **Source Code Management:** GitHub
- **Build Tool:** Maven
- **Code Quality Analysis:** SonarQube
- **Artifact Repository:** Nexus
- **Continuous Integration:** Jenkins
- **Containerization:** Docker
- **Container Registry:** DockerHub
- **Container Orchestration:** Kubernetes

### Application Components
- **HTML:** Structure of the web application.
- **CSS:** Styling of the web application.
- **JavaScript:** Interaction and dynamic features.

### Features
- **Resume Display:** Showcases detailed resume with contact information, work experience, skills, education, and certifications.
- **Personal Projects:** Lists personal projects with descriptions and links.
- **Profile Links:** Provides buttons to visit LinkedIn, GitHub, and Docker Hub profiles.
- **Download Option:** Allows users to download a copy of the resume in PDF format.

### Deployment Architecture:

**Kubernetes Cluster:** Orchestrates containers.

***Pods:***
- One for the Maven Webapp resume.

***Services:***
- To expose the webapp-resume application internally or externally.
- **External url :** [http://localhost:8080/webapp-resume/](http://localhost:8080/webapp-resume/)


k8s pic

### Development Workflow
#### Source Code Management:
Code is managed in GitHub repositories.

#### Build and Package:
Maven is used to build packages (pom.xml manages dependencies and build configurations).

#### Code Quality Analysis:
SonarQube is integrated to analyze code quality and identify issues.

sonar pic

#### Artifact Repository:
Nexus serves as the artifact repository for storing Maven packages.

nexus pic

#### Continuous Integration:
Jenkins pipeline automates the CI/CD process.
**Stages:**
Build: Maven builds the application.
SonarQube Scan: Code quality analysis.
Nexus Repo storage: store atifacts inti nexus repo
Docker Build: Build Docker images.
Docker Push: Push Docker images to Docker Hub.
Kubernetes Deployment: Deploy to Kubernetes cluster.

pipeline pic

#### Containerization:
Docker is used to containerize the application.
Dockerfiles define the container images and we store those images on dockerhub.

dockerhub pic

#### Post-build Actions
Email Notification: Sends an email with build status and links to Jenkins console output.

email pic

### Benefits:

#### Efficiency: Streamlined CI/CD accelerates the development lifecycle.
#### Quality Assurance: SonarQube enhances code quality and adherence to standards.
#### Artifact Management: Nexus simplifies versioning and management for enhanced traceability.
#### Containerization: Docker ensures consistent and portable deployments.
#### Collaboration: Integration with GitHub fosters collaborative development.


### Prerequisites:
- Kubernetes cluster setup.
- Jenkins installation and configuration.
- Docker and Docker Hub accounts.

### Configuration Files:
- `pom.xml`: Maven build configuration.
- `Dockerfile`: Docker image configuration.
- `Jenkinsfile`: Jenkins pipeline groovy script
- **Kubernetes Manifests:**
  - `deployment.yaml`: Deployment configuration.
  - `service.yaml`: Service configuration.

### Troubleshooting and Monitoring
**Common Issues :-**
- **Styling Issues** Ensure `styles.css` is correctly linked in `index.html`.
- **JavaScript Errors** Check the console for any errors and debug `scripts.js`.
**Logging:**
  - Utilize Kubernetes logging (e.g., Fluentd, Elasticsearch, Kibana stack).
**Monitoring:**
  - Use Kubernetes monitoring tools (e.g., Prometheus, Grafana).

### Future Improvements
- Implement CI/CD pipelines for feature branches.
- Enhance Kubernetes deployment with Helm charts.
- Integrate automated testing (unit, integration, E2E).
- Add more dynamic features using JavaScript.
- Integrate with a backend to make the resume data dynamic.
- Improve styling and make the web application responsive for different devices.
