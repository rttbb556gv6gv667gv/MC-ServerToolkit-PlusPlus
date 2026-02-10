# ============================================
# Alias: Clear & Announce
# ============================================
# Trigger ID: 2
# Cooldown: 60 seconds
# Permission: mod

# Check permission (mod or higher)
execute unless entity @s[tag=mod] run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
clear @s
tellraw @a ["",{"text":"[Server] ","color":"gold"},{"selector":"@s"},"'nin",{"text":" envanteri temizlendi!","color":"yellow"}]

# Visual feedback
title @s actionbar {"text":"🗑 Envanter temizlendi!","color":"green"}
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 1 0.5

# Start cooldown
function command_alias:cooldown/start {seconds:60}