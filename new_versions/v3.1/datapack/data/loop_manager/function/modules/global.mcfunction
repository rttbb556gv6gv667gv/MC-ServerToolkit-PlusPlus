# ============================================
# Global Module Tick
# ============================================
# Her 3 tick'te bir çalışır

# Counter reset
scoreboard players set #global loop.counter 0

# Flag kontrolü
execute unless score #global_tick global matches 1 run return 0

# Ana işler
advancement revoke @a from global:items/clickable/admin_tool
execute as @e[type=item,distance=..32,limit=20] if items entity @s contents *[minecraft:custom_data~{ConfigUI:1b}] at @s on origin run data merge entity @n[type=item,distance=..0.1] {PickupDelay:0s}
execute unless predicate actions:can_use_panel run clear @a[tag=!op] *[minecraft:custom_data={ConfigUI:1b}]
