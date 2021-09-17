terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = var.oauth_token
#  service_account_key_file = "key.json"
  cloud_id = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "vm-1"


  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "var.ubuntu"
    }
  }

  network_interface {
    subnet_id = "yandex_vpc_subnet.default.id"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

  resource "yandex_vpc_network" "default" {
    name = "net"
  }

  resource "yandex_vpc_subnet" "default" {
    name           = "subnet"
    zone           = "ru-central1-a"
    network_id     = "yandex_vpc_network.default.id"
    v4_cidr_blocks = ["192.168.10.0/24"]
  }

  output "internal_ip_address_vm_1" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
  }

  output "external_ip_address_vm_1" {
    value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
  }
