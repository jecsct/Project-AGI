
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources
# syntax is: resource RESOURCE_TYPE RESOURCE_NAME
# https://www.terraform.io/docs/configuration/resources.html

resource "google_compute_firewall" "frontend_rules" {
  name    = "frontend"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "443", "8000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["balancer"]
}

resource "google_compute_firewall" "quote_rules" {
  name    = "quote"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8001"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["quote"]
}

resource "google_compute_firewall" "get_thought_rules" {
  name    = "get"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8002"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["get"]
}

resource "google_compute_firewall" "send_thought_rules" {
  name    = "send"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8003"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["send"]
}

resource "google_compute_firewall" "web_rules" {
  name    = "web"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web"]
}

resource "google_compute_firewall" "database_rules" {
  name    = "database"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["3306"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["database"]
}

resource "google_compute_firewall" "prometheus_rules" {
  name    = "prometheus"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["9090"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["prometheus"]
}

resource "google_compute_firewall" "grafana_rules" {
  name    = "grafana"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["3000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["grafana"]
}
