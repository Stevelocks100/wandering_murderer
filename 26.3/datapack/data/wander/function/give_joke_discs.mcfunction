execute store result score discs wander.temp run clear @s music_disc_cat[item_model="wander:music_disc_hmmerald_hmmteramatum"] 0
execute if score discs wander.temp matches 1.. run return 0

execute store result score discs wander.temp run clear @s music_disc_cat[item_model="wander:music_disc_meg"] 0
execute if score discs wander.temp matches 1.. run return 0

give @s music_disc_cat[item_model="wander:music_disc_hmmerald_hmmteramatum",jukebox_playable="wander:hmmerald_hmmteramatum"]
give @s music_disc_cat[item_model="wander:music_disc_meg",jukebox_playable="wander:meg"]