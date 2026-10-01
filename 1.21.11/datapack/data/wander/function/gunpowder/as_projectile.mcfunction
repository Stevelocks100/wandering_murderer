particle falling_dust{block_state:{Name:"black_wool"}} ~ ~0.2 ~ 0.3 0.3 0.3 1 10 normal @a[distance=0..30]
summon armor_stand ~ ~ ~ {Tags:["wander.gunpowder","wander.entity"],Invisible:1b,Invulnerable:1b,Small:1b,DisabledSlots:4144959,Silent:1b}
scoreboard players add @s wander.attack_cooldown 1
execute if score @s wander.attack_cooldown matches 100.. run kill
