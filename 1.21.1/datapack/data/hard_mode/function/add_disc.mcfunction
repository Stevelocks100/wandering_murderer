tag @s add wander.disc_checked
execute unless score hard_mode_defeated wander.data matches 1 run return 0
data modify entity @s Offers.Recipes append value {maxUses:1,sell:{count:1,id:"minecraft:music_disc_cat",components: {"minecraft:custom_model_data": 2, "minecraft:jukebox_playable": {song: "wander:emerald_ultimatum"}}},buy:{count:10,id:"minecraft:emerald"},priceMultiplier:0.05f}