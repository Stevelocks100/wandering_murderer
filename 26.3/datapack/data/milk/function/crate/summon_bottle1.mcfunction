execute store result storage milk:temp motion.x double 0.004 run random value -150..150
execute store result storage milk:temp motion.y double 0.004 run random value 100..250
execute store result storage milk:temp motion.z double 0.004 run random value -150..150
data modify storage milk:temp motion.uuid set from entity @s data.uuid
function milk:crate/summon_bottle2 with storage milk:temp motion
playsound entity.player.splash