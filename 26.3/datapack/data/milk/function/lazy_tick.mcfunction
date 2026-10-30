schedule function milk:lazy_tick 1s


execute unless score droplet_count milk.temp matches 1.. unless score puddle_count milk.temp matches 1.. if entity @n[tag=milk.droplet,type=armor_stand] run function milk:puddle_schedule
execute unless score droplet_count milk.temp matches 1.. unless score puddle_count milk.temp matches 1.. if entity @n[tag=milk.puddle,type=armor_stand] run function milk:puddle_schedule

execute unless score milk_count milk.temp matches 1.. unless score crate_count milk.temp matches 1.. if entity @n[tag=milk.milk,type=armor_stand] run function milk:milk_schedule
execute unless score milk_count milk.temp matches 1.. unless score crate_count milk.temp matches 1.. if entity @n[tag=milk.crate,type=armor_stand] run function milk:milk_schedule


