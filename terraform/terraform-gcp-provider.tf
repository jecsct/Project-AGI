# Terraform Google Cloud Deployment

provider "google" {
    credentials = file("<key_file_location>.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
