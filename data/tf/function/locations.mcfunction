scoreboard objectives add tp_burnside_og trigger
scoreboard objectives add tp_burnside_map trigger
scoreboard objectives add tp_hub trigger

scoreboard players enable @a tp_burnside_og
scoreboard players enable @a tp_burnside_map
scoreboard players enable @a tp_hub

execute as @a[scores={tp_burnside_og=1..}] run tp @s -55.28 77.70 363.93 540.48 37.65
execute as @a[scores={tp_burnside_map=1..}] run tp @s 0 100 0
execute as @a[scores={tp_hub=1..}] run tp @s 10363.54 262.00 10351.55 1981.17 45.45

scoreboard players reset @a[scores={tp_burnside_og=1..}] tp_burnside_og
scoreboard players reset @a[scores={tp_burnside_map=1..}] tp_burnside_map
scoreboard players reset @a[scores={tp_hub=1..}] tp_hub