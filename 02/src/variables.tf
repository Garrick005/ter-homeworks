###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gcjrlk0i1d3op3q77a"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1geh8jbc1scqn4i6uuh"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_d" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_w" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_d" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "os_family" {
  type        = string
  default     = "ubuntu-2404-lts"
  description = "yandex_compute_image"
}

variable "vms_metadata" {
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAO7qdZdXTLa7pTCruSRgPltyFNrIveJrxoe9ZznmzPs master@krypt"
  }
}

variable "env" {
  type        = string
  default     = "develop"
  }

variable "project" {
  type        = string
  default     = "platform"
  }

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAO7qdZdXTLa7pTCruSRgPltyFNrIveJrxoe9ZznmzPs master@krypt"
  description = "ssh-keygen -t ed25519"
}

###Задание 8

variable "test" {
  type = list(map(list(string)))
}
