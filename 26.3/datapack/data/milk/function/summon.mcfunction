execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1 positioned ~ ~0.5 ~ summon marker run function milk:summon_motion

function milk:gu/generate
data modify storage milk:temp uuid set from storage milk:gu_main out

function milk:summon2 with storage milk:temp

execute unless score milk_count milk.temp matches 1.. run function milk:milk_schedule