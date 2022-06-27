resource "azurerm_network_security_rule" "rule-1" {
  name                        = "ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "184.92.221.250/32"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.elite_general_connection.name
  network_security_group_name = azurerm_network_security_group.elite_devnsg1.name
}
