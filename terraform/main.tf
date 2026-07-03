locals {
  ssh_public_key = trimspace(file("~/.ssh/id_rsa.pub"))
}

module "k8s_master" {
  source = "./modules/vm"

  node_name   = "pve"
  vm_id       = 101
  vm_name     = "k8s-master"
  template_id = 9000

  cpu_cores      = 2
  memory         = 4096
  disk_size      = 50
  data_disk_size = 20

  datastore = "local-lvm"
  bridge    = "vmbr0"

  ip_address = "192.168.0.65"
  gateway    = "192.168.0.1"

  username       = "praveen"
  ssh_public_key = local.ssh_public_key
}

module "k8s_worker1" {
  source = "./modules/vm"

  node_name   = "pve"
  vm_id       = 102
  vm_name     = "k8s-worker1"
  template_id = 9000

  cpu_cores      = 2
  memory         = 4096
  disk_size      = 50
  data_disk_size = 20

  datastore = "local-lvm"
  bridge    = "vmbr0"

  ip_address = "192.168.0.66"
  gateway    = "192.168.0.1"

  username       = "praveen"
  ssh_public_key = local.ssh_public_key
}

module "k8s_worker2" {
  source = "./modules/vm"

  node_name   = "pve"
  vm_id       = 103
  vm_name     = "k8s-worker2"
  template_id = 9000

  cpu_cores      = 2
  memory         = 4096
  disk_size      = 50
  data_disk_size = 20

  datastore = "local-lvm"
  bridge    = "vmbr0"

  ip_address = "192.168.0.67"
  gateway    = "192.168.0.1"

  username       = "praveen"
  ssh_public_key = local.ssh_public_key
}