
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources
# syntax is: resource RESOURCE_TYPE RESOURCE_NAME
# https://www.terraform.io/docs/configuration/resources.html

resource "google_compute_firewall" "frontend_rules" {
  name    = "frontend"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "443", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["balancer"]
}

resource "google_compute_firewall" "web_rules" {
  name    = "web"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["5000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web"]
}

resource "google_compute_firewall" "database_rules" {
  name    = "database"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["27017", "3306"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["database"]
}
