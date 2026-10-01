# Generated with MC-Build

scoreboard players add timer1 wander.music.tps 1
scoreboard players add timer2 wander.music.tps 1
# execute store result score watch1 <%prefix%>.tps run stopwatch query <%namespace%>/timer1 10
# execute store result score watch2 <%prefix%>.tps run stopwatch query <%namespace%>/timer2 10
execute if score timer1 wander.music.tps matches 74.. run function wander:murderer_music/tps_counter/zzz/0
execute if score timer2 wander.music.tps matches 74.. run function wander:murderer_music/tps_counter/zzz/1
execute store result storage wander:music gm.y float 1 run scoreboard players get timer1 wander.music.tps
execute store result storage wander:music gm.x float 0.1 run stopwatch query wander:music/timer1 10
data modify storage wander:music gm.decimal set value {}
function gm:divide with storage wander:music gm
data modify storage wander:music gm.decimal.x set from storage gm:io out
function gm:reciprocal with storage wander:music gm.decimal
data modify storage wander:music gm.tps_1 set from storage gm:io out
execute store result storage wander:music gm.y float 1 run scoreboard players get timer2 wander.music.tps
execute store result storage wander:music gm.x float 0.1 run stopwatch query wander:music/timer2 10
data modify storage wander:music gm.decimal set value {}
function gm:divide with storage wander:music gm
data modify storage wander:music gm.decimal.x set from storage gm:io out
function gm:reciprocal with storage wander:music gm.decimal
data modify storage wander:music gm.tps_2 set from storage gm:io out
execute if score timer1 wander.music.tps matches 37.. run data modify storage wander:music tps set from storage wander:music gm.tps_1
execute if score timer2 wander.music.tps matches 37.. run data modify storage wander:music tps set from storage wander:music gm.tps_2
execute store result score tps wander.music.tps run data get storage wander:music tps