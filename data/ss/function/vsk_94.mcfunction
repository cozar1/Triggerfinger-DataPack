#displays ammo if not reloading
execute as @a[scores={reload_cooldown=..0},tag=vsk_94] run title @s actionbar ["",{"text":"Ammo: ["},{"score":{"name":"@s","objective":"vsk_94_ammo"}},{"text":"/"},{"text":"1"},{"text":"]"}]

# ----- Bullet Stuff ------------------------------------------------------------------------------------------------------------
execute as @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0},tag=vsk_94] rotated as @s positioned 0 0 0 align xyz run summon minecraft:armor_stand ^ ^ ^1 {Invulnerable:1b,NoGravity:1b,Tags:["aim"]}

execute at @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0},tag=vsk_94] run summon minecraft:arrow ~ ~1.5 ~ {Tags:["fireball"]}

execute at @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0},tag=vsk_94] positioned ~ ~1.5 ~ as @e[distance=..1,tag=fireball] positioned 0 0 0 store result score @s MotionX run data get entity @e[tag=aim,limit=1] Pos[0] 1000
execute at @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0},tag=vsk_94] positioned ~ ~1.5 ~ as @e[distance=..1,tag=fireball] positioned 0 0 0 store result score @s MotionY run data get entity @e[tag=aim,limit=1] Pos[1] 1000
execute at @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0},tag=vsk_94] positioned ~ ~1.5 ~ as @e[distance=..1,tag=fireball] positioned 0 0 0 store result score @s MotionZ run data get entity @e[tag=aim,limit=1] Pos[2] 1000

kill @e[tag=aim]

execute as @e[tag=fireball] store result entity @s Motion[0] double 0.002 run scoreboard players get @s MotionX
execute as @e[tag=fireball] store result entity @s Motion[1] double 0.002 run scoreboard players get @s MotionY
execute as @e[tag=fireball] store result entity @s Motion[2] double 0.002 run scoreboard players get @s MotionZ
# ----- Bullet Stuff ------------------------------------------------------------------------------------------------------------


# removes ammo from the player when their gun cooldown and reload cooldown are zero
execute if items entity @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0}] weapon.mainhand carrot_on_a_stick[custom_data~{vsk_94:1}] run scoreboard players remove @p vsk_94_ammo 1
# sets the players gun cooldown when they click and not currenty reloading or in cooldown
execute if items entity @a[scores={Rclick=1..,gun_cooldown=..0,reload_cooldown=..0}] weapon.mainhand carrot_on_a_stick[custom_data~{vsk_94:1}] run scoreboard players set @p gun_cooldown 4

# If the player has clicked, doesnt have any ammo and isnt currently reloading it will reload
execute as @a[scores={Rclick=1..,vsk_94_ammo=..0,reload_cooldown=..0}] run scoreboard players set @s reload_cooldown 20
# if the player isnt currentling reloading and has not ammo then it reloads the ammo because this can only happen after the reload has started.
scoreboard players set @a[scores={reload_cooldown=..0,vsk_94_ammo=..0}] vsk_94_ammo 1