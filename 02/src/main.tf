resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_w" {
  name           = "${var.vpc_name}-w"
  zone           = var.default_zone_d
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_w
}

resource "yandex_vpc_subnet" "develop_d" {
  name           = "${var.vpc_name}-d"
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_d
}

data "yandex_compute_image" "ubuntu" {
  family = var.os_family
}

# vm_web
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone_d
  
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy.preemptible
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_w.id
    nat       = true
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

# vm_db
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.default_zone_b
  
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_scheduling_policy.preemptible
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_d.id
    nat       = true
  }
  
  metadata = var.vms_metadata

}
