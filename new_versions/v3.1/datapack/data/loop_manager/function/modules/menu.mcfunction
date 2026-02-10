# ============================================
# Menu Module Tick
# ============================================
# Her tick çalışır

# Trigger kontrolü
execute as @a[scores={gulce_menu=1..}] run function glc_menu:handler/trigger
execute as @a[scores={gulce_menu=-512}] run function glc_menu:handler/trigger

# Loading skorları azalt
scoreboard players remove @a[scores={gulce_load.dialog=1..}] gulce_load.dialog 1

# Dialog göster
execute as @a[scores={gulce_load.dialog=0},tag=glc.show_pending] run function glc_menu:handler/dialog/open

# Tag temizliği
tag @a[tag=closed.glc] remove closed.glc
tag @a[tag=glc.close_dialog] remove glc.close_dialog

# Trigger enable
scoreboard players enable @a[tag=gulce_admin] gulce_trigger
scoreboard players enable @a[tag=gulce_admin] gulce_menu
