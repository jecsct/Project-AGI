# Terraform Google Cloud Deployment

provider "google" {
    credentials = file("probable-analog-402913-f5efdcae88a7.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
