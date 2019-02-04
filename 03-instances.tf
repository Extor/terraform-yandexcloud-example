resource "yandex_compute_instance" "vm-centos-7" {
  name                      = "vm-centos-7"
  description               = "First test instance"
  allow_stopping_for_update = true

  resources {
    cores         = 1
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      # CentOs 7
      image_id    = "fd83869rbingor0in0ui"
      name        = "disk-root"
      description = "Disk for the root"
      size        = "${var.instance_root_disk}"
    }
  }

  secondary_disk {
    disk_id     = "${yandex_compute_disk.disk-srv.id}"
    auto_delete = true
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.test-subnet.id}"
    nat       = true
  }

  metadata {
    ssh-keys = "extor:${file("~/.ssh/id_rsa.pub")}"
  }

  labels {
    environment = "test"
  }
}

resource "yandex_compute_disk" "disk-srv" {
  name = "disk-srv"
  type = "network-hdd"
  size = "${var.instance_additional_disk}"

  labels {
    environment = "test"
  }
}
