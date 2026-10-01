

# 10 seconds of silence >:)
# slightly less cuz of the randomness of sword attack.
scoreboard players set #silence_duration mm_const 200

execute if score @s mm_silenced matches 1.. run return 0

scoreboard players operation @s mm_silenced = #silence_duration mm_const
function spells:cast/component/silence/apply_effects
