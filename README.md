# AWS / Terraform Lab 1 #
### __Test lab for deploying AWS resources using Terraform.__ ###

### main.tf ###
- General configuration.
- Define AWS credential location and profile. 
- Recommend using AWS SSO configuration via AWS CLI v2. 

### network.tf ###
- Defines VPC and subnet.
- Defines ingress/egress rules.

### ec2-instances.tf ###
- Define virtual machine instances.
- Uses 'count' to determine number of instances to build.

### variables.tf ###
- Project variables. 
- Uses 'data source' to get 'ami_id' for latest Ubuntu version.