# Terraform Google Cloud Deployment

provider "google" {
    credentials = file("../agisit-project-g1-key.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
