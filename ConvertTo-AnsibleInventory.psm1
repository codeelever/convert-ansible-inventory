function Create-InventoryGroup{
  param(
    $inventoryobject
  )
  $group = $($inventoryobject.group)
  $environment = $($inventoryobject.environment)
  $type = $($inventoryobject.type)
  return "[$group-$environment-$type]"
}
function Create-InventoryHost{
  param(
    $inventoryobject
  )
  $ip=$($inventoryobject.ip)
  $commonname=$($inventoryobject.commonname) -replace ' ', '-'
  return "$commonname ansible_host=$ip"
}

Export-ModuleMember -Function * 
