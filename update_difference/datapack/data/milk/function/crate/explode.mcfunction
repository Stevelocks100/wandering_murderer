playsound minecraft:block.trial_spawner.break player @a[distance=0..32] ~ ~ ~ 2.0 1.0 0.0
particle item{item:{id:"minecraft:beetroot_soup",components:{item_model:"wander:milk_crate"}}} ~ ~0.5 ~ 0.2 0.2 0.2 0.1 20 normal @a
execute positioned ~ ~1 ~ if score @s milk.dropped matches 1.. run function milk:crate/summon_bottle1
execute positioned ~ ~1 ~ if score @s milk.dropped matches 2.. run function milk:crate/summon_bottle1
execute positioned ~ ~1 ~ if score @s milk.dropped matches 3.. run function milk:crate/summon_bottle1
execute positioned ~ ~1 ~ if score @s milk.dropped matches 4.. run function milk:crate/summon_bottle1

execute on passengers run kill @s
kill @s