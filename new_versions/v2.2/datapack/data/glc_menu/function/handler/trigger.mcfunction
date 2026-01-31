# ═══════════════════════════════════════════════════
# GLC Menu - Trigger Handler
# ═══════════════════════════════════════════════════

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

# Konsol mesajı
tellraw @s ["",{"text":"[GULCE-MENU] ","color":"gold","bold":true},{"text":"Menü açıldı!","color":"green"}]
tellraw @s ["",{"text":"Tekrar açmak için: ","color":"yellow"},{"text":"/trigger gulce_menu","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/trigger gulce_menu"}}]