schedule function ss:cooldown 1t

function ss:aac_honey_badger
function ss:fn_p90
function ss:browning_auto_5
function ss:vsk_94
function ss:glock_33
function ss:gives/main

# gives the player tags depending on the gun they are holding:
execute as @a run execute if items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{aac_honey_badger:1}] run tag @s add aac_honey_badger
execute as @a run execute if items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{aac_honey_badger:1}] run tag @s add aac_honey_badger
execute as @a run execute if items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{glock_33:1}] run tag @s add glock_33
execute as @a run execute if items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{vsk_94:1}] run tag @s add vsk_94
execute as @a run execute if items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{browning_auto_5:1}] run tag @s add browning_auto_5


execute as @a run execute unless items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{aac_honey_badger:1}] run tag @s remove aac_honey_badger
execute as @a run execute unless items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{aac_honey_badger:1}] run tag @s remove aac_honey_badger
execute as @a run execute unless items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{glock_33:1}] run tag @s remove glock_33
execute as @a run execute unless items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{vsk_94:1}] run tag @s remove vsk_94
execute as @a run execute unless items entity @a weapon.mainhand carrot_on_a_stick[custom_data~{browning_auto_5:1}] run tag @s remove browning_auto_5

#displays reload if reloading
execute as @a[scores={reload_cooldown=1..}] run title @s actionbar {"text":"Reloading..."}

execute at @e[type=arrow,nbt={inGround:1b}] run particle minecraft:crit ~ ~ ~ .1 .1 .1 0 10 normal
kill @e[type=arrow,nbt={inGround:1b}]

scoreboard players reset @a[scores={Rclick=1..}] Rclick