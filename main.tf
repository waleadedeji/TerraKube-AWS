provider "aws" {
  region  = "${var.adminregion}"
  profile = "${var.adminprofile}"
}

module "s3" {
  source = "./modules/s3"
}

module "tls" {
  source = "./modules/tls"
}

module "vpc" {
  source          = "./modules/vpc"
  adminregion     = "${var.adminregion}"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  vpc_cidr        = "${var.vpc_cidr}"
  private1_cidr   = "${var.private1_cidr}"
  private2_cidr   = "${var.private2_cidr}"
  public1_cidr    = "${var.public1_cidr}"
  public2_cidr    = "${var.public2_cidr}"
  subnetaz1       = "${var.subnetaz1}"
  subnetaz2       = "${var.subnetaz2}"
}

module "security" {
  source     = "./modules/security"
  depends-on = "${module.vpc.dependency}"
  vpcid      = "${module.vpc.aws_vpc.id}"
  iplock     = "${var.iplock}"
}

module "route53" {
  source       = "./modules/route53"
  depends-on   = "${module.vpc.dependency}"
  internal-tld = "${var.internal-tld}"
  vpcid        = "${module.vpc.aws_vpc.id}"
  cluster-name = "${var.cluster-name}"
}

module "iam" {
  source = "./modules/iam"
}

module "etcd" {
  source = "./modules/kubernetes/etcd"
}

module "kubemaster" {
  source = "./modules/kubernetes/kubemaster"
}

module "kubenode" {
  source = "./modules/kubernetes/kubenode"
}

#module "kubeadmin" {


#  source = "./modules/kubernetes/kubeadmin"


#}

