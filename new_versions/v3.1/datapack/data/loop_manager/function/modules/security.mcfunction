# ============================================
# Security Module Tick
# ============================================
# Her 40 tick'te bir çalışır (2 saniye)

# Counter reset
scoreboard players set #security loop.counter 0

# Trigger kontrolü (her tick gerekli)
execute as @a[scores={gss.trigger=1..}] run function gss_security:gui/main_menu
scoreboard players set @a[scores={gss.trigger=1..}] gss.trigger 0
scoreboard players enable @a gss.trigger

# Anti-Xray scan
execute if data storage gss:config {settings:{anti_xray:{enabled:1b}}} run function gss_security:anti_xray/scan

# Admin Vision (sadece aktif admin'ler için)
execute if data storage gss:config {settings:{admin_vision:{enabled:1b}}} as @a[tag=admin,scores={gss.vision=1}] at @s run function gss_security:admin_vision/scan
