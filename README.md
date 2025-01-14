# DevSecOps Project: Netflix Application Deployment with Jenkins, SonarQube, and Monitoring

This project demonstrates a complete DevSecOps pipeline for deploying a Netflix-like application using Jenkins, SonarQube, Docker, and various security scanning tools. The infrastructure is provisioned using Terraform, and the application is built and deployed using a Jenkins pipeline.

## Project Overview

The project consists of the following components:

1. **Terraform Configuration**: 
   - Creates 2 EC2 instances (Jenkins Server and Monitoring Server).
   - Generates a `.pem` key for SSH access.
   - Configures Security Groups to allow inbound traffic for specific services.
   - Outputs the public IPs, key name, and instance IDs.

2. **Dockerfile**: 
   - Builds a Docker image for the Netflix application using an API from TMDB.

3. **Jenkins Pipeline**:
   - Automates the build, test, and deployment process.
   - Includes stages for code checkout, SonarQube analysis, dependency installation, security scanning (OWASP, Trivy), Docker image build/push, and deployment.

4. **Monitoring Setup**:
   - Grafana and Prometheus are configured on the Monitoring Server for observability.

---

## Prerequisites

Before using this project, ensure you have the following:

- **AWS Account**: To create EC2 instances and other resources.
- **Terraform**: Installed and configured on your local machine.
- **Jenkins**: Installed on the Jenkins Server.
- **Docker**: Installed on the Jenkins Server for building and pushing images.
- **SonarQube**: Set up for code quality analysis.
- **TMDB API Key**: Required for the Netflix application.

---

## Terraform Configuration

### Files:
1. **`ec2_instances.tf`**:
   - Creates 2 EC2 instances: 
     - Jenkins Server
     - Monitoring Server
   - Generates and stores a `.pem` key locally for SSH access.

2. **`security_groups.tf`**:
   - Configures Security Groups to allow inbound traffic:
     - **Jenkins_app Server**:
       - Port 22 (SSH)
       - Port 80 (HTTP)
       - Port 8080 (Jenkins)
       - Port 9000 (SonarQube)
       - Port 8081 (Netflix Application)
     - **Monitoring Server**:
       - Port 22 (SSH)
       - Port 80 (HTTP)
       - Port 3000 (Grafana)
       - Port 9090 (Prometheus)

3. **`outputs.tf`**:
   - Outputs the public IPs, key name, and instance IDs for easy access.

---

## Jenkins Pipeline

The Jenkins pipeline (`Jenkinsfile`) includes the following stages:

1. **Clean Workspace**: Cleans the Jenkins workspace.
2. **Checkout from Git**: Pulls the code from the GitHub repository.
3. **SonarQube Analysis**: Performs code quality analysis using SonarQube.
4. **Quality Gate**: Waits for the SonarQube quality gate result.
5. **Install Dependencies**: Installs Node.js dependencies.
6. **OWASP FS Scan**: Runs OWASP Dependency-Check for vulnerability scanning.
7. **Trivy FS Scan**: Runs Trivy for filesystem security scanning.
8. **Docker Build & Push**: Builds and pushes the Docker image to Docker Hub.
9. **Trivy Image Scan**: Scans the Docker image using Trivy.
10. **Deploy to Container**: Deploys the Netflix application to a Docker container.
![image](https://github.com/user-attachments/assets/5110f967-6397-4f7b-8733-8d026a7b4eee)



---

## Email Notifications

The Jenkins pipeline is configured to send email notifications upon successful build completion.

---

## Special Thanks

A huge thanks to the **Cloud Champ YouTube channel** for providing guidance and inspiration for this project. You can find the original project repository here:  
[https://github.com/N4si/DevSecOps-Project/](https://github.com/N4si/DevSecOps-Project/)

---

## How to Use

1. Clone this repository:
   ```bash
   git clone (https://github.com/MohammedBKassab/DevSecOps_Netflix.git)
   ```
2. Navigate to the Terraform directory and initialize Terraform:
   ```bash
   cd DevSecOps-Netflix/terraform
   terraform init
   ```
3. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
4. SSH into the Jenkins Server using the generated `.pem` key:
   ```bash
   ssh -i your-key.pem ec2-user@<jenkins-server-public-ip>
   ```
5. Set up Jenkins and configure the pipeline using the provided `Jenkinsfile`.
6. Run the pipeline to build, test, and deploy the Netflix application.

---

## Monitoring

Access the monitoring tools using the following URLs:
- **Grafana**: `http://<monitoring-server-public-ip>:3000`
- **Prometheus**: `http://<monitoring-server-public-ip>:9090`
![image](https://github.com/user-attachments/assets/3b8c90b2-0120-4a2c-869a-11dd950a90b0)
![image](https://github.com/user-attachments/assets/498374c8-1e4f-4bdb-846a-b2f5df2652e4)


---

## License

This project is licensed under the MIT License. Feel free to use, modify, and share!

## Contact

For any questions or feedback, feel free to reach out to me at mohammedb.kassab@gmail.com.

---

Enjoy the project! 🚀
