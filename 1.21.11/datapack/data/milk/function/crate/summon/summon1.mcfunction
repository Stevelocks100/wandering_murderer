
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1 positioned ~ ~0.5 ~ run summon marker ~ ~ ~ {Tags:["wander.temp"]} 
data modify storage milk:temp pos set from entity @n[tag=wander.temp] Pos
function milk:gu/generate
data modify storage milk:temp uuid set from storage milk:gu_main out

kill @n[tag=wander.temp]
function milk:crate/summon/summon2 with storage milk:temp

scoreboard players set @s milk.dropped 0