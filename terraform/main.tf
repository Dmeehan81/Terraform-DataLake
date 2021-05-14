
data azurerm_resource_group "rg" {
     name      = var.rg-name
}

data azurerm_storage_account "DL" {

    name                 = var.storage-account-name
    resource_group_name  = data.azurerm_resource_group.rg.name
}


resource "azurerm_storage_data_lake_gen2_filesystem" "lake" {
  count              = length(var.container-name)  
  name               = var.container-name[count.index]
  storage_account_id = data.azurerm_storage_account.DL.id
}