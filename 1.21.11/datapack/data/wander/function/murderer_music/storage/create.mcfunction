# Generated with MC-Build

function milk:gu/generate
# now in storage milk:gu_main out
data modify storage wander:music temp set value {id:"a"}
data modify storage wander:music temp.id set from storage milk:gu_main out
data modify storage wander:music per_player append from storage wander:music temp
function wander:murderer_music/storage/zzz/0 with storage wander:music temp