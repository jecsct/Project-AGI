# Google Cloud Project ID
variable "GCP_PROJECT_ID" {
    default = "agisit-project-g1"
}

# A list of machine types is found at: https://cloud.google.com/compute/docs/machine-types
# The cost can be checked at: https://cloud.google.com/compute/pricing#machinetype
variable "GCP_MACHINE_TYPE" {
    default = "n1-standard-1"
}

# Regions list is found at: https://cloud.google.com/compute/docs/regions-zones/regions-zones?hl=en_US
variable "GCP_ZONE" {
    default = "europe-west2-c"
}

# Virtual Machine Disk Size
variable "DISK_SIZE" {
    default = "15"
}
