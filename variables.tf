variable "region" {
  type        = string
  description = "Region where VPC will be created. To find your VPC region, use `ibmcloud is regions` command to find available regions."
}

variable "hs_crypto_instance_name" {
  type        = string
  description = "Optionally, you can bring you own Hyper Protect Crypto Service instance for key management. If you would like to use that instance, add the name here. Otherwise, leave as null"
  default     = null
}

variable "hs_crypto_resource_group" {
  type        = string
  description = "If you're using Hyper Protect Crypto services in a resource group other than `Default`, provide the name here."
  default     = null
}

variable "add_edge_vpc" {
  type        = bool
  description = "Create an edge VPC. This VPC will be dynamically added to the list of VPCs in `var.vpcs`. Conflicts with `create_f5_network_on_management_vpc` to prevent overlapping subnet CIDR blocks."
  default     = false
}

variable "teleport_management_zones" {
  type        = number
  description = "Number of zones to create teleport VSI on Management VPC if not using F5. If you are using F5, ignore this value."
  default     = 0
}

variable "create_f5_network_on_management_vpc" {
  type        = bool
  description = "Set up bastion on management VPC. This value conflicts with `add_edge_vpc` to prevent overlapping subnet CIDR blocks."
  default     = false
}

variable "provision_teleport_in_f5" {
  type        = bool
  description = "Provision teleport VSI in `bastion` subnet tier of F5 network if able."
  default     = false
}

variable "vpn_firewall_type" {
  type        = string
  description = "Bastion type if provisioning bastion. Can be `full-tunnel`, `waf`, or `vpn-and-waf`."
  default     = null
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH Key. Must be an RSA key with a key size of either 2048 bits or 4096 bits (recommended) - See https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys. If key already exists in the deployment region, it will be used and no new key will be created. Use only if provisioning F5 or Bastion Host."
  default     = null
}

variable "f5_image_name" {
  type        = string
  description = "Image name for f5 deployments. Must be null or one of `f5-bigip-15-1-5-1-0-0-14-all-1slot`,`f5-bigip-15-1-5-1-0-0-14-ltm-1slot`, `f5-bigip-16-1-2-2-0-0-28-ltm-1slot`,`f5-bigip-16-1-2-2-0-0-28-all-1slot`,`f5-bigip-16-1-3-2-0-0-4-ltm-1slot`,`f5-bigip-16-1-3-2-0-0-4-all-1slot`,`f5-bigip-17-0-0-1-0-0-4-ltm-1slot`,`f5-bigip-17-0-0-1-0-0-4-all-1slot`]."
  default     = "f5-bigip-17-0-0-1-0-0-4-all-1slot"
  
}

variable "f5_instance_profile" {
  type        = string
  description = "F5 vsi instance profile. Use the IBM Cloud CLI command `ibmcloud is instance-profiles` to see available image profiles."
  default     = "cx2-4x8"
  
}

variable "hostname" {
  type        = string
  description = "The F5 BIG-IP hostname"
  default     = "f5-ve-01"
  
}

variable "domain" {
  type        = string
  description = "The F5 BIG-IP domain name"
  default     = "local"
  
}

variable "tmos_admin_password" {
  type        = string
  description = "admin account password for the F5 BIG-IP instance"
  default     = null
}

variable "license_type" {
  type        = string
  description = "How to license, may be 'none','byol','regkeypool','utilitypool'"
  default     = "none"
  
}

variable "byol_license_basekey" {
  type        = string
  description = "Bring your own license registration key for the F5 BIG-IP instance"
  default     = null
}

variable "license_host" {
  type        = string
  description = "BIGIQ IP or hostname to use for pool based licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_username" {
  type        = string
  description = "BIGIQ username to use for the pool based licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_password" {
  type        = string
  description = "BIGIQ password to use for the pool based licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_pool" {
  type        = string
  description = "BIGIQ license pool name of the pool based licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_sku_keyword_1" {
  type        = string
  description = "BIGIQ primary SKU for ELA utility licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_sku_keyword_2" {
  type        = string
  description = "BIGIQ secondary SKU for ELA utility licensing of the F5 BIG-IP instance"
  default     = null
}

variable "license_unit_of_measure" {
  type        = string
  description = "BIGIQ utility pool unit of measurement"
  default     = "hourly"
  
}

variable "do_declaration_url" {
  type        = string
  description = "URL to fetch the f5-declarative-onboarding declaration"
  default     = "null"
  
}

variable "as3_declaration_url" {
  type        = string
  description = "URL to fetch the f5-appsvcs-extension declaration"
  default     = "null"
  
}

variable "ts_declaration_url" {
  type        = string
  description = "URL to fetch the f5-telemetry-streaming declaration"
  default     = "null"
  
}

variable "phone_home_url" {
  type        = string
  description = "The URL to POST status when BIG-IP is finished onboarding"
  default     = "null"
  
}

variable "template_source" {
  type        = string
  description = "The terraform template source for phone_home_url_metadata"
  default     = "f5devcentral/ibmcloud_schematics_bigip_multinic_declared"
  
}

variable "template_version" {
  type        = string
  description = "The terraform template version for phone_home_url_metadata"
  default     = "20210201"
  
}

variable "app_id" {
  type        = string
  description = "The terraform application id for phone_home_url_metadata"
  default     = "null"
  
}

variable "tgactive_url" {
  type        = string
  description = "The URL to POST L3 addresses when tgactive is triggered"
}

variable "tgstandby_url" {
  type        = string
  description = "The URL to POST L3 addresses when tgstandby is triggered"
  default     = "null"
  
}

variable "tgrefresh_url" {
  type        = string
  description = "The URL to POST L3 addresses when tgrefresh is triggered"
  default     = "null"
  
}

variable "enable_f5_management_fip" {
  type        = bool
  description = "Enable F5 management interface floating IP. Conflicts with `enable_f5_external_fip`, VSI can only have one floating IP per instance."
  default     = false
}

variable "enable_f5_external_fip" {
  type        = bool
  description = "Enable F5 external interface floating IP. Conflicts with `enable_f5_management_fip`, VSI can only have one floating IP per instance."
  default     = false
}

variable "use_existing_appid" {
  type        = bool
  description = "Use an existing appid instance. If this is false, one will be automatically created."
  default     = false
}

variable "appid_name" {
  type        = string
  description = "Name of appid instance."
  default     = "appid"
  
}

variable "appid_resource_group" {
  type        = string
  description = "Resource group for existing appid instance. This value is ignored if a new instance is created."
  default     = null
}

variable "teleport_instance_profile" {
  type        = string
  description = "Machine type for Teleport VSI instances. Use the IBM Cloud CLI command `ibmcloud is instance-profiles` to see available image profiles."
  default     = "cx2-4x8"
  
}

variable "teleport_vsi_image_name" {
  type        = string
  description = "Teleport VSI image name. Use the IBM Cloud CLI command `ibmcloud is images` to see availabled images."
  default     = "ibm-ubuntu-18-04-6-minimal-amd64-2"
  
}

variable "teleport_license" {
  type        = string
  description = "The contents of the PEM license file"
  default     = null
}

variable "https_cert" {
  type        = string
  description = "The https certificate used by bastion host for teleport"
  default     = null
}

variable "https_key" {
  type        = string
  description = "The https private key used by bastion host for teleport"
  default     = null
}

variable "teleport_hostname" {
  type        = string
  description = "The name of the instance or bastion host"
  default     = null
}

variable "teleport_domain" {
  type        = string
  description = "The domain of the bastion host"
  default     = null
}

variable "teleport_version" {
  type        = string
  description = "Version of Teleport Enterprise to use"
  default     = "7.1.0"
  
}

variable "message_of_the_day" {
  type        = string
  description = "Banner message that is exposed to the user at authentication time"
  default     = null
}

variable "teleport_admin_email" {
  type        = string
  description = "Email for teleport vsi admin."
  default     = null
}

variable "create_secrets_manager" {
  type        = bool
  description = "Create a secrets manager deployment."
  default     = false
}

variable "enable_scc" {
  type        = bool
  description = "Enable creation of SCC resources"
  default     = false
}

variable "scc_cred_name" {
  type        = string
  description = "The name of the credential"
  default     = "slz-cred"
  
}

variable "scc_cred_description" {
  type        = string
  description = "Description of SCC Credential"
  default     = "This credential is used for SCC."
  
}

variable "scc_collector_description" {
  type        = string
  description = "Description of SCC Collector"
  default     = "collector description"
  
}

variable "scc_scope_description" {
  type        = string
  description = "Description of SCC Scope"
  default     = "IBM-schema-for-configuration-collection"
  
}

variable "scc_scope_name" {
  type        = string
  description = "The name of the SCC Scope"
  default     = "scope"
  
}

variable "override" {
  type        = bool
  description = "Override default values with custom JSON template. This uses the file `override.json` to allow users to create a fully customized environment."
  default     = false
}

variable "override_json_string" {
  type        = string
  description = "Override default values with custom JSON. Any value here other than an empty string will override all other configuration changes."
}

variable "use_random_cos_suffix" {
  type        = bool
  description = "Add a random 8 character string to the end of each cos instance, bucket, and key."
  default     = true
}

variable "prefix" {
  type        = string
  description = "A unique identifier for resources. Must begin with a lowercase letter and end with a lowercase letter or number. This prefix will be prepended to any resources provisioned by this template. Prefixes must be 16 or fewer characters."
}

variable "enable_transit_gateway" {
  type        = bool
  description = "Create transit gateway"
  default     = true
}

variable "add_atracker_route" {
  type        = bool
  description = "Atracker can only have one route per zone. use this value to disable or enable the creation of atracker route"
  default     = true
}

variable "add_kms_block_storage_s2s" {
  type        = bool
  description = "Whether to create a service-to-service authorization between block storage and the key management service."
  default     = true
}

variable "vpcs" {
  type        = list(string)
  description = "List of VPCs to create. The first VPC in this list will always be considered the `management` VPC, and will be where the VPN Gateway is connected. VPCs names can only be a maximum of 16 characters and can only contain lowercase letters, numbers, and - characters. VPC names must begin with a lowercase letter and end with a lowercase letter or number."
  default     = ["management", "workload"]
}

variable "tags" {
  type        = list(string)
  description = "List of resource tags to apply to resources created by this module."
  default     = []
}

variable "network_cidr" {
  type        = string
  description = "Network CIDR for the VPC. This is used to manage network ACL rules for cluster provisioning."
  default     = "10.0.0.0/8"
  
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources."
  sensitive = true
}

