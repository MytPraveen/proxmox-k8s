resource "proxmox_virtual_environment_vm" "this" {

  node_name = var.node_name
  vm_id     = var.vm_id
  name      = var.vm_name

  clone {
    vm_id = var.template_id
  }

  cpu {
    cores = var.cpu_cores
    type  = "host"
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.datastore
    interface    = "scsi0"
    size         = var.disk_size
  }

  network_device {
    bridge = var.bridge
  }

  initialization {

    datastore_id = var.datastore

    ip_config {
      ipv4 {
        address = "${var.ip_address}/24"
        gateway = var.gateway
      }
    }

    user_account {
      username = var.username

      keys = [
        var.ssh_public_key
      ]
    }
  }

  agent {
    enabled = true
  }
}

