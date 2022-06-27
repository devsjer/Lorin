resource "azurerm_resource_group" "elite_general_connection" {
  name     = "elite_general_connection"
  location = lower("EASTUS")
}
resource "azurerm_virtual_network" "elitedev_vnet1" {
  name                = "elitedev_vnet1"
  location            = azurerm_resource_group.elite_general_connection.location
  resource_group_name = azurerm_resource_group.elite_general_connection.name
  address_space       = ["10.0.0.0/16"]
}


resource "azurerm_route_table" "elitedev_route2" {
  name                          = "elitedev_route2"
  location                      = azurerm_resource_group.elite_general_connection.location
  resource_group_name           = azurerm_resource_group.elite_general_connection.name
  disable_bgp_route_propagation = false

  route {
    name           = "elitedev-route"
    address_prefix = "10.0.0.0/16"
    next_hop_type  = "VnetLocal"
  }
}
resource "azurerm_subnet" "application_subnet1" {
  name                 = "application_subnet1"
  resource_group_name  = azurerm_resource_group.elite_general_connection.name
  virtual_network_name = azurerm_virtual_network.elitedev_vnet1.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_network_security_group" "elite_devnsg1" {
  name                = "elite_devnsg1"
  location            = azurerm_resource_group.elite_general_connection.location
  resource_group_name = azurerm_resource_group.elite_general_connection.name
}
resource "azurerm_subnet_network_security_group_association" "elite_devnsg_assoc_application_subnet1" {
  subnet_id                 = azurerm_subnet.application_subnet1.id
  network_security_group_id = azurerm_network_security_group.elite_devnsg1.id
}
resource "azurerm_subnet_route_table_association" "elitedev_assoc" {
  subnet_id      = azurerm_subnet.application_subnet1.id
  route_table_id = azurerm_route_table.elitedev_route2.id
}