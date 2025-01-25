data remove entity @s interaction
execute on passengers if data entity @s item run return 0
execute on passengers run data modify entity @s item set from entity @p SelectedItem
execute on passengers run data modify entity @s item.count set value 1

item modify entity @p weapon.mainhand crafting:one_less