# ============================================
# Alias: Moderator Toolkit
# ============================================
# Trigger ID: 7
# Cooldown: 120 seconds (2 minutes)
# Permission: mod

# Check permission (mod or higher)
execute unless predicate adminpower_predicates:part_7 run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Clear inventory first
clear @s

# Give mod tools
give @s minecraft:stick[custom_name='{"text":"🔨 Mod Stick","color":"red","bold":true,"italic":false}',lore=['{"text":"Moderasyon aracı","color":"gray","italic":false}']]

give @s minecraft:compass[custom_name='{"text":"🧭 Player Tracker","color":"aqua","bold":true,"italic":false}',lore=['{"text":"Oyuncu takibi","color":"gray","italic":false}']]

give @s minecraft:barrier[custom_name='{"text":"🚫 Freeze Tool","color":"dark_red","bold":true,"italic":false}',lore=['{"text":"Oyuncu dondurma","color":"gray","italic":false}']]

# Give night vision
effect give @s minecraft:night_vision 999999 0 true

# Visual feedback
title @s actionbar {"text":"🛡 Moderasyon araçları verildi!","color":"green","bold":true}
playsound minecraft:block.anvil.use master @s ~ ~ ~ 1 1

# Start cooldown
function command_alias:cooldown/start {seconds:120}
