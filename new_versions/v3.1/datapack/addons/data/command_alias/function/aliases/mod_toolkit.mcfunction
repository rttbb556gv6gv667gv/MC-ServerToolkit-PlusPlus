# ============================================
# Alias: Moderator Toolkit
# ============================================
# Trigger ID: 7
# Cooldown: 120 seconds (2 minutes)
# Permission: mod

# Check permission (mod or higher)
execute unless entity @s[tag=mod] run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Clear inventory first
clear @s

# Give mod tools
function command_alias:aliases/mod_toolkit_macro with storage glc_menu:names temp

# Give night vision
effect give @s minecraft:night_vision 999999 0 true

# Visual feedback
title @s actionbar {"text":"🛡 Moderasyon araçları verildi!","color":"green","bold":true}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1

# Start cooldown
function command_alias:cooldown/start {seconds:120}
