ip a
sudo -s
terraform
clear
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
$ sudo yum -y install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
 sudo yum -y install terraform
pwd
mkdir .aws
vi .aws/credentials
pwd
mkdir lab1
cd lab1/
vi providers.tf
more providers.tf 
terraform init
ls -a
file .terraform/providers/registry.terraform.io/hashicorp/aws/5.94.1/linux_amd64/terraform-provider-aws_v5.94.1_x5 
ls -lh .terraform/providers/registry.terraform.io/hashicorp/aws/5.94.1/linux_amd64/terraform-provider-aws_v5.94.1_x5 
vi main.tf
terraform plan
terraform plan -out premiere-creation
terraform apply
terraform apply premiere-creation 
ls *.tf
more main.tf 
terraform destroy
vi main.tf 
terraform apply
ls -l
more terraform.tfstate
more terraform.tfstate.backup 
ls -l
vi main.tf 
terraform apply
more providers.tf 
terraform state list
more main.tf 
cd lab1/
terraform state list
terraform state show data.aws_vpc.default-pvc
terraform state show aws_vpc.vpc-dev
cd lab1
vi main.tf 
cd ../lab2
ls
vi main.tf 
terraform apply
ls
mv output.tf output.tf.orig
terraform apply
more variables.tf 
vi main.tf 
terraform apply
curl 16.171.175.36
terraform state list
terraform state show aws_instance.my_ec2
curl 16.171.175.36
more main.tf 
curl 16.171.175.36
more main.tf 
curl 16.171.175.36
more main.tf 
curl 16.171.175.36
more main.tf 
terraform apply
curl 16.171.175.36
more variables.tf 
more terraform.tfvars 
16.171.175.36 
curl 16.171.175.36
terraform state show aws_instance.my_ec2
curl 16.171.175.36
vi main.tf 
ssh-keygen 
ls -l
vi variables.tf 
vi terraform.tfvars 
vi main.tf 
terraform apply
ssh -i terraform admin@13.50.5.157
terraform apply
curl 13.50.5.157
vi main.tf 
terraform destroy --auto-approve
terraform apply --auto-approve
curl 16.171.148.90
ssh -i terraform admin@16.171.148.90
vi main.tf 
terraform destroy --auto-approve
terraform apply --auto-approve
ssh -i terraform admin@16.171.240.131
more main.tf 
terraform apply --auto-approve
curl 16.171.240.131
ls
vi
vi 
cd lab2
vi main.tf 
more private_ips.txt
more main.tf 
terraform destroy --auto-approve
ls
cd lab2
ls
cd lab2
vi main.tf 
terraform destroy
vi main.tf 
terraform apply
vi main.tf 
terraform apply
curl 16.171.13.5
curl 13.53.134.231
terraform destroy
vi main.tf 
ls
more terraform.tfvars 
vi main.tf 
vi index.html
vi main.tf 
terraform apply
vi main.tf
terraform apply
vi main.tf
terraform apply
vi main.tf
terraform apply
terraform state list
terraform state show aws_instance.my_ec2
vi main.tf 
terraform apply
curl 16.171.140.254
curl 51.21.162.161
vi main.tf 
terraform apply
terraform destroy --auto-approve &
vi main.tf 
terraform apply --auto-approve &
terraform apply --auto-approve
terraform destroy 
ls
who
mkdir lab6
cd lab1
ls
vi main.tf 
vi variables.tf
mkdir module
mkdir module/ec2
vi module/ec2/main.tf
terraform apply
vi  
ls
ls module/
vi main.tf 
mv module/ec2/ module/ec2_instance
terraform init
ls -l
ls -l module/
vi main.tf 
mv module/ modules
terraform init
terraform apply
vi modules/ec2_instance/main.tf 
vi modules/ec2_instance/variables.tf
ll
