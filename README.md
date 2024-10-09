
# Nexus Deployment using Terraform, Ansible, and Jenkins Pipeline

## Table of Contents
- [Project Overview](#project-overview)
- [Architecture Diagram](#architecture-diagram)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Pipeline Visualization](#pipeline-visualization)
- [Screenshots](#screenshots)


## Project Overview

This project demonstrates the automated deployment of Nexus Repository Manager using Terraform for infrastructure as code, Ansible for configuration management, and Jenkins for continuous integration and deployment. The aim is to create a scalable and reliable Nexus environment on AWS.

## Architecture Diagram

![diagram-export-10-9-2024-9_04_57-PM](https://github.com/user-attachments/assets/61be7f79-77ed-4575-8329-73f67fa8f8cc)

## Technologies Used

- **Terraform**: For provisioning AWS infrastructure.
- **Ansible**: For configuration management and deployment.
- **Jenkins**: For automating the CI/CD pipeline.
- **AWS**: Cloud service provider.

## Installation

To set up the project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/Andrew-Adel/Nuxus-using-Integration-of-ansible-Jenkins-terraform.git
   cd Nuxus-using-Integration-of-ansible-Jenkins-terraform
   ```

2. Install Terraform and Ansible on your local machine.

3. Configure your AWS credentials:
   ```bash
   aws configure
   ```

## Usage

### Deploying with Terraform

Run the following command to deploy the infrastructure:
```bash
terraform init
terraform apply
```

### Configuring Nexus with Ansible

Once the infrastructure is up, run the Ansible playbook to configure Nexus:
```bash
ansible-playbook playbook.yml
```

## Pipeline Visualization

![image](https://github.com/user-attachments/assets/80d80683-4ef7-4a9b-bb55-3c31b98cb2b9)


## Screenshots

### Nexus User Interface

![Screenshot from 2024-10-09 20-35-35](https://github.com/user-attachments/assets/6a6e9cd7-ced2-4d8c-8b42-5d72985682b8)


### Terminal Outputs

![Screenshot from 2024-10-09 20-35-39](https://github.com/user-attachments/assets/0791957e-71ec-46e3-8a47-56e325139a2a)
