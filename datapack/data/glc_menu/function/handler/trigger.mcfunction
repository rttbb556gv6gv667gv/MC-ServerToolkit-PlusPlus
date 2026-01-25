# ═══════════════════════════════════════════════════
# GLC Menu - Trigger Handler
# ═══════════════════════════════════════════════════

# Cooldown kontrolü
function glc_menu:handler/main

# Menü 1: Ana Menü
execute if score @s gulce_menu matches 1 run function glc_menu:handler/builder/main

# Menü 2: İzin Listesi (Dinamik)
execute if score @s gulce_menu matches 2 run function glc_menu:handler/builder/permissions

# Menü 3: Düzenleme Menüsü
execute if score @s gulce_menu matches 3 run function glc_menu:handler/builder/edit

# Kapat
execute if score @s gulce_menu matches 4 run function glc_menu:handler/close

# Trigger sıfırla
scoreboard players set @a gulce_menu 0

# Trigger yeniden aktif
scoreboard players enable @s gulce_menu

# CD Ayarla (Kapalı)
execute unless score @s gulce_cooldown matches 1.. run scoreboard players set @s gulce_cooldown 0