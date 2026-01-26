tellraw @a[tag=gulce_debug] "[GulceOS] Restarting..."

scoreboard objectives add gulceos.const dummy
function custom_admin:load
function custom_admin:handler/load/1
function glc_menu:handler/load
function cooldown:init
scoreboard players set #loaded gulceos.const 1
data modify storage custom:storage Temp.Trigger set value []
data modify storage custom:storage Temp.Trigger append value {"command":"say ✅","number":1,"score":"ap_test","tag":"op"}
data modify storage custom:storage Temp.Trigger append value {"command":"say ❌","number":2,"score":"ap_test","tag":"op"}
data modify storage mc:config Config.Enabled set value 0b
data remove storage mc:config Config
data remove storage mc:trg ui
scoreboard objectives remove gulce_click
scoreboard objectives remove gulce_menu
scoreboard objectives remove gulce_load.dialog
scoreboard objectives remove gulce_cooldown
scoreboard objectives remove gulce_id
scoreboard objectives remove gulce_perm
scoreboard objectives remove gulce_timer
scoreboard objectives remove gulce_trigger
scoreboard objectives remove ap_gamemode
scoreboard objectives remove ap_cc
scoreboard objectives remove ap_help
scoreboard objectives remove ap_homeGUI
scoreboard objectives remove ap_rain
scoreboard objectives remove ap_update
scoreboard objectives remove ap_time
schedule clear global:tick
schedule clear main:loop/init
