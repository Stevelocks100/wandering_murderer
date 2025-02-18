scoreboard players set tower_explosion wander.data 0
#scoreboard players set max_jenga wander.temp 0
#summon marker ~ ~2 ~ {Tags:["wander.tower_collapse"]}

#execute positioned ~ ~2 ~ run function wander:tower_collapse/recursive_jenga
function wander:tower_collapse/tree/upwards/init
execute if score do_griefing milk.settings matches 1 positioned ~ ~1 ~ run setblock ~ ~ ~ air destroy
