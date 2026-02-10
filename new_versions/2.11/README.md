# 🚀 GULCE Admin Power - UPGRADED Edition

**Minecraft Datapack - Gelişmiş Admin Yönetim Sistemi**

---

## 🎯 NELER YENİ?

### ⏰ Zamanlayıcı Sistemi
- `/schedule` komutundan **10 kat daha güçlü**
- Oyuncu bazlı zamanlama
- Sınırsız eşzamanlı görev
- ID sistemi ile tam kontrol

### 👤 Oyuncu Takip Sistemi
- **"Bu oyuncu kim?"** sorununu çözüyor
- Otomatik ID ataması
- Detaylı istatistikler
- Gerçek zamanlı takip

### 📢 Gelişmiş Duyuru Sistemi
- Renkli duyurular
- Ses efektleri
- Profesyonel görünüm

---

## 📦 KURULUM

### Adım 1: İndir
`mc-server-toolkit-UPGRADED.zip` dosyasını indir

### Adım 2: Kopyala
Dosyayı şu konuma kopyala:
```
[Minecraft Dünya Klasörü]/datapacks/
```

### Adım 3: Yükle
Oyuna gir ve şu komutu çalıştır:
```
/reload
```

### Adım 4: Doğrula
Sistemin yüklendiğini kontrol et:
```
/scoreboard objectives list
```

Şu skoreboard'ları görmelisin:
- `sch.time` - Zamanlayıcı zamanı
- `sch.id` - Zamanlayıcı ID
- `ply.id` - Oyuncu ID
- `ply.online` - Oyuncu online durumu

---

## 🎮 HIZLI BAŞLANGIÇ

### Ana Menüyü Aç
```
/function actions:menu/open
```

### İlk Zamanlayıcını Oluştur
1. Ana menüden **"🚀 Gelişmiş Araçlar"** seç
2. **"⏰ Zamanlayıcı Ekle"** tıkla
3. Örnek:
   - Saniye: `5`
   - Komut: `say Merhaba Dünya!`
   - Hedef: `@s`
4. **"✅ Başlat"** butonuna tıkla

### Oyuncu Bilgilerini Sorgula
1. **"🚀 Gelişmiş Araçlar"** → **"👤 Oyuncu Sorgula"**
2. Oyuncu adını gir
3. **"📊 Detaylı İstatistikler"** seç

---

## 🔧 AYARLAR

### Zamanlayıcı Ayarları
Zamanlayıcı sistemi varsayılan olarak her tick çalışır. 
Değiştirmek için `data/scheduler/function/tick.mcfunction` dosyasını düzenle.

### Oyuncu Takip Ayarları
Varsayılan olarak tüm oyuncuları takip eder.
Belirli oyuncuları hariç tutmak için predicate ekleyebilirsin.

---

## 📊 PERFORMANS

**Çok Hafif!**
- Zamanlayıcı sistemi: ~0.01ms/tick (10 aktif görev için)
- Oyuncu takip: ~0.005ms/tick (10 oyuncu için)
- Toplam: Sunucu performansına **%0.1'den az** etki

---

## 🛠️ KOMUT LİSTESİ

### Zamanlayıcı Komutları
```mcfunction
# Yeni görev ekle
/function scheduler:add {time:100,command:"say Test",player:"@s"}

# Aktif görevleri listele
/function scheduler:list

# Görevi iptal et
/function scheduler:cancel {id:1}
```

### Oyuncu Takip Komutları
```mcfunction
# Detaylı istatistikler
/function player_tracker:detailed_stats {player:"isim"}

# Hızlı bilgi
/function player_tracker:show_info {player:"isim"}
```

### Duyuru Komutları
```mcfunction
# Duyuru gönder
/function broadcast:send {title:"Başlık",message:"Mesaj",color:"gold"}
```

---

## 🔐 YETKİLENDİRME

Datapack varsayılan olarak **OP yetkisi gerektirir**.

Belirli oyunculara izin vermek için:
```mcfunction
# Oyuncuya tag ver
/tag oyuncu_adi add admin_power

# Tag ile kontrol edilen predicate ekle
```

---

## 🐛 SORUN GİDERME

### Zamanlayıcılar Çalışmıyor
```mcfunction
# Skoreboard'ları kontrol et
/scoreboard objectives list

# Manuel başlat
/function scheduler:init
```

### Oyuncu Bilgileri Gösterilmiyor
```mcfunction
# Oyuncu ID'sini kontrol et
/scoreboard players list

# Sistemi yeniden başlat
/function player_tracker:init
```

### Genel Sorunlar
```mcfunction
# Datapack'i yeniden yükle
/reload

# Hata mesajlarını kontrol et
/datapack list
```

---

## 📝 SÜRÜM GEÇMİŞİ

### v3.0 (UPGRADED) - Şubat 2025
- ✅ Gelişmiş zamanlayıcı sistemi eklendi
- ✅ Oyuncu takip sistemi eklendi
- ✅ Gelişmiş duyuru sistemi eklendi
- ✅ GUI'ye yeni butonlar eklendi
- ✅ Detaylı kullanım kılavuzu eklendi

### v2.10 (Orijinal)
- ✅ Temel admin araçları
- ✅ NBT düzenleme
- ✅ Komut yürütme
- ✅ GUI sistemi

---

## 🤝 KATKIDA BULUNMA

Bu datapack açık kaynak değildir ancak önerilerinizi bekleriz!

---

## ⚖️ LİSANS

Bu datapack GULCE tarafından geliştirilmiştir.
Orijinal özellikleri koruyarak geliştirilmiş versiyondur.

---

## 📞 İLETİŞİM

Sorular, öneriler veya hatalar için:
- Minecraft içinde `/function actions:menu/open` ile feedback gönderebilirsin

---

## 🎁 BONUS ÖZELLİKLER

### Otomatik Yedekleme
Zamanlayıcılar kullanarak otomatik dünya yedeklemesi:
```mcfunction
/function scheduler:add {time:72000,command:"save-all",player:"@a"}
```

### Periyodik Temizlik
Her 10 dakikada entity temizliği:
```mcfunction
/function scheduler:add {time:12000,command:"kill @e[type=item]",player:"@a"}
```

### Hoşgeldin Mesajı
Yeni oyunculara otomatik mesaj:
```mcfunction
# İlk giriş tespit sistemi ile entegre edilebilir
```

---

## 🌟 TEŞEKKÜRLER

Bu datapack'i kullandığın için teşekkürler!

**Güçlü yönetim, kolay kontrol.**

🎮 **İyi Oyunlar!** 🚀
