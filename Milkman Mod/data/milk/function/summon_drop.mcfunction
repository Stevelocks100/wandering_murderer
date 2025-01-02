execute store result storage milk:temp motion.x double 0.004 run random value -100..100
execute store result storage milk:temp motion.y double 0.004 run random value 50..150
execute store result storage milk:temp motion.z double 0.004 run random value -100..100
execute store result storage milk:temp motion.translation double 0.0001 run random value -9990..-9000
execute store result storage milk:temp motion.size double 0.01 run random value 150..300

function milk:summon_drop2 with storage milk:temp motion