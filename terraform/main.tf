
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
  ace {
    type = "user"
    id = "fad176ea-3cae-4dac-aac4-6e21d501cede"
    permissions = "rwx"
  }
   {
    type = "group"
    id = "217c908a-2b89-43a3-9301-9f3e2b76dce6"
    permissions = "rwx"
  }

}

resource "azurerm_storage_data_lake_gen2_filesystem" "prod" { 
  name               = var.prod-containers
  storage_account_id = data.azurerm_storage_account.DL.id
  ace {
    type = "user"
    id = "fad176ea-3cae-4dac-aac4-6e21d501cede"
    permissions = "rwx"
  }
   {
    type = "group"
    id = "217c908a-2b89-43a3-9301-9f3e2b76dce6"
    permissions = "rwx"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "test" { 
  name               = var.test-containers
  storage_account_id = data.azurerm_storage_account.DL.id
  ace {
    type = "user"
    id = "fad176ea-3cae-4dac-aac4-6e21d501cede"
    permissions = "rwx"
  }
   {
    type = "group"
    id = "217c908a-2b89-43a3-9301-9f3e2b76dce6"
    permissions = "rwx"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "prod" {
  count              = length(var.prod-dir)   
  path               = var.prod-dir[count.index]
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.prod.name
  storage_account_id = data.azurerm_storage_account.DL.id
  resource           = "directory"
}

resource "azurerm_storage_data_lake_gen2_path" "test" {
  count              = length(var.test-dir)   
  path               = var.test-dir[count.index]
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.test.name
  storage_account_id = data.azurerm_storage_account.DL.id
  resource           = "directory"
}