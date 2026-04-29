tag @s add wander.trade_checked


execute if score defeated wander.data matches 0 run return 0

execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run data modify entity @s Offers.Recipes append value {maxUses:3,sell:\
{count:1,id:"minecraft:beetroot_soup",components:{item_model:"wander:whey",item_name:{text:"Whey Protein Powder",italic:false},"!minecraft:food":{},"!minecraft:use_remainder":{},consumable:{consume_seconds:3},custom_data:{whey:1b},lore:[{text:"Power comes without consequence.",italic:true}]}}\
,buy:{count:21,id:"minecraft:emerald"},priceMultiplier:0.05f}

execute if predicate {"condition":"minecraft:random_chance","chance":0.75} run data modify entity @s Offers.Recipes append value {maxUses:1,sell:\
{count:1,id:"minecraft:music_disc_cat",components: {"minecraft:item_model":"wander:music_disc_emerald_ultimatum", "minecraft:jukebox_playable": "wander:emerald_ultimatum"}}\
,buy:{count:10,id:"minecraft:emerald"},priceMultiplier:0.05f}

execute unless score slaughterer_defeated wander.data matches 1 run return 0

execute if predicate {"condition":"minecraft:random_chance","chance":0.85} run data modify entity @s Offers.Recipes append value {maxUses:1,sell:\
{count:1,id:"minecraft:music_disc_cat",components: {"minecraft:item_model":"wander:music_disc_amethyst_altercation", "minecraft:jukebox_playable": "wander:amethyst_altercation"}}\
,buy:{count:20,id:"minecraft:emerald"},priceMultiplier:0.05f}