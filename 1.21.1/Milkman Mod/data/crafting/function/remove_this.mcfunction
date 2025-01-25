execute as @e[tag=crafting.slot,limit=9,sort=nearest] on passengers at @s run function crafting:remove_this2

execute as @e[tag=crafting.slot,limit=9,sort=nearest] on passengers run kill @s

kill @e[tag=crafting.slot,limit=9,sort=nearest]
kill @n[tag=crafting.pointer]
kill @n[tag=crafting.data]
kill @s