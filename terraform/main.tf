module "rg" {
    source = "./modules/rgroup"
}

module "network" {
    source = "./modules/vnet"
  
    grp       = module.rg.rg_name
    location  = module.rg.location
}

module "vm" {
    source = "./modules/vm"
  
    grp       = module.rg.rg_name
    location  = module.rg.location
    nic_ids   = module.network.nic_ids
    subnet_id = module.network.subnet_id
}