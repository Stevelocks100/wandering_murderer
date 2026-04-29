$data modify storage wander:trades trading_stand.item.cost set value {id:"$(item)$(block)",amount:$(cost),name:"$(translation_type)$(item)$(block)"}
$data modify storage wander:trades trading_stand.item.cost_text set value [{text:"$(cost) ",color:"gray",bold:false,extra:[{translate:"$(translation_type)$(item)$(block)",fallback:"$(item)$(block)"}]}]
