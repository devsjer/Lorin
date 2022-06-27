resource "azurerm_resource_group" "elite_general_network" {
  name     = "elite_general_network"
  location = lower("EASTUS")
}

# resource "azurerm_network_security_group" "elite_devnsg" {
#   name                = "elite_devnsg"
#   location            = azurerm_resource_group.elite_general_network.location
#   resource_group_name = azurerm_resource_group.elite_general_network.name
# }

# resource "azurerm_virtual_network" "elitedev_vnet" {
#   name                = "elitedev_vnet"
#   location            = azurerm_resource_group.elite_general_network.location
#   resource_group_name = azurerm_resource_group.elite_general_network.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   tags = {
#     environment = "Development"
#     company = "elitesolutionsit"
#     ManagedWith = "terraform"
#   } 
# }
#   resource "azurerm_route_table" "elitedev_rtb" {
#    name                          = "elitedev_rtb"
#    location                      = azurerm_resource_group.elite_general_network.location
#    resource_group_name           = azurerm_resource_group.elite_general_network.name 
#    disable_bgp_route_propagation = false 

# route {
#     name           = "elitedev-route1"
#     address_prefix = "10.0.0.0/16"
#     next_hop_type  = "VnetLocal"
#   }
# }
# resource "azurerm_subnet" "database_subnet" {
#   name                 = "database_subnet"
#   resource_group_name  = azurerm_resource_group.elite_general_network.location
#   virtual_network_name = azurerm_virtual_network.elitedev_vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }
# resource "azurerm_subnet" "application_subnet" {
#   name                 = "application_subnet"
#   resource_group_name  = azurerm_resource_group.elite_general_network.location
#   virtual_network_name = azurerm_virtual_network.elitedev_vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_subnet_network_security_group_association" "elite_devnsg_assoc_database_subnet" {
#   subnet_id                 = azurerm_subnet.database_subnet.id
#   network_security_group_id = azurerm_network_security_group.elite_devnsg.id
# }

# resource "azurerm_subnet_network_security_group_association" "elite_devnsg_assoc_application_subnet" {
#   subnet_id                 = azurerm_subnet.application_subnet.id
#   network_security_group_id = azurerm_network_security_group.elite_devnsg.id
# }

