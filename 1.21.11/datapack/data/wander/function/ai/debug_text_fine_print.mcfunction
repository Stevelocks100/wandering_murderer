
data modify storage wander:temp debug append value {text:", AI: ",color:"green"}
data modify storage wander:temp debug append value {underlined:true,score:{name:"ai",objective:"wander.fine_print"},color:"green"}

execute unless score timer wander.fine_print matches 600.. run data modify storage wander:temp debug append value {text:", Timer: ",color:"green"}
execute unless score timer wander.fine_print matches 600.. run data modify storage wander:temp debug append value {underlined:true,score:{name:"timer",objective:"wander.fine_print"},color:"green"}

execute if score ai wander.fine_print matches 2 if entity @p[tag=wander.fine_print.target] run data modify storage wander:temp debug append value {text:", Target: ",color:"green"}
execute if score ai wander.fine_print matches 2 if entity @p[tag=wander.fine_print.target] run data modify storage wander:temp debug append value {selector:"@p[tag=wander.fine_print.target]",color:"green"}

execute unless score ai wander.fine_print matches 1 run data modify storage wander:temp debug append value {text:", Position: ",color:"green"}
execute unless score ai wander.fine_print matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"current_pos",objective:"wander.fine_print"},color:"green"}
execute unless score ai wander.fine_print matches 1 run data modify storage wander:temp debug append value {text:" = ",color:"green"}
execute unless score ai wander.fine_print matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"desired_pos",objective:"wander.fine_print"},color:"green"}