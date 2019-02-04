output "internal_ip_address_centos7" {
  value = "${yandex_compute_instance.vm-centos-7.network_interface.0.ip_address}"
}

output "external_ip_address_centos7" {
  value = "${yandex_compute_instance.vm-centos-7.network_interface.0.nat_ip_address}"
}
