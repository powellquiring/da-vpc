variable "region" {
  type        = string
  description = "Region where VPC will be created. To find your VPC region, use `ibmcloud is regions` command to find available regions."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "apikey"
}

/*
variable "resource_group" {
  type        = string
  description = "Optionally, you can bring you own Hyper Protect Crypto Service instance for key management. If you would like to use that instance, add the name here. Otherwise, leave as null"
}
*/

variable "prefix" {
  type        = string
  description = "Prefix for all resources."
}
