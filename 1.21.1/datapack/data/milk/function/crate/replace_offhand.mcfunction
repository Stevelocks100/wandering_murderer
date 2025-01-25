summon item ~ ~ ~ {Tags:["milk.offhand_replace"],Item:{id:"acacia_boat",count:1},PickupDelay:0s}
data modify entity @n[tag=milk.offhand_replace] Owner set from entity @s UUID
data modify entity @n[tag=milk.offhand_replace] Item set from entity @s Inventory[{Slot:-106b}]
item replace entity @s weapon.offhand with air

