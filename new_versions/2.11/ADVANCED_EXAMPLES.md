# 🎯 İLERİ SEVİYE KULLANIM ÖRNEKLERİ

## GULCE Admin Power - Advanced Usage Examples

---

## 1️⃣ ZAMANLANMIŞ EVENTLER

### Mini Oyun Başlatıcı
```mcfunction
# Hazırlık aşaması
/function broadcast:send {title:"MİNİ OYUN",message:"30 saniye içinde başlıyor!",color:"yellow"}

# 10 saniye uyarısı
/function scheduler:add {time:400,command:"function broadcast:send {title:'DİKKAT',message:'10 saniye kaldı!',color:'red'}",player:"@a"}

# Oyun başlangıcı
/function scheduler:add {time:600,command:"function minigame:start",player:"@a"}
```

### Otomatik Restart Uyarı Sistemi
```mcfunction
# 5 dakika uyarısı
/function broadcast:send {title:"RESTART",message:"5 dakika içinde sunucu yeniden başlatılacak!",color:"red"}

# 1 dakika uyarısı
/function scheduler:add {time:4800,command:"function broadcast:send {title:'RESTART',message:'1 dakika kaldı! Lütfen güvenli yere gidin.',color:'red'}",player:"@a"}

# 10 saniye sayacı
/function scheduler:add {time:5800,command:"title @a title {\"text\":\"10\",\"color\":\"red\"}",player:"@a"}
/function scheduler:add {time:5820,command:"title @a title {\"text\":\"9\",\"color\":\"red\"}",player:"@a"}
/function scheduler:add {time:5840,command:"title @a title {\"text\":\"8\",\"color\":\"red\"}",player:"@a"}
# ... devam et

# Restart
/function scheduler:add {time:6000,command:"stop",player:"@a"}
```

---

## 2️⃣ OYUNCU YÖNETİMİ

### AFK Tespit Sistemi
```mcfunction
# Oyuncu konumunu kaydet
/execute as @a run function player_tracker:save_player_data

# 5 dakika sonra aynı yerde mi kontrol et
/function scheduler:add {time:6000,command:"function afk:check_position",player:"@a"}

# AFK ise uyar
# afk:check_position fonksiyonunda:
# execute if entity @s[x=100,y=64,z=200,dx=0,dy=0,dz=0] run kick @s AFK
```

### Yeni Oyuncu Hoşgeldin Paketi
```mcfunction
# Yeni oyuncu tespit edildiğinde (advancement ile)
# Hoşgeldin mesajı
/tellraw @s [{"text":"Hoşgeldin ","color":"gold"},{"selector":"@s","color":"yellow"},{"text":"!","color":"gold"}]

# 5 saniye sonra kuralları göster
/function scheduler:add {time:100,command:"function server:show_rules",player:"@s"}

# 10 saniye sonra başlangıç kiti ver
/function scheduler:add {time:200,command:"function server:give_starter_kit",player:"@s"}

# 30 saniye sonra spawn'a ışınla
/function scheduler:add {time:600,command:"tp @s 0 100 0",player:"@s"}
```

---

## 3️⃣ OTOMATK GÖREVLER

### Periyodik Mesajlar
```mcfunction
# İlk mesaj
/function broadcast:send {title:"İPUCU",message:"Discord sunucumuza katılmayı unutma!",color:"blue"}

# Her 10 dakikada bir tekrarla (fonksiyon içinde kendini tekrar çağır)
# tip_rotation.mcfunction:
function broadcast:send {title:"İPUCU",message:"...",color:"blue"}
function scheduler:add {time:12000,command:"function server:tip_rotation",player:"@a"}
```

### Otomatik Yedekleme
```mcfunction
# Her 1 saatte bir yedek al
/function scheduler:add {time:72000,command:"save-all",player:"@a"}
/function scheduler:add {time:72000,command:"function broadcast:send {title:'YEDEKLEME',message:'Dünya yedeklendi!',color:'green'}",player:"@a"}
```

### Geceyarısı Temizliği
```mcfunction
# Her 20 dakikada entity temizliği
/function scheduler:add {time:24000,command:"kill @e[type=item,distance=..100]",player:"@a"}
/function scheduler:add {time:24000,command:"kill @e[type=arrow,distance=..100]",player:"@a"}
/function scheduler:add {time:24000,command:"function broadcast:send {title:'TEMİZLİK',message:'Entity temizliği yapıldı!',color:'aqua'}",player:"@a"}
```

---

## 4️⃣ PVP SİSTEMLERİ

### Duello Başlatıcı
```mcfunction
# Duello isteği
/tellraw @a [{"text":"[DUELLO] ","color":"red","bold":true},{"selector":"@s","color":"yellow"},{"text":" vs ","color":"white"},{"selector":"@a[name=rakip]","color":"yellow"}]

# 5 saniye hazırlık
/function broadcast:send {title:"DUELLO",message:"5 saniye içinde başlıyor!",color:"yellow"}

# Countdown
/function scheduler:add {time:80,command:"title @a[tag=duello] title {\"text\":\"3\",\"color\":\"gold\"}",player:"@a"}
/function scheduler:add {time:100,command:"title @a[tag=duello] title {\"text\":\"2\",\"color\":\"yellow\"}",player:"@a"}
/function scheduler:add {time:120,command:"title @a[tag=duello] title {\"text\":\"1\",\"color\":\"red\"}",player:"@a"}
/function scheduler:add {time:140,command:"title @a[tag=duello] title {\"text\":\"BAŞLA!\",\"color\":\"green\"}",player:"@a"}

# Başlangıç efektleri
/function scheduler:add {time:140,command:"effect give @a[tag=duello] resistance 3 255 true",player:"@a"}
```

### Kill Streak Sistemi
```mcfunction
# Oyuncu kill yaptığında
/scoreboard players add @s killstreak 1

# 3 kill
/execute if score @s killstreak matches 3 run function broadcast:send {title:"STREAK",message:"@s 3 kill yaptı!",color:"yellow"}

# 5 kill - bonus
/execute if score @s killstreak matches 5 run function scheduler:add {time:1,command:"give @s golden_apple 1",player:"@s"}
/execute if score @s killstreak matches 5 run function broadcast:send {title:"RAMPAGE",message:"@s 5 kill yaptı!",color:"gold"}

# 10 kill - mega bonus
/execute if score @s killstreak matches 10 run function scheduler:add {time:1,command:"effect give @s strength 30 1",player:"@s"}
```

---

## 5️⃣ ÖZEL EVENTLER

### Rastgele Airdrop Sistemi
```mcfunction
# Her 15 dakikada bir rastgele konuma airdrop
/function scheduler:add {time:18000,command:"function events:airdrop_random",player:"@a"}

# events:airdrop_random içinde:
summon chest ~ ~50 ~ {Items:[...]}
function broadcast:send {title:"AIRDROP",message:"Gökyüzüne bakın!",color:"gold"}

# 3 saniye sonra düşür
function scheduler:add {time:60,command:"execute at @e[type=chest,tag=airdrop] run summon falling_block ~ ~ ~ {BlockState:{Name:\"chest\"}}",player:"@a"}
```

### Boss Event
```mcfunction
# Boss spawn uyarısı
/function broadcast:send {title:"BOSS",message:"30 saniye içinde boss spawn olacak!",color:"red"}

# Koordinat göster
/function scheduler:add {time:200,command:"tellraw @a {\"text\":\"Boss Konumu: X:100 Y:64 Z:200\",\"color\":\"yellow\"}",player:"@a"}

# Boss spawn
/function scheduler:add {time:600,command:"summon wither 100 64 200 {CustomName:'{\"text\":\"Mega Boss\",\"color\":\"red\"}',Health:500}",player:"@a"}

# 5 dakika sonra kazanan yoksa kaldır
/function scheduler:add {time:6600,command:"tp @e[type=wither,name=\"Mega Boss\"] ~ ~-500 ~",player:"@a"}
```

---

## 6️⃣ EKONOMİ SİSTEMLERİ

### Günlük Ödül Sistemi
```mcfunction
# Son giriş zamanını kaydet
/scoreboard players operation @s last_login = $gametime time

# Günlük ödül kontrolü
execute if score $gametime time >= @s last_login + 24000 run function economy:daily_reward

# economy:daily_reward içinde:
give @s diamond 5
scoreboard players operation @s last_login = $gametime time
tellraw @s {"text":"Günlük ödülünü aldın!","color":"green"}
```

### Otomatik Maaş Sistemi
```mcfunction
# Her 1 saatte maaş
/function scheduler:add {time:72000,command:"function economy:pay_salary",player:"@a"}

# economy:pay_salary içinde:
execute as @a[tag=vip] run function economy:add_money {amount:1000}
execute as @a[tag=member] run function economy:add_money {amount:500}
function broadcast:send {title:"MAAŞ",message:"Maaşlar ödendi!",color:"green"}

# Bir sonraki maaşı planla
function scheduler:add {time:72000,command:"function economy:pay_salary",player:"@a"}
```

---

## 7️⃣ KORUMA SİSTEMLERİ

### Anti-Grief Gecikmeli İşlem
```mcfunction
# Şüpheli oyuncu tespit edildiğinde
/tellraw @a[tag=admin] [{"text":"[UYARI] ","color":"red"},{"selector":"@s"},{"text":" şüpheli davranış gösteriyor!"}]

# 30 saniye bekle
/function scheduler:add {time:600,command:"function antigriefcheck",player:"@s"}

# antigriefcheck içinde:
# Hala şüpheli mi kontrol et
# Eğer öyleyse otomatik ban
execute if entity @s[tag=suspected_griefer] run ban @s Grief detected
```

### Spawn Koruma Uyarısı
```mcfunction
# Spawn'a yakın oyuncuları uyar
execute as @a[x=0,y=64,z=0,distance=..50] run function spawn:check_actions

# spawn:check_actions içinde:
# İlk uyarı
tellraw @s {"text":"Spawn bölgesinde inşaat yasaktır!","color":"red"}

# 3 saniye sonra hala varsa kick
function scheduler:add {time:60,command:"execute as @s[x=0,y=64,z=0,distance=..50] run kick @s Spawn bölgesinde inşaat",player:"@s"}
```

---

## 8️⃣ PARKUR / OYUN MODU

### Parkur Zamanlayıcı
```mcfunction
# Parkur başlangıcı
/scoreboard players set @s parkour_time 0
/tag @s add parkour_active
/tellraw @s {"text":"Parkur başladı! Zamanlayıcı çalışıyor.","color":"green"}

# Her saniye zamanı artır (başka bir tick sisteminde)
execute as @a[tag=parkour_active] run scoreboard players add @s parkour_time 1

# Bitiş noktasında
/tag @s remove parkur_active
/tellraw @s [{"text":"Tamamlandı! Süre: ","color":"green"},{"score":{"name":"@s","objective":"parkour_time"},"color":"gold"},{"text":" saniye"}]
```

### Escape Room
```mcfunction
# Oda başlangıcı
/function broadcast:send {title:"ESCAPE ROOM",message:"5 dakikanız var!",color:"red"}

# 4 dakika uyarısı
/function scheduler:add {time:1200,command:"title @a[tag=escape] subtitle {\"text\":\"1 dakika kaldı!\",\"color\":\"red\"}",player:"@a"}

# Süre doldu
/function scheduler:add {time:6000,command:"function escaperoom:failed",player:"@a"}

# escaperoom:failed içinde:
tp @a[tag=escape] 0 100 0
title @a[tag=escape] title {"text":"BAŞARISIZ!","color":"red"}
tag @a remove escape
```

---

## 9️⃣ ÖZEL KOMUTLAR

### Batch İşlemler
```mcfunction
# Birden fazla zamanlayıcıyı aynı anda başlat
function scheduler:add {time:100,command:"say 5 saniye",player:"@a"}
function scheduler:add {time:200,command:"say 10 saniye",player:"@a"}
function scheduler:add {time:300,command:"say 15 saniye",player:"@a"}
function scheduler:add {time:400,command:"say 20 saniye",player:"@a"}
```

### Dinamik Zamanlama
```mcfunction
# Rastgele zamanlama (0-10 saniye arası)
execute store result score $random temp run random value 0..200
function scheduler:add_dynamic

# scheduler:add_dynamic içinde makro ile:
$function scheduler:add {time:$(random),command:"say Rastgele!",player:"@a"}
```

---

## 🔟 DEBUG VE TEST

### Zamanlayıcı Testi
```mcfunction
# Kısa test
/function scheduler:add {time:20,command:"say Test 1s",player:"@s"}
/function scheduler:add {time:40,command:"say Test 2s",player:"@s"}
/function scheduler:add {time:60,command:"say Test 3s",player:"@s"}

# Listele
/function scheduler:list
```

### Oyuncu Bilgi Testi
```mcfunction
# Kendi bilgilerini göster
/function player_tracker:show_info {player:"@s"}

# Tüm oyuncuları listele
/scoreboard players list @a ply.id
```

---

**Not:** Bu örnekler ileri seviye kullanım içindir. Temel kullanım için KULLANIM_KILAVUZU.md dosyasına bakın.

🚀 **Başarılar!**
