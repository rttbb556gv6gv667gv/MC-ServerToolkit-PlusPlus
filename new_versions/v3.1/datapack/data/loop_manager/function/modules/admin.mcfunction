# ============================================
# Admin Module Tick
# ============================================
# Her 2 tick'te bir çalışır

# Counter reset
scoreboard players set #admin loop.counter 0

# Flag kontrolü
execute unless score #admin_loop global matches 1 run return 0

# Trigger kontrolü
execute as @a[scores={gulce_trigger=1..}] run function custom_admin:run/trigger

# Ana döngüleri çalıştır
function custom_admin:handler/loop/main
function custom_admin:handler/loop/permissions
function custom_admin:group/check
