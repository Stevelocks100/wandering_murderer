
execute positioned ^ ^ ^30 positioned over motion_blocking_no_leaves positioned ~ ~2 ~ facing entity @s eyes run function wander:spawn_search/raycast1


scoreboard players remove rotation wander.data 1
execute if score rotation wander.data matches 1.. rotated ~5 0 run function wander:spawn_search/rotate