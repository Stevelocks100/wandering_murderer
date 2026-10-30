$execute on passengers if entity @s[type=text_display] run data modify entity @s text.extra[-1] set value {text:"Stock: $(stock)",color:"white",bold:false}
#$execute on passengers if entity @s[type=text_display] if data entity @s text.extra[-1].extra[0] run data modify entity @s text.extra[-1].extra[0] set value "Stock: $(stock)"
# maybe 
$execute if data entity @s data{stock:1} on passengers if entity @s[type=text_display] run data modify entity @s text.extra[-1] set value {text:"Stock: $(stock)",color:"red",bold:false}
#$execute if data entity @s data{stock:1} on passengers if entity @s[type=text_display] if data entity @s text.extra[-1].extra[0] run data modify entity @s text.extra[-1] set value {text:"Stock: $(stock)",color:"red",bold:false}
