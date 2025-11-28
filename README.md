# Jarvis Desktop Voice Assistant Deployment on AWS EC2 using Terraform & Jenkins

<img src="https://giffiles.alphacoders.com/212/212508.gif" alt="">

# Project Overview

**This project demonstrates how to deploy the Jarvis Desktop Voice Assistant application on an AWS EC2 instance using Terraform for infrastructure automation and Jenkins for CI/CD automation. The complete pipeline ensures that any code change pushed to GitHub is automatically deployed to the EC2 instance.**

**Since Jarvis is a GUI-based desktop application and EC2 instances run in headless mode, the application is executed in server mode for deployment demonstration purposes.**

## Requirements

1. AWS EC2 

2. Terraform (Infrastructure as Code)

3. Jenkins (Pipeline for Automation)

4. GitHub (To configure Webhooks)

5. Systemd (Linux Service Manager)

6. Python 3

7. Ubuntu Linux


## Project Architecture

Terraform creates EC2 , security group 
      │
      ▼
GitHub Repository  (WEBHOOK)
      │
      ▼
Jenkins Pipeline  
      │
      ▼
Jenkins deploys application  
      │
      ▼
Systemd manages Jarvis service


## 📌Features

- Automatic EC2 provisioning using Terraform

- Security Group creation via Terraform

- Automated CI/CD using Jenkins webhook

- SSH-based deployment from Jenkins to EC2

- Application dependencies installation 

- Restart the systemd service

- Verify that the application is running successfully

## Project Structure

|-- pycache
|-- terraform files--main.tf
                     provider.tf
                     userdata.tpl
|-- jenkinsfile
|-- Jarvis
|-- README
|-- requirements

## Terraform Setup including installation on Windows

1. **Initialize Terraform**
   - terraform init

2. **Plan Infrastructure**
   - terraform plan

3. **Apply Infrastructure**
   - terraform apply


## Jenkins Installation on EC2

- sudo apt update
- sudo apt install openjdk-17-jre -y (JAVA)
- sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
- sudo apt update
- sudo apt install jenkins

## Take access of jenkins server 
   **Open browser:**

- http:public ip:8080

   **Get password:**

- sudo cat /var/lib/jenkins/secrets/initialAdminPassword


1. **Installed jenkins plugins**
   - Git (SCM)
   - SSH-Agent
   - GitHub integretor
   - Pipeline


2. **Create a jenkins pipeline**

- Open Jenkins Dashboard

- Click New Item

- Enter job name

- Choose Pipeline

- Click OK

3. **Connect Jenkins to GitHub Repository**

 a. *In pipeline configuration:*
 - Select: Pipeline script from SCM

 - SCM: Git

 - Repository URL: 
    'https://github.com/Pramod581/Jarvis-Desktop-Voice-Assistant.git'

 - Branch: main

 - Script Path: jenkinsfile

 4. **Create Deployment Pipeline (Jenkinsfile)**

 - Pull latest GitHub code

 - SSH into EC2

 - Run: - git pull
        - pip3 install -r requirements.txt
        - sudo systemctl restart jarvis

 5. **Configure GitHub Webhook**

 - http://<JENKINS_PUBLIC_IP>:8080/github-webhook/

 6. **Systemd Service File**

 - /etc/systemd/system/jarvis.service
 - sudo systemctl daemon-reload
 - sudo systemctl start jarvis
 - sudo systemctl enable jarvis


 7. **Test Deployment**

 - Make a change in GitHub

 - Commit & push

 - Verify Jenkins build starts automatically

 - Confirm:

 - Code pulled

 - Dependencies installed

 - Service restarted

 - Build success

 8. **Verification Commands**
 
 -  systemctl status jarvis

**Jenkins CI/CD pipeline was configured using GitHub webhook integration. The pipeline automatically triggers on code push, connects to EC2 through SSH, updates the application, installs dependencies, and restarts the service using systemd.**

## Conclusion

**This project showcases an end-to-end DevOps workflow combining Infrastructure as Code and CI/CD best practices. It highlights how Jenkins and Terraform can be effectively used together to automate cloud deployment.**

## Author: 
- Pramod Mali
  
    - Github: https://github.com/Pramod581
    - Email: pramodnmali951@gmail.com
    - Linkedin: https://www.linkedin.com/in/pramod-mali-0a5650273




