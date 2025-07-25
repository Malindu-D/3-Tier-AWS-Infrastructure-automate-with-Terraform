# 3-Tier AWS Infrastructure Automation with Terraform

<p align="center">
  <img src="Image/Diagram.png" alt="Project Diagram" width="900"/>
</p>

This repository provides Terraform code to automate the deployment of a 3-tier AWS infrastructure. The solution is modular, scalable, and designed to follow best practices for AWS architecture.

## Features

- Automated provisioning of VPC, public and private subnets, EC2 instances, RDS, security groups, and load balancers.
- State management using a `tfstate` file, allowing for dynamic variable assignment from existing resources.
- Integration with existing AWS resources such as hosted zones and pre-defined key pairs.

## Prerequisites

Before deploying this infrastructure, ensure you have the following:

- **Terraform** installed on your local machine.
- **AWS CLI** configured with appropriate credentials and permissions.
- **Pre-defined EC2 key pair:**
  - You must create the key pair in AWS before using this repository.
  - The name of the key pair should match the value referenced in the Terraform variables.
- **Existing Route 53 Hosted Zone:**
  - The infrastructure expects to use an existing hosted zone.
  - You will also need to create a new hosted zone and add its ID to the `tfstate` file.
