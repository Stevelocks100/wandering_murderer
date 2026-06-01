# Generated with MC-Build

function wander:trader_dimension/gear/equip_gear {slot:"armor.head",armor:"helmet"}
function wander:trader_dimension/gear/equip_gear {slot:"armor.chest",armor:"chestplate"}
function wander:trader_dimension/gear/equip_gear {slot:"armor.legs",armor:"leggings"}
function wander:trader_dimension/gear/equip_gear {slot:"armor.feet",armor:"boots"}
function wander:trader_dimension/gear/equip_weapon {slot:"weapon.mainhand",tool:"sword"}
execute if predicate {"condition":"minecraft:random_chance","chance":0.33} run function wander:trader_dimension/gear/equip_weapon {slot:"weapon.mainhand",tool:"axe"}