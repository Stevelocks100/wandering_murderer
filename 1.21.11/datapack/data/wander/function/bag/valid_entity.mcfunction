execute if entity @s[type=!#wander:can_stash] run return 0
execute if entity @s[tag=wander] run return 0
execute if data entity @s {PersistenceRequired:1b} run return 0
execute if data entity @s CustomName run return 0
execute if data entity @s Passengers run return 0
execute if entity @s[tag=wander.from_bag] run return 0
return 1