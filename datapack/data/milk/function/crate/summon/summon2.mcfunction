$execute if score @s milk.dropped matches 0 positioned ^ ^ ^0.2 run summon armor_stand ~ ~1.5 ~ {Tags:["milk.crate","new"],Small:1b,Invisible:1b,Invulnerable:1b,Motion:$(pos),Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:beetroot_soup",count:1,components:{custom_model_data:732}},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f]}}]}
$execute if score @s milk.dropped matches 1 positioned ^ ^ ^0.2 run summon armor_stand ~ ~1.5 ~ {Tags:["milk.crate","new"],Small:1b,Invisible:1b,Invulnerable:1b,Motion:$(pos),Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:beetroot_soup",count:1,components:{custom_model_data:739}},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f]}}]}
$execute if score @s milk.dropped matches 2 positioned ^ ^ ^0.2 run summon armor_stand ~ ~1.5 ~ {Tags:["milk.crate","new"],Small:1b,Invisible:1b,Invulnerable:1b,Motion:$(pos),Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:beetroot_soup",count:1,components:{custom_model_data:740}},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f]}}]}
$execute if score @s milk.dropped matches 3 positioned ^ ^ ^0.2 run summon armor_stand ~ ~1.5 ~ {Tags:["milk.crate","new"],Small:1b,Invisible:1b,Invulnerable:1b,Motion:$(pos),Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:beetroot_soup",count:1,components:{custom_model_data:741}},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f]}}]}
$execute if score @s milk.dropped matches 4 positioned ^ ^ ^0.2 run summon armor_stand ~ ~1.5 ~ {Tags:["milk.crate","new"],Small:1b,Invisible:1b,Invulnerable:1b,Motion:$(pos),Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:beetroot_soup",count:1,components:{custom_model_data:742}},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f]}}]}
scoreboard players operation @n[tag=milk.crate,tag=new] milk.dropped = @s milk.dropped
tag @n[tag=milk.crate,tag=new] remove new