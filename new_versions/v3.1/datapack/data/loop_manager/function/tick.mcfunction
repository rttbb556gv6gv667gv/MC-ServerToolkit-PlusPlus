# ============================================
# Loop Manager - Main Tick
# ============================================
# minecraft:tick tag'inden çağrılır
# Her modül kendi interval'inde çalışır

# Oyuncu yoksa çalışma
execute unless entity @a run return 0

# Global tick (her 3 tick)
scoreboard players add #global loop.counter 1
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global

# Admin tick (her 2 tick)
scoreboard players add #admin loop.counter 1
execute if score #admin loop.counter >= #admin loop.interval run function loop_manager:modules/admin

# Addons tick (her 5 tick)
scoreboard players add #addons loop.counter 1
execute if score #addons loop.counter >= #addons loop.interval run function loop_manager:modules/addons

# Security tick (her 40 tick)
scoreboard players add #security loop.counter 1
execute if score #security loop.counter >= #security loop.interval run function loop_manager:modules/security

# Menu tick (her tick)
execute if score #menu loop.counter >= #menu loop.interval run function loop_manager:modules/menu

# Player tracker (her 20 tick)
scoreboard players add #tracker loop.counter 1
execute if score #tracker loop.counter >= #tracker loop.interval run function loop_manager:modules/tracker

# Command Alias tick (her tick)
function command_alias:tick
