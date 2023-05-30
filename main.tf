/*
original contents:

module "landing-zone-vpc" {
  source           = "https://cm.globalcatalog.cloud.ibm.com/api/v1-beta/offering/source//patterns/vpc?archive=tgz&flavor=standard&kind=terraform&name=deploy-arch-ibm-slz-vpc&version=v3.8.3"
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = "us-south"
  prefix           = "slz-vpc"
}
*/

locals {
  basename = var.prefix
}

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}



resource "ibm_is_vpc" "vpc" {
  resource_group              = data.ibm_resource_group.group.id
  name                        = "${local.basename}-vpc"
  default_security_group_name = "${local.basename}-sec-group"
  default_network_acl_name    = "${local.basename}-acl-group"
}


output "prefix" {
  value = var.prefix
}

output "region" {
  value = var.region
}

output "vpc" {
  value = {
    id = ibm_is_vpc.vpc.id
  }
}
