#Переменные для vm_web_

variable "vm_web_role" {
  type        = string
  default     = "web"
  }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  }

#variable "vm_web_resources" {
#  type = object({
#    cores         = number
#    memory        = number
#    core_fraction = number
#  })
#  default = {
#    cores         = 2
#    memory        = 1
#    core_fraction = 5
#    }
#    
#  }

variable "vm_web_scheduling_policy" {
  type = object({
    preemptible = bool
    })
  default = {
    preemptible = true
    }
}

#Переменные для vm_db_

variable "vm_db_role" {
  type        = string
  default     = "db"
  }

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  }

#variable "vm_db_resources" {
#  type = object({
#    cores         = number
#    memory        = number
#    core_fraction = number
#  })
#  default = {
#    cores         = 2
#    memory        = 2
#    core_fraction = 20
#    }
#    
#  }

variable "vm_db_scheduling_policy" {
  type = object({
    preemptible = bool
    })
  default = {
    preemptible = true
    }
}

#Общие переменные для ресурсов
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
