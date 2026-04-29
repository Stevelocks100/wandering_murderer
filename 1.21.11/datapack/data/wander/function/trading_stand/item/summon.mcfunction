
#{offer_item:{id: "cobblestone", count: 1}, global_limit: "true", cost: {name: "item.minecraft.diamond", amount: 9, id: "diamond"}, max_amount: 9, uuid: 23894174}

$summon item_display ~ ~ ~ {Tags:["wander.trading_stand_item","new"],item:$(offer_item),data:$(cost),item_display:"ground",transformation:{translation:[0,0.25,0],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1]},Passengers:[\
{id:"interaction",width:0.5,height:1.0,Tags:["wander.trading_stand_item_int"]},\
{id:"text_display",Tags:["wander.trading_stand_item_text"],background:0,shadow:true,text:[{text:"$(item_name)",bold:true},"\n",$(cost_text),"\n",$(amount_text)],billboard:"vertical",transformation:{translation:[0,0.25,0],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[0,0,0]},interpolation_duration:5}\
]}

$data merge entity @n[tag=wander.trading_stand_item,tag=new,type=item_display,distance=0..0.1] {data:{global_limit:"$(global_limit)",stock:$(max_amount),uuid:$(uuid),item_limit:"$(item_limit)"}}
execute store result score @n[tag=wander.trading_stand_item,tag=new,type=item_display,distance=0..0.1] wander.rotation_velocity run random value 20..100
tag @n[tag=wander.trading_stand_item,tag=new,type=item_display,distance=0..0.1] remove new

