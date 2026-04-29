execute on passengers if entity @s[type=text_display] run data modify entity @s text.extra[-1] set value {text:"Out of stock",color:"red"}
data modify entity @s item set value {id:"barrier",count:1}
tag @s add wander.out_of_stock
return 0