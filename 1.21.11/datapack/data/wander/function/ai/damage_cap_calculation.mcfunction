# effective = damage / (1 + max(0, damage - threshold) / scale)

#effective =
#(damage * scale) / --> a
#(scale + excess) --> b

#excess = max(0, rawDamage - threshold) --> excess

# try threshold 60
# scale of 50

# scoreboard is damage_dealt wander.data



#tellraw @a[tag=wander.debug] ["damage dealt before being reduced:",{score:{name:"damage_dealt",objective:"wander.data"}}]

scoreboard players set damage_scale wander.temp 90
scoreboard players set damage_threshold wander.temp 60

scoreboard players operation excess wander.temp = damage_dealt wander.data
scoreboard players operation excess wander.temp -= damage_threshold wander.temp
execute if score excess wander.temp matches ..0 run scoreboard players set excess wander.temp 0

scoreboard players operation a wander.temp = damage_dealt wander.data
scoreboard players operation a wander.temp *= damage_scale wander.temp

scoreboard players operation b wander.temp = damage_scale wander.temp
scoreboard players operation b wander.temp += excess wander.temp

scoreboard players operation a wander.temp /= b wander.temp
scoreboard players operation damage_dealt wander.data = a wander.temp

#tellraw @a[tag=wander.debug] ["damage dealt after being reduced:",{score:{name:"damage_dealt",objective:"wander.data"}}]