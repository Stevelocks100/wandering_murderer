tag @s add wander.wander_checked
execute if score defeated wander.data matches 0 run return 0
execute store result score random wander.temp run random value 1..2
execute if score random wander.temp matches 1 run return 0
data modify entity @s Offers.Recipes append value {maxUses:3,sell:{count:1,id:"minecraft:beetroot_soup",components:{custom_model_data:760,custom_name:'{"text":"Whey Protein Powder","italic":false}',food:{nutrition:0,saturation:0,can_always_eat:true,eat_seconds:999999},custom_data:{whey:1b}}},buy:{count:7,id:"minecraft:emerald"},priceMultiplier:0.05f}