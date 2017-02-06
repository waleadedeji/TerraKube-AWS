### Module etcd

variable "depends-on" {}

# template variables
variable "adminregion" {}

variable "internal-tld" {}

variable "bucketname" {}

variable "capem" {}

variable "etcdpem" {}

variable "etcdkey" {}

### ASG variables

variable "lc_name" {}

variable "ownerid" {}

variable "ami_name" {}

variable "channel" {}

variable "virtualization_type" {}

variable "instance_type" {}

variable "iam_instance_profile" {}

variable "key_name" {}

variable "security_group" {}

variable "userdata" {}

variable "etcd_nodes_az1" {
  type = "map"
}

variable "etcd_nodes_az2" {
  type = "map"
}

variable "etcd_nodes_az3" {
  type = "map"
}

### ASG configuration for each AZ

variable "asg_name_az1" {}

variable "asg_maxsize_az1" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_minsize_az1" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_normsize_az1" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_name_az2" {}

variable "asg_maxsize_az2" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_minsize_az2" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_normsize_az2" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_name_az3" {}

variable "asg_maxsize_az3" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_minsize_az3" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

variable "asg_normsize_az3" {
  description = "The minimum number of instances the ASG should maintain"
  default     = 1
}

# Subnet IDs for ASG

variable "subnet_in_az1" {
  description = "The VPC subnet ID in AZ1"
  type        = "list"
}

variable "subnet_in_az2" {
  description = "The VPC subnet IDs in AZ2"
  type        = "list"
}

variable "subnet_in_az3" {
  description = "The VPC subnet IDs in AZ3"
  type        = "list"
}

## Availability Zones specified in VPC module

variable "az1" {
  description = "Availability Zones"
  type        = "list"
}

variable "az2" {
  description = "Availability Zones"
  type        = "list"
}

variable "az3" {
  description = "Availability Zones"
  type        = "list"
}

# ASG Health checks - switch EC2 to ELB if attaching ELB

variable "health_check_grace_period" {
  description = "Number of seconds for a health check to time out"
  default     = 300
}

variable "health_check_type" {
  default = "EC2"
}

variable "environment" {
  default = "Staging"
}

## EBS volumes

variable "ebs_encrypted" {
  default = "True"
}

variable "ebs_size" {
  default = "20"
}

variable "ebs_type" {
  default = "standard"
}
