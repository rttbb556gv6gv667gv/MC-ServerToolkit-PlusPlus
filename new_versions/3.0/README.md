# 🔄 Loop Manager - Proper Tick System

**[🇹🇷 Türkçe](#tr)** | **[🇬🇧 English](#en)**

---

<a name="tr"></a>
## 🇹🇷 Türkçe

### ❌ Problem: Schedule Sistemi

Eski sistemde her modül kendi schedule'ını yapıyordu:
```mcfunction
schedule function global:tick 3t replace
schedule function custom_admin:handler/loop/all/1 2t replace
schedule function gulce_adminpower_addons:loop 5t replace
```

**Sorunlar:**
- ❌ Her modül sürekli kendini yeniden schedule ediyor
- ❌ Return ile durdurulamıyor (çöküyor)
- ❌ TPS düşüşünde kontrol dışı
- ❌ Schedule clear yapınca tüm sistem çöküyor
- ❌ Debug zor, hangi modül çalışıyor belli değil

### ✅ Çözüm: Loop Manager

**Tek bir merkezi tick sistemi:**
- ✅ minecraft:tick tag'inden çalışır
- ✅ Her modül kendi interval'inde çalışır
- ✅ Scoreboard counter bazlı (schedule YOK!)
- ✅ Return ile durur
- ✅ TPS korumalı
- ✅ Debug kolay

### 📦 Yapı

```
data/loop_manager/
├── function/
│   ├── init.mcfunction          # Sistem başlatma
│   ├── tick.mcfunction          # Ana döngü (minecraft:tick)
│   └── modules/
│       ├── global.mcfunction    # Her 3 tick
│       ├── admin.mcfunction     # Her 2 tick
│       ├── addons.mcfunction    # Her 5 tick
│       ├── security.mcfunction  # Her 40 tick
│       ├── menu.mcfunction      # Her tick
│       └── tracker.mcfunction   # Her 20 tick
```

### ⚙️ Nasıl Çalışır?

#### 1. Counter Sistemi

Her modül için ayrı counter:
```mcfunction
scoreboard players add #global loop.counter 1
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
```

#### 2. Interval Ayarları

```mcfunction
#global  → 3 tick  (150ms)
#admin   → 2 tick  (100ms)
#addons  → 5 tick  (250ms)
#security→ 40 tick (2 saniye)
#menu    → 1 tick  (50ms)
#tracker → 20 tick (1 saniye)
```

#### 3. Auto Reset

Modül çalıştığında counter sıfırlanır:
```mcfunction
# Her modül fonksiyonunda:
scoreboard players set #global loop.counter 0
```

### 🎮 Modüller

**Global (3 tick)**
- Admin tool advancement
- Config UI item kontrolü
- Panel yetkisi kontrolü

**Admin (2 tick)**
- Trigger kontrolü
- Ana döngüler
- Permission kontrolü
- Group check

**Addons (5 tick)**
- Permission tick systems
- Trigger enables
- Scoreboard operations
- Data storage
- Freeze handler

**Security (40 tick)**
- GSS trigger kontrolü
- Anti-Xray scan
- Admin Vision

**Menu (Her tick)**
- Menu trigger
- Loading skorları
- Dialog açma
- Tag temizliği

**Tracker (20 tick)**
- Yeni oyuncu kaydı
- Online işaretleme

### 🔧 Yeni Modül Ekleme

**1. Interval Tanımla** (`init.mcfunction`):
```mcfunction
scoreboard players set #mymodule loop.interval 10
scoreboard players set #mymodule loop.counter 0
```

**2. Tick'e Ekle** (`tick.mcfunction`):
```mcfunction
scoreboard players add #mymodule loop.counter 1
execute if score #mymodule loop.counter >= #mymodule loop.interval run function loop_manager:modules/mymodule
```

**3. Modül Oluştur** (`modules/mymodule.mcfunction`):
```mcfunction
# Counter reset
scoreboard players set #mymodule loop.counter 0

# İşlemler
say Merhaba!
```

### 📊 Performans

**Eski sistem (Schedule):**
```
global:tick → 3t schedule → 3t schedule → 3t schedule...
admin:loop → 2t schedule → 2t schedule → 2t schedule...
addons:loop → 5t schedule → 5t schedule → 5t schedule...
```
= 3 ayrı schedule chain, kontrol dışı

**Yeni sistem (Loop Manager):**
```
minecraft:tick → loop_manager:tick → modülleri kontrollü çalıştır
```
= 1 merkezi tick, tam kontrol

### 🐛 Sorun Giderme

**Modül çalışmıyor**
```mcfunction
/scoreboard players get #global loop.counter
```

**Interval değiştirme**
```mcfunction
scoreboard players set #global loop.interval 5
/reload
```

**Debug**
```mcfunction
/scoreboard objectives setdisplay sidebar loop.counter
```

### ✅ Avantajlar

1. **Kontrol:** Her modül ne zaman çalışacak belli
2. **Performans:** Gereksiz schedule yok
3. **Güvenlik:** Return ile durur, çökmez
4. **Debug:** Counter'lar görünür
5. **Esneklik:** Interval kolayca değiştirilebilir
6. **TPS Korumalı:** Oyuncu yoksa hiçbiri çalışmaz

### 🔥 Özet

**Eskiden:**
```mcfunction
schedule function global:tick 3t replace
```

**Şimdi:**
```mcfunction
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
```

**Sonuç:** Stabil, kontrollü, debuglanabilir sistem! 🚀

**Not:** Eski tick fonksiyonları deprecated edildi ve return 0 yapıyor.

---

<a name="en"></a>
## 🇬🇧 English

### ❌ Problem: Schedule System

The old system had each module scheduling itself:
```mcfunction
schedule function global:tick 3t replace
schedule function custom_admin:handler/loop/all/1 2t replace
schedule function gulce_adminpower_addons:loop 5t replace
```

**Problems:**
- ❌ Every module constantly rescheduling itself
- ❌ Cannot be stopped with return (crashes)
- ❌ Out of control during TPS drops
- ❌ Entire system crashes on schedule clear
- ❌ Hard to debug, unclear which module is running

### ✅ Solution: Loop Manager

**Single centralized tick system:**
- ✅ Runs from minecraft:tick tag
- ✅ Each module runs at its own interval
- ✅ Scoreboard counter based (NO schedule!)
- ✅ Stops with return
- ✅ TPS protected
- ✅ Easy to debug

### 📦 Structure

```
data/loop_manager/
├── function/
│   ├── init.mcfunction          # System initialization
│   ├── tick.mcfunction          # Main loop (minecraft:tick)
│   └── modules/
│       ├── global.mcfunction    # Every 3 ticks
│       ├── admin.mcfunction     # Every 2 ticks
│       ├── addons.mcfunction    # Every 5 ticks
│       ├── security.mcfunction  # Every 40 ticks
│       ├── menu.mcfunction      # Every tick
│       └── tracker.mcfunction   # Every 20 ticks
```

### ⚙️ How It Works

#### 1. Counter System

Separate counter for each module:
```mcfunction
scoreboard players add #global loop.counter 1
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
```

#### 2. Interval Settings

```mcfunction
#global  → 3 ticks  (150ms)
#admin   → 2 ticks  (100ms)
#addons  → 5 ticks  (250ms)
#security→ 40 ticks (2 seconds)
#menu    → 1 tick   (50ms)
#tracker → 20 ticks (1 second)
```

#### 3. Auto Reset

Counter resets when module executes:
```mcfunction
# In each module function:
scoreboard players set #global loop.counter 0
```

### 🎮 Modules

**Global (3 ticks)**
- Admin tool advancement
- Config UI item control
- Panel permission check

**Admin (2 ticks)**
- Trigger control
- Main loops
- Permission control
- Group check

**Addons (5 ticks)**
- Permission tick systems
- Trigger enables
- Scoreboard operations
- Data storage
- Freeze handler

**Security (40 ticks)**
- GSS trigger control
- Anti-Xray scan
- Admin Vision

**Menu (Every tick)**
- Menu trigger
- Loading scores
- Dialog opening
- Tag cleanup

**Tracker (20 ticks)**
- New player registration
- Online marking

### 🔧 Adding New Module

**1. Define Interval** (`init.mcfunction`):
```mcfunction
scoreboard players set #mymodule loop.interval 10
scoreboard players set #mymodule loop.counter 0
```

**2. Add to Tick** (`tick.mcfunction`):
```mcfunction
scoreboard players add #mymodule loop.counter 1
execute if score #mymodule loop.counter >= #mymodule loop.interval run function loop_manager:modules/mymodule
```

**3. Create Module** (`modules/mymodule.mcfunction`):
```mcfunction
# Counter reset
scoreboard players set #mymodule loop.counter 0

# Operations
say Hello!
```

### 📊 Performance

**Old System (Schedule):**
```
global:tick → 3t schedule → 3t schedule → 3t schedule...
admin:loop → 2t schedule → 2t schedule → 2t schedule...
addons:loop → 5t schedule → 5t schedule → 5t schedule...
```
= 3 separate schedule chains, out of control

**New System (Loop Manager):**
```
minecraft:tick → loop_manager:tick → controlled module execution
```
= 1 centralized tick, full control

### 🐛 Troubleshooting

**Module not working**
```mcfunction
/scoreboard players get #global loop.counter
```

**Change interval**
```mcfunction
scoreboard players set #global loop.interval 5
/reload
```

**Debug**
```mcfunction
/scoreboard objectives setdisplay sidebar loop.counter
```

### ✅ Advantages

1. **Control:** Clear when each module runs
2. **Performance:** No unnecessary schedules
3. **Safety:** Stops with return, doesn't crash
4. **Debug:** Counters are visible
5. **Flexibility:** Intervals easily adjustable
6. **TPS Protected:** Nothing runs without players

### 🔥 Summary

**Before:**
```mcfunction
schedule function global:tick 3t replace
```

**Now:**
```mcfunction
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
```

**Result:** Stable, controlled, debuggable system! 🚀

**Note:** Old tick functions are deprecated and return 0.

---

**Made with ❤️ for stable Minecraft datapacks**
