$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$modules = "$here\*" | gci -include '*.psm1'
$modules |  Import-Module -Force

Describe "ConvertTo-AnsibleInventory" {
    $obj = Import-CSV "inventory.csv" | Select-Object -First 1 
       
    It "Creates Inventory Group" {
       $obj = Import-CSV "inventory.csv" | Select-Object -First 1
       Create-InventoryGroup $obj | Should -Be "[group1-test-app]"

    }  
    
    It "Creates Inventory Host" {
      $obj = Import-CSV "inventory.csv" | Select-Object -First 1
      Create-InventoryHost $obj | Should -Be "group1-test-web-1 ansible_host=x.x.x.x"
    }

}

