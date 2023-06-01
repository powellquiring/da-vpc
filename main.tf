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


resource "ibm_resource_instance" "cos" {
  name              = "${local.basename}-cos"
  resource_group_id = data.ibm_resource_group.group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

locals {
  account_id = split("/", split(":", ibm_resource_instance.cos.id)[6])[1]
}

resource "ibm_cos_bucket" "smart-us-south" {
  bucket_name          = "${local.basename}-bucket-${local.account_id}"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.region
  storage_class        = "smart"
}



output "prefix" {
  value = var.prefix
}

output "region" {
  value = var.region
}

output "cos" {
  value = {
    id = ibm_resource_instance.cos.id
  }
}
