execute store result score milk_count milk.temp if entity @n[tag=milk.milk,type=armor_stand]
execute store result score crate_count milk.temp if entity @n[tag=milk.crate,type=armor_stand]

execute as @e[tag=milk.milk,type=armor_stand] at @s run function milk:as_milk
execute as @e[tag=milk.crate,type=armor_stand] at @s run function milk:as_crate

execute if score milk_count milk.temp matches 1.. run return run schedule function milk:milk_schedule 1t
execute if score crate_count milk.temp matches 1.. run return run schedule function milk:milk_schedule 1t