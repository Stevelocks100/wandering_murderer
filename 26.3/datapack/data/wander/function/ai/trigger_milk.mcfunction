tag @s add wander.milk_reset
item replace entity @s weapon.mainhand with stick[item_model="wander:empty",use_remainder={id:"milk_bucket",count:1,components:{item_model:"wander:empty"}}]
attribute @s scale modifier add wander:milk_reset -1 add_multiplied_total