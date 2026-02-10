# Hızlı zamanlayıcı presetleri
# Kullanım: /function scheduler:presets/[preset_adi] {player:"oyuncu",extra:"ekstra_parametre"}

# 5 saniye
$function scheduler:add {time:100,command:"say 5 saniye geçti!",player:"$(player)"}

# 10 saniye
$function scheduler:add {time:200,command:"say 10 saniye geçti!",player:"$(player)"}

# 1 dakika
$function scheduler:add {time:1200,command:"say 1 dakika geçti!",player:"$(player)"}

# 5 dakika
$function scheduler:add {time:6000,command:"say 5 dakika geçti!",player:"$(player)"}

tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"Preset zamanlayıcılar başlatıldı!","color":"green"}]
