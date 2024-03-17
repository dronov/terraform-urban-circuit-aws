## Simulated Payment Provider Startup - Terraform Infrastructure Setup

This repository contains Terraform code to set up the infrastructure for a simulated payment provider startup company. The infrastructure is designed to comply with PCI-DSS certification requirements, specifically addressing inbound and outbound traffic restrictions.

## Task Description

The task involves addressing the missing PCI-DSS certification requirements (1.3.1 and 1.3.2) related to inbound and outbound traffic restrictions. Additionally, the infrastructure setup needs to be automated using Terraform for AWS Cloud.

## Requirements:
Implement inbound traffic restrictions to limit access to specific IP addresses.
Restrict outbound traffic to only necessary destinations.

## Possible architecture:
                      +----------------------------------+
                      |                                  |
                      |              Internet            |
                      |                                  |
                      +------------------+---------------+
                                         |
                      +------------------+---------------+
                      |                  |               |
                      |                  |               |
                      |                  |               |
                      |                  |               |
                      |                  |   VPC, etc    |
                      |                  |     security  |
                      |                  |     groups    |
                      |                  |               |
                      |         +--------v---------+     |
                      |         |                  |     |
                      |         |     ALB          |     |
                      |         | (Application)    |     |
                      |         |                  |     |
                      |         +--------+---------+     |
                      |                  |               |
                      |         +--------v---------+     |
                      |         |                  |     |
                      |         |     EC2          |     |
                      |         | (Application)    |     |
                      |         |                  |     |
                      |         +--------+---------+     |
                      |                  |               |
                      |         +--------v---------+     |
                      |         |                  |     |
                      |         |     EC2          |     |
                      |         |     (MySQL)      |     |
                      |         |                  |     |
                      |         +------------------+     |
                      |                                  |
                      +------------------+---------------+
              
    
## Commands to Run

Follow these steps to set up the infrastructure using Terraform:

Clone the Repository:

```git clone git@github.com:dronov/terraform-urban-circuit-aws.git```

Navigate to the Project Directory:

```cd terraform-urban-circuit-aws```

Initialize Terraform:

```terraform init```

Review Terraform Plan (Optional):

```terraform plan```

Apply Terraform Changes:

```terraform apply```

Confirm Changes:
Type yes when prompted to confirm the Terraform changes.


Verify Infrastructure:
Once Terraform applies the changes successfully, verify the infrastructure in the AWS Management Console.
Destroy Infrastructure (Optional):

If you want to tear down the infrastructure, you can use:

```terraform destroy```

Type yes when prompted to confirm destruction.

## Notes

Make sure you have AWS credentials configured properly in your environment.
Replace placeholder values such as AMI IDs, CIDR blocks, SSL certificate ARN, etc., with your actual values in the Terraform files.
Ensure you have necessary permissions to create and manage resources in your AWS account.
