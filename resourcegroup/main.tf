# Create a resource Group
resource "azurerm_resource_group" "myreso" {
    name = "myreso"
    location = "eastus"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "myvnet" {
    name = "Myvnet"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.myreso.location
    resource_group_name = azurerm_resource_group.myreso.name
    tags = {
      "Name" = "Myvnet" 
    }
  
}

# Create a subnet

resource "azurerm_subnet" "mysubnet" {
    name = "Mysubnet-1"
    resource_group_name = azurerm_resource_group.myreso.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = ["10.0.2.0/24"]
  
}

# Create a Public Ip
resource "azurerm_public_ip" "publicIp" {
    name = "MyIp-1"
    resource_group_name = azurerm_resource_group.myreso.name
    location = azurerm_resource_group.myreso.location
    allocation_method = "Static"
    tags = {
      "Name" = "MyIp-1"  # tags are the arguments of this resource (Map value Liya jata h)
                          # it is just a arguments with the map value
    }
  
}

# Create Network interface 
resource "azurerm_network_interface" "myinterface" {
    name = "myinterface-1"
    resource_group_name = azurerm_resource_group.myreso.name
    location = azurerm_resource_group.myreso.location
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.mysubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.publicIp.id
    }                                     #its a argument of this value but its a block.
  
}