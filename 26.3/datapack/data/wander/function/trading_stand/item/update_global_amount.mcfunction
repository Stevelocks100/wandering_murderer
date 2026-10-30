$data modify storage wander:trades offers[{uuid:$(uuid)}].max_amount set value $(stock)
$data modify storage wander:trades offers[{uuid:$(uuid)}].amount_text set value {text:"Stock: $(stock)",color:"white",bold:false}
$execute if data storage wander:trades offers[{uuid:$(uuid),max_amount:1}] run data modify storage wander:trades offers[{uuid:$(uuid)}].amount_text set value {text:"Stock: $(stock)",color:"red",bold:false}

$execute if data storage wander:trades offers[{uuid:$(uuid),max_amount:0}] run data remove storage wander:trades offers[{uuid:$(uuid)}]

#$execute if data storage wander:trades offers[{uuid:$(uuid),max_amount:0}] run data modify storage wander:trades offers[{uuid:$(uuid)}].amount_text set value {text:"Out of stock",color:"red"}
#$execute if data storage wander:trades offers[{uuid:$(uuid),max_amount:0}] run data modify storage wander:trades offers[{uuid:$(uuid)}].offer_item set value {id:"barrier",count:1}