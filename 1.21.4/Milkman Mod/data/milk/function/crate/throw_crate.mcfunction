advancement revoke @s only milk:throw_crate/throw_crate0
advancement revoke @s only milk:throw_crate/throw_crate1
advancement revoke @s only milk:throw_crate/throw_crate2
advancement revoke @s only milk:throw_crate/throw_crate3
advancement revoke @s only milk:throw_crate/throw_crate4


execute if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_sneaking:0b}}} run return 0

execute unless data entity @s SelectedItem.components."minecraft:custom_data".crate run return 0

execute store result score @s milk.dropped run data get entity @s SelectedItem.components."minecraft:custom_data".bottles
item replace entity @s weapon.mainhand with air
function milk:crate/summon/summon1