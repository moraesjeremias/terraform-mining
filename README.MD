# Terraform ETH Mining
A simple IAC configuration provisioning resources for ETH mining in AWS

Clone the repo and follow the steps:

## Usage
Init terraform and download provider resources

`terraform init`

Plan and review the services that will be deployed

`terraform plan`

Apply the changes and get your infrastructure up and running

`terraform apply -auto-approve`

SSH into your EC2 instance

`ssh -i "my-key-pair" ubuntu@ec2-<your-ec2-public-ip>.compute-1.amazonaws.com `

Move to NBMiner directory

`cd downloads/NBMiner_Linux`

Start ETH mining :D

`./start_eth.sh`

### Advice
Create a CloudWatch Budget Alarm to keep an eye on your costs!