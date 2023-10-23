# Terraform GCP
# To output variables, follow pattern:
# value = TYPE.NAME.ATTR

output "balancer_ssh" {
 value = google_compute_instance.balancer.self_link
}

output "database_ssh" {
 value = google_compute_instance.database.self_link
}

output "balancer" {
    value = join(" ", google_compute_instance.balancer.*.network_interface.0.access_config.0.nat_ip)
}

output "database" {
    value = join(" ", google_compute_instance.database.*.network_interface.0.access_config.0.nat_ip)
}

output "web_IPs"  {
  value = formatlist("%s = %s", google_compute_instance.web[*].name, google_compute_instance.web[*].network_interface.0.access_config.0.nat_ip)
}

output "quote_IPs"  {
  value = formatlist("%s = %s", google_compute_instance.quote[*].name, google_compute_instance.quote[*].network_interface.0.access_config.0.nat_ip)
}

output "get_thoughts_IPs"  {
  value = formatlist("%s = %s", google_compute_instance.get[*].name, google_compute_instance.get[*].network_interface.0.access_config.0.nat_ip)
}

output "send_thoughts_IPs"  {
  value = formatlist("%s = %s", google_compute_instance.send[*].name, google_compute_instance.send[*].network_interface.0.access_config.0.nat_ip)
}

output "prometheus" {
    value = join(" ", google_compute_instance.prometheus.*.network_interface.0.access_config.0.nat_ip)
}

output "grafana" {
    value = join(" ", google_compute_instance.grafana.*.network_interface.0.access_config.0.nat_ip)
}