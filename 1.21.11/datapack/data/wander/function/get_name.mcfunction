summon item_display ~ ~ ~ {Tags:["wander.get_player_name"]}
loot replace entity @n[tag=wander.get_player_name,distance=0..0.01,type=item_display] contents loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:item","name":"minecraft:player_head","functions":[{"function":"minecraft:fill_player_head","entity":"this"}]}]}]}
data modify storage wander:temp name set from entity @n[tag=wander.get_player_name,distance=0..0.01,type=item_display] item.components."minecraft:profile".name
kill @e[tag=wander.get_player_name]