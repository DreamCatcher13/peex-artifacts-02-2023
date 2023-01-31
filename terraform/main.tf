module "rg" {
    source = "./modules/rgroup"
}

module "network" {
    source = "./modules/vnet"
  
    grp       = module.rg.rg_name
    location  = module.rg.location
}