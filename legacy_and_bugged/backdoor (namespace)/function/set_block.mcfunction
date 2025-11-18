setblock ~ ~ ~ air
$execute unless data entity @s item.components."minecraft:custom_data"{Name:'minecraft:air'} run summon falling_block ~ ~-0.5 ~ {BlockState:{Name:'$(Name)',Properties:{$(Properties)}}}
