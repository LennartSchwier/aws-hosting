# Hosting a website with AWS and Terraform
**Hosting a simple static website using different AWS services and Terraform.**
<br/>
<br/>
**Requirements are:**
- **high availability**
- **low latency**
- **autoscaling**


## Installation and project set up
If you have used terraform with AWS before, you may skip points 1 - 4.

### 1. Sign up to AWS
Since this infrastructure will be deployed on AWS, the first step is to 
[sign up](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start/email)
for AWS.

### 2. Install AWS CLI
The AWS CLI needs to be installed next. Complete instructions for your local machine can be
found [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

### 3. Authenticate to AWS
To communicate with AWS using the CLI, you have to authenticate to AWS. 
This will be done in two steps:
1. Create a new user in the Identity and Access Management (IAM) service of your AWS console. 
This user needs to have programmatic access which will generate an access key ID and secret access key. 
Furthermore, he needs the *CloudFrontFullAccess* and *AmazonEC2FullAccess* permissions as a minimum for this project.
2. Enter `aws configure` in your CLI and enter the just generated access key ID and secret access key. 
Next, chose a region (e.g., `eu-central-1`) and specify the output format as `json`.

### 4. Install Terraform
After having completed the AWS set up, the next step is to install Terraform. Please visit the Terraform 
[installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)
and, again, follow the steps according to your local machine.

### 5. Get the code
Clone the repository from GitHub and go to the main project folder with:
```
git clone https://github.com/LennartSchwier/aws-hosting.git
```
and 
```
cd aws-hosting
```

## Run Terraform
Now the whole set up is completed, and you are ready to start using Terraform to host a website. 
This will be done in several steps:
### 1. Initialize the backend.
```
terraform init
```
This command will install all necessary Terraform files in the project's directory.

### 2. Create a plan of the changes to the AWS environment.
```
terraform plan
```
You will be asked to enter values for some variables (default values in parenthesis):
- desired number of provisioned instances (2)
- instance type (t2.micro)
- maximum number of instances (3)
- minimum number of instances (1)
- project name (cloud-programming)
- project region (eu-central-1)

### 3. Apply the changes.
```
terraform apply
```
Once this process is completed, Terraform outputs the status of the CloudFront 
distribution and the corresponding domain name. To visit the website, enter the address into your browser or 
use `curl --url https://[...].cloudfront.net`.

### 4. Clean Up.
```
terraform destroy
```
This command will, after confirmation, destroy all resources that have been created with `terraform apply`.

### Use default variable values.
```
terraform plan/apply/destroy -var-file="variables.tfvars"
```
The `-var-file="variables.tfvars"` option can be used in connection with the `plan`, `apply`, and `destroy` commands to use 
the default values for the variables as stated above.