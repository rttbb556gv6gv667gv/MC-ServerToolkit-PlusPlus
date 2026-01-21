# ═══════════════════════════════════════════════════
# Loading Dialog
# ═══════════════════════════════════════════════════

# Dialog Göster (Loading)
dialog show @s {type:"minecraft:notice",title:"",body:{type:"minecraft:plain_message",contents:{text:"Hazırlanıyor...",bold:1b,italic:0b}},can_close_with_escape:0b,pause:0b,after_action:"none",action:{label:"İptal",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}

# Gösterim bekleyen tag
tag @s add glc.show_pending

# Tag ekle
tag @s add closed.glc

# Dialog Göster (Main)
schedule function glc_menu:handler/dialog/open 43t
