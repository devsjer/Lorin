resource "azurerm_network_interface" "elite_interface" {
  name                = "elite_interface-nic"
  location            = azurerm_resource_group.elite_general_connection.location
  resource_group_name = azurerm_resource_group.elite_general_connection.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.application_subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.elitedev_pip.id
  }
   }
resource "azurerm_public_ip" "elitedev_pip" {
  name                = "elitedev_pip"
  resource_group_name = azurerm_resource_group.elite_general_connection.name
  location            = azurerm_resource_group.elite_general_connection.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vmdev"
  resource_group_name = azurerm_resource_group.elite_general_connection.name
  location            = azurerm_resource_group.elite_general_connection.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.elite_interface.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./vmkey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}