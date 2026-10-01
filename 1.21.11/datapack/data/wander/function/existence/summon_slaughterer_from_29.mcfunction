
#if a wandering trader was killed

scoreboard players set not_moving wander.data 0

tag @s add wander.slaughterer
data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Invulnerable set value 0b
function aj:wander/remove/all
execute unless entity @n[tag=aj.wander.root,type=item_display] run function aj:wander/summon {args:{animation:'jump_upward',frame:10,variant:'slaughterer'}} 
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/slaughterer/apply

scoreboard players set ai wander.data 20


