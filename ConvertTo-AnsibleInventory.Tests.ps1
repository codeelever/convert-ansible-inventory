$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$modules = "$here\*" | gci -include '*.psm1'
$modules |  Import-Module -Force

Describe "ConvertTo-AnsibleInventory" {
    BeforeEach {
      $testobj = Import-CSV "sample-inventory.csv" | Select-Object -First 1    
    }
       
    It "Creates Inventory Group" {
       Create-InventoryGroup $testobj | Should -Be "[group1-test-app]"

    }  
    
    It "Creates Inventory Host" {
      Create-InventoryHost $testobj | Should -Be "group1-test-web-1 ansible_host=x.x.x.x"
    }

}

