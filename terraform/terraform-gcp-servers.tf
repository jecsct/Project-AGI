
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources
# syntax is: resource RESOURCE_TYPE RESOURCE_NAME
# https://www.terraform.io/docs/configuration/resources.html

###########  Load Balancer   #############
resource "google_compute_instance" "balancer" {
    name = "balancer"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # image list can be found at:
        # https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["balancer"]
}

###########  Web Servers   #############
# This method creates as many identical instances as the "count" index value
resource "google_compute_instance" "web" {
    count = 2
    name = "web${count.index+1}"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # image list can be found at:
        # https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }
  tags = ["web"]
}

###########  MySQL Database   #############
resource "google_compute_instance" "database" {
    name = "database"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # Image list can be found at: https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["database"]
}

###########  Quote Service   #############
resource "google_compute_instance" "quote" {
    count = 2
    name = "quote${count.index+1}"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # Image list can be found at: https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }
  tags = ["quote"]
}

###########  Send Thoughts Service   #############
resource "google_compute_instance" "send" {
    count = 1
    name = "send${count.index+1}"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # Image list can be found at: https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }
  tags = ["send"]
}

###########  Get Thoughts Service   #############
resource "google_compute_instance" "get" {
    count = 1
    name = "get${count.index+1}"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
        # Image list can be found at: https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }
  tags = ["get"]
}

###########  Prometheus   #############
resource "google_compute_instance" "prometheus" {
    name = "prometheus"
    machine_type = var.GCP_MACHINE_TYPE
    zone = "europe-west4-b" #we can't have more than 8 IPs in a given region, so Prometheus and Grafana are in other region

    boot_disk {
        initialize_params {
        # image list can be found at:
        # https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["prometheus"]
}

###########  Grafana   #############
resource "google_compute_instance" "grafana" {
    name = "grafana"
    machine_type = var.GCP_MACHINE_TYPE
    zone = "europe-west4-b"

    boot_disk {
        initialize_params {
        # image list can be found at:
        # https://console.cloud.google.com/compute/images
        image = "ubuntu-2004-focal-v20230918"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["grafana"]
}
