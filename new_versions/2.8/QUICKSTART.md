# 🚀 Hızlı Başlangıç Kılavuzu

## Platform Seçin

- [🖥️ Singleplayer](#️-singleplayer-kurulum)
- [🌐 Multiplayer Server](#-multiplayer-server-kurulum)
- [☁️ Hosting Panel](#️-hosting-panel-kurulum)

---

## 🖥️ Singleplayer Kurulum

### 1️⃣ İndir (2 dosya gerekli)

**Bookshelf (Zorunlu):**
```
https://modrinth.com/datapack/bookshelf-dev/version/v3.2.2-1.21
```

**Bu Datapack:**
```
mc-server-toolkit-v2.8.zip
```

---

### 2️⃣ Yükle

```
saves/
  └── <world-name>/
      └── datapacks/
          ├── bookshelf-dev-1_21_11-v3_2_2.zip    ← ÖNCE BU
          └── mc-server-toolkit-v2.8.zip          ← SONRA BU
```

⚠️ **Sıralama Önemli!** Bookshelf önce yüklenmelidir.

---

### 3️⃣ Aktifleştir

Oyuna gir ve şu komutları çalıştır:

```mcfunction
/reload
/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
```

---

### 4️⃣ Test Et

```mcfunction
/trigger gss.trigger
```

✅ Eğer bir menü açıldıysa, başarılı! 🎉

---

## 🌐 Multiplayer Server Kurulum

### 1️⃣ Server Properties Düzenle

`server.properties` dosyasını aç ve şunu ekle:

```properties
enable-command-block=true
```

💡 **Konum**: `minecraft-server/server.properties`

---

### 2️⃣ Datapack'leri Yükle

```
minecraft-server/
  └── world/
      └── datapacks/
          ├── bookshelf-dev-1_21_11-v3_2_2.zip
          └── mc-server-toolkit-v2.8.zip
```

---

### 3️⃣ Sunucuyu Başlat

Sunucuyu başlat ve in-game:

```mcfunction
/reload
/gamerule send_command_feedback true
```

---

### 4️⃣ Test Et

```mcfunction
/trigger gss.trigger
```

✅ Menü açıldıysa başarılı! 🎉

---

## ☁️ Hosting Panel Kurulum

### 1️⃣ Panel Ayarları

Hosting panelinizde (Pterodactyl, Multicraft, vb.):

1. **Settings** veya **Configuration** sekmesine git
2. **Command Blocks** veya `enable-command-block` bul
3. **Enabled** veya `true` yap
4. Kaydet ve sunucuyu **restart** et

---

### 2️⃣ Datapack'leri Yükle

FTP/SFTP veya File Manager ile:

```
world/datapacks/
  ├── bookshelf-dev-1_21_11-v3_2_2.zip
  └── mc-server-toolkit-v2.7.zip
```

---

### 3️⃣ Sunucuyu Restart Et

Panel'den sunucuyu yeniden başlat, sonra in-game:

```mcfunction
/reload
/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
```

---

### 4️⃣ Test Et

```mcfunction
/trigger gss.trigger
```

✅ Menü açıldıysa başarılı! 🎉

---

## 🎮 İlk Adımlar

### Admin Yetkisi Ver

Kendinize admin tag'i verin:
```mcfunction
/tag @s add admin
```

### Log Görüntüleme Yetkisi Ver

```mcfunction
/tag @s add gss_security.log._.info
```

### Admin Vision'ı Dene

```mcfunction
/function gss_security:admin_vision/toggle
```

Duvarlara bakın - particle'lar görünüyor mu? ✨

### İstatistiklere Bak

```mcfunction
/function gss_security:gui/stats
```

---

## ❓ Sorun mu Var?

### "Function not found" Hatası

✅ Bookshelf yüklenmiş mi kontrol et:
```mcfunction
/datapack list
```

"Bookshelf" listede görünmeli.

---

### Komut Blokları Çalışmıyor

**Singleplayer:**
```mcfunction
/gamerule command_blocks_enabled true
```

**Multiplayer/Hosting:**
```properties
# server.properties dosyasında
enable-command-block=true
```
Sunucuyu restart edin!

---

### Loglar Görünmüyor

✅ Gamerule'ları kontrol et:
```mcfunction
/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
```

✅ Log yetkisi ver:
```mcfunction
/tag @s add gss_security.log._.info
```

---

### Dialog Açılmıyor

✅ Minecraft versiyonunu kontrol et (1.21.6+ gerekli):
```mcfunction
/version
```

✅ Datapack'i yeniden yükle:
```mcfunction
/reload
```

---

### Yetki Hataları

✅ Admin tag'i ver:
```mcfunction
/tag @s add admin
```

Veya GulceOS permissions tag'i:
```mcfunction
/tag @s add gulceos_permissions_admin
```

---

## 📚 Daha Fazla Bilgi

Detaylı dokümantasyon için `README.md` dosyasına bakın.

---

## 🔗 Hızlı Linkler

- **Bookshelf İndir**: https://modrinth.com/datapack/bookshelf-dev
- **Minecraft Wiki (Dialog)**: https://minecraft.wiki/w/Dialog
- **Server Properties Rehberi**: https://minecraft.wiki/w/Server.properties

---

**Kolay gelsin! 🛡️**
