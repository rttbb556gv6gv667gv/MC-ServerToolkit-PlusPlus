# ============================================
# Addons Module Tick
# ============================================
# Her 5 tick'te bir çalışır

# Counter reset
scoreboard players set #addons loop.counter 0

# Flag kontrolü
execute unless score #main global matches 1 run return 0

# Permission tick systems
execute as @a at @s run function custom:permissions/admin/tick
execute as @a at @s run function custom:permissions/owner/tick
execute as @a at @s run function custom:permissions/mod/tick
execute as @a at @s run function custom:permissions/builder/tick

# Trigger enables
function custom:permissions/enable_admin_triggers
function custom:permissions/enable_owner_triggers

# Scoreboard operations
scoreboard objectives add permission_level trigger
scoreboard players enable @a[tag=Admin] permission_level

# Data storage
data modify storage custom:storage Log set from storage userfunc:log
data modify storage custom:storage Data set from storage userfunc:data

# Special handlers
function custom:freeze_handler
