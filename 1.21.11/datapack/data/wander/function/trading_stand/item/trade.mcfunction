advancement grant @p[tag=wander.current_player] only wander:story/successful_trade
execute if data entity @s item{id:"minecraft:dragon_egg"} run advancement grant @p[tag=wander.current_player] only wander:story/dragon_egg
execute if data entity @s item."components"."minecraft:custom_data"{mystery: 1b} run advancement grant @p[tag=wander.current_player] only wander:story/mystery_box
execute at @n[tag=aj.wander.root] positioned ~ ~2 ~ run playsound entity.wandering_trader.yes hostile @a[distance=0..70] ~ ~ ~ 1.0 0.6 0.0
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/sit_yes/play
summon item ~ ~ ~ {PickupDelay:5s,Motion:[0,0.25,0],Item:{id:"stick",count:1},Tags:["wander.trading_stand_traded_item","new"]}
data modify entity @n[tag=wander.trading_stand_traded_item,tag=new,type=item,distance=0..0.1] Item set from entity @s item
data modify entity @n[tag=wander.trading_stand_traded_item,tag=new,type=item,distance=0..0.1] Owner set from entity @p[tag=wander.current_player] UUID
tag @n[tag=wander.trading_stand_traded_item,tag=new,type=item,distance=0..0.1] remove new
execute if score amount wander.temp matches ..0 run function wander:trading_stand/item/out_of_stock

