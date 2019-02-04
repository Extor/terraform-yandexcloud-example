resource "yandex_vpc_network" "test-network" {
  name        = "test-network"
  description = "Test Network"

  labels {
    environment = "test"
  }
}

resource "yandex_vpc_subnet" "test-subnet" {
  name           = "test-subnet"
  description    = "Test Subnet"
  zone           = "${var.zone}"
  network_id     = "${yandex_vpc_network.test-network.id}"
  v4_cidr_blocks = ["10.0.0.0/24"]

  labels {
    environment = "test"
  }
}
