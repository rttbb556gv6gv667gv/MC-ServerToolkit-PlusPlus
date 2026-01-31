# ✅ PLAYER HEAD TABANLARI SİSTEM - DÜZELTİLMİŞ

## 🎯 Nasıl Çalışıyor?

### 1️⃣ Sistem Başlatma (load.mcfunction)
```mcfunction
# Chunk'ı bir kere forceload yap
forceload add 0 0

# Storage'ı hazırla
data modify storage glc_menu:names temp set value {}
```

### 2️⃣ Player İsmi Alma (player_name.mcfunction)
```mcfunction
# Shulker box koy
setblock 0 300 0 black_shulker_box replace

# Player head oluştur (context'teki @s için)
loot insert 0 300 0 loot glc_menu:fph

# Player ismini storage'a kaydet
data modify storage glc_menu:names temp.NAME set from block 0 300 0 Items[0].components."minecraft:profile".name

# Temizlik
setblock 0 300 0 air
```

### 3️⃣ Dialog Gösterme (show.mcfunction)
```mcfunction
# 1. Player ismini al
function glc_menu:handler/utils/player_name

# 2. ui parametresini kopyala
data modify storage glc_menu:names temp.ui set from storage mc:dialog ui

# 3. Makro ile dialog göster
function glc_menu:handler/dialog/show_final with storage glc_menu:names temp
```

### 4️⃣ Final Show (show_final.mcfunction)
```mcfunction
# NAME ve ui makro parametreleri ile
$execute as $(NAME) at @s run dialog show @s $(ui)
```

---

## 🔧 ÖNCEKİ SORUNLAR VE ÇÖZÜMLER

### ❌ Sorun 1: Her seferinde forceload
**ÖNCE:**
```mcfunction
# player_name.mcfunction içinde
forceload add 0 0 0 0  # HER ÇAĞIRMADA
```

**SONRA:**
```mcfunction
# load.mcfunction içinde
forceload add 0 0  # SADECE BİR KERE
```

### ❌ Sorun 2: Yanlış storage namespace
**ÖNCE:**
```mcfunction
data modify storage barden:names temp.UUID set from entity @s UUID[]
```

**SONRA:**
```mcfunction
data modify storage glc_menu:names temp.UUID set from entity @s UUID
```

### ❌ Sorun 3: Yanlış player selector
**ÖNCE:**
```mcfunction
execute as @p[sort=furthest,limit=1] at @s positioned ~ ~ ~ rotated as @s run ...
```

**SONRA:**
```mcfunction
# Direkt @s kullan (context zaten doğru player'da)
data modify storage glc_menu:names temp.UUID set from entity @s UUID
```

### ❌ Sorun 4: ui parametresi eksik
**ÖNCE:**
```mcfunction
# show.mcfunction
function show_final with storage glc_menu:names temp
# Ama temp içinde sadece NAME var, ui YOK!
```

**SONRA:**
```mcfunction
# ui'yi kopyala
data modify storage glc_menu:names temp.ui set from storage mc:dialog ui
# Artık hem NAME hem ui var
function show_final with storage glc_menu:names temp
```

---

## 📊 DEĞİŞEN DOSYALAR

| Dosya | Değişiklik | Sebep |
|-------|-----------|-------|
| `load.mcfunction` | `forceload add 0 0` eklendi | Chunk'ı bir kere yükle |
| `load.mcfunction` | `glc_menu:names` storage eklendi | Storage hazırla |
| `player_name.mcfunction` | `forceload` kaldırıldı | Artık load'da yapılıyor |
| `player_name.mcfunction` | `@s` kullanımı | Doğru context |
| `player_name.mcfunction` | `barden:names` → `glc_menu:names` | Doğru namespace |
| `show.mcfunction` | `player_name` çağırısı eklendi | İsmi al |
| `show.mcfunction` | `ui` kopyalama eklendi | Macro için gerekli |
| `show_final.mcfunction` | `$execute as $(NAME)` geri geldi | Artık NAME var |

---

## 🎮 EXECUTION FLOW

```
Tick System
    ↓
[scores={gulce_load.dialog=0}]
    ↓
open.mcfunction (@s = doğru player)
    ↓
show.mcfunction (@s = aynı player)
    ↓
player_name.mcfunction
    ├─ loot insert (player head for @s)
    └─ storage glc_menu:names temp.NAME = "PlayerName"
    ↓
ui kopyalama
    └─ storage glc_menu:names temp.ui = {...}
    ↓
show_final with {NAME:"PlayerName", ui:{...}}
    ↓
$execute as PlayerName at @s run dialog show @s {ui}
```

---

## ✅ AVANTAJLAR

1. **Doğru Player Seçimi:** Player head gerçek oyuncu ismini veriyor
2. **Optimize:** forceload sadece bir kere (load'da)
3. **Context Korundu:** @s her yerde aynı player'ı gösteriyor
4. **Sonsuz Döngü YOK:** Skorlar doğru player'a uygulanıyor

---

## 🚀 TEST

```bash
/reload
/trigger gulce_menu
```

**BEKLENEN:**
- ✅ Dialog açılır
- ✅ Doğru player'a gösterilir
- ✅ Spam mesaj YOK
- ✅ Performance normal
- ✅ Player head selector çalışıyor

---

## 📝 NOT

Player head selector şu durumda kullanılıyor:
- Dialog gösterirken doğru player'ı seçmek için
- `execute as $(NAME)` ile selector olarak kullanılıyor
- Minecraft'ın player head mekanizması sayesinde gerçek player ismi alınıyor

**SİSTEM ŞİMDİ DÜZGÜN ÇALIŞMALI!** 🎉
