# 🚀 GULCE Admin Power - Geliştirilmiş Versiyon
## Yeni Özellikler ve Kullanım Kılavuzu

---

## ✨ YENİ EKLENEN ÖZELLİKLER

### 1️⃣ **⏰ Gelişmiş Zamanlayıcı Sistemi**

**Minecraft'ın /schedule komutundan daha güçlü!**

#### Özellikler:
- ✅ Oyuncu bazlı zamanlama (her oyuncu için ayrı)
- ✅ Birden fazla zamanlayıcı aynı anda çalışabilir
- ✅ ID sistemi ile her görevi takip edebilirsin
- ✅ Aktif görevleri listele ve iptal et
- ✅ /schedule'ın "Bu oyuncu kim?" sorunu YOK!

#### Kullanım:

**GUI Üzerinden:**
1. Ana menüden "🚀 Gelişmiş Araçlar" butonuna tıkla
2. "⏰ Zamanlayıcı Ekle" seç
3. Saniye, komut ve hedef oyuncuyu gir
4. "✅ Başlat" butonuna tıkla

**Komut Satırından:**
```mcfunction
# Temel kullanım
/function scheduler:add {time:100,command:"say Merhaba",player:"@s"}

# Örnekler:
# 5 saniye sonra mesaj (100 tick = 5 saniye)
/function scheduler:add {time:100,command:"say 5 saniye geçti!",player:"@s"}

# 1 dakika sonra oyuncuya elmas ver
/function scheduler:add {time:1200,command:"give @s diamond 1",player:"@s"}

# 10 saniye sonra tüm oyuncuları ışınla
/function scheduler:add {time:200,command:"tp @a 0 100 0",player:"@a"}

# Aktif görevleri listele
/function scheduler:list

# Görevi iptal et (ID'yi list komutundan öğrenebilirsin)
/function scheduler:cancel {id:1}
```

**⏱️ Tick Hesaplama:**
- 1 saniye = 20 tick
- 5 saniye = 100 tick  
- 10 saniye = 200 tick
- 1 dakika = 1200 tick
- 5 dakika = 6000 tick

---

### 2️⃣ **👤 Oyuncu Takip Sistemi**

**"Bu oyuncu kim?" sorununu çözen akıllı sistem!**

#### Özellikler:
- ✅ Her oyuncuya otomatik benzersiz ID verir
- ✅ Oyuncu bilgilerini sürekli takip eder
- ✅ Detaylı istatistikler gösterir
- ✅ Oyuncu ayrılsa bile bilgileri saklanır

#### Kullanım:

**GUI Üzerinden:**
1. "🚀 Gelişmiş Araçlar" → "👤 Oyuncu Sorgula"
2. Oyuncu adını gir
3. "📊 Detaylı İstatistikler" veya "🔍 Hızlı Bilgi" seç

**Komut Satırından:**
```mcfunction
# Detaylı istatistikler
/function player_tracker:detailed_stats {player:"oyuncu_adi"}

# Hızlı bilgi
/function player_tracker:show_info {player:"oyuncu_adi"}

# Tüm oyuncuların ID'lerini yan sidebar'da göster
/scoreboard objectives setdisplay sidebar ply.id
```

**Gösterilen Bilgiler:**
- 🆔 Sistem ID'si
- 📍 Konum (X, Y, Z)
- ❤️ Sağlık
- 🍗 Açlık seviyesi
- 🎮 Oyun modu
- ⭐ XP seviyesi
- 🌍 Bulunduğu boyut
- 🔗 UUID

---

### 3️⃣ **📢 Gelişmiş Duyuru Sistemi**

**Profesyonel duyurular ses efekti ile!**

#### Özellikler:
- ✅ Renkli başlık ve mesaj
- ✅ Otomatik ses efekti
- ✅ Tüm oyuncular aynı anda görür

#### Kullanım:

**GUI Üzerinden:**
1. "🚀 Gelişmiş Araçlar" → "📢 Gelişmiş Duyuru"
2. Başlık, mesaj ve renk seç
3. "📡 Gönder" butonuna tıkla

**Komut Satırından:**
```mcfunction
/function broadcast:send {title:"ÖNEMLI",message:"Sunucu 5 dakika içinde kapanacak!",color:"red"}

# Renk seçenekleri: gold, red, green, blue, yellow
```

---

## 🎮 KULLANIM ÖRNEKLERİ

### Örnek 1: Zamanlı Ödül Sistemi
```mcfunction
# Oyuncuya "5 saniye içinde ödül alacaksın" de
/tellraw @s {"text":"5 saniye içinde ödülün gelecek!","color":"gold"}

# 5 saniye sonra ödül ver
/function scheduler:add {time:100,command:"give @s diamond 5",player:"@s"}
```

### Örnek 2: Otomatik Duyuru Sistemi
```mcfunction
# Her 5 dakikada bir hatırlatma
/function scheduler:add {time:6000,command:"function broadcast:send {title:'HATIRLATMA',message:'Sunucu kurallarına uy!',color:'yellow'}",player:"@a"}
```

### Örnek 3: Gecikmiş Ceza Sistemi
```mcfunction
# Oyuncuya uyarı ver
/tellraw @a[name="griefer"] {"text":"10 saniye içinde kickleneceksin!","color":"red"}

# 10 saniye sonra kickle
/function scheduler:add {time:200,command:"kick griefer Kural ihlali",player:"@s"}
```

### Örnek 4: PvP Sayacı
```mcfunction
# PvP başlatma sayacı
/function broadcast:send {title:"PVP",message:"3 saniye içinde PvP başlıyor!",color:"red"}
/function scheduler:add {time:60,command:"function broadcast:send {title:'PVP',message:'BAŞLADI!',color:'green'}",player:"@a"}
```

---

## 📋 MEVCUT ÖZELLİKLER (KORUNDU)

Tüm eski özellikler aynen çalışmaya devam ediyor:

✅ NBT / Dosya Düzenleme
✅ Komut Yürütme
✅ Mesaj Gönderme
✅ Oyuncu Işınlama
✅ Varlık Oluşturma
✅ Başlık Gösterme
✅ Oyun Modu Değiştirme
✅ GUI Açma
✅ Bilgi/Uyarı Gösterme
✅ Panda Oluşturma
✅ Hızlı Komutlar
✅ Müzik Çalma
✅ Hava Durumu
✅ Patlama Oluşturma
✅ ... ve daha fazlası!

---

## 🔧 KURULUM

1. `mc-server-toolkit-UPGRADED.zip` dosyasını indir
2. Minecraft dünyasının `datapacks` klasörüne kopyala
3. Dünyaya gir ve `/reload` komutunu çalıştır
4. Ana menüyü açmak için: `/function actions:menu/open`

---

## 🎯 YENİ BUTONLAR

**Ana Panelde:**
- 🚀 **Gelişmiş Araçlar** - Yeni özelliklerin tümüne buradan eriş

**Gelişmiş Araçlar Menüsünde:**
- ⏰ **Zamanlayıcı Ekle** - Zamanlı görev oluştur
- 📋 **Aktif Zamanlayıcılar** - Çalışan görevleri listele
- 👤 **Oyuncu Sorgula** - Oyuncu bilgilerini sorgula
- 📢 **Gelişmiş Duyuru** - Renkli duyuru gönder
- 🎯 **Tüm Oyuncular** - Oyuncu listesini yan panelde göster

---

## ⚡ PERFORMANS

- ✅ Hafif ve optimize edilmiş
- ✅ Her tick sadece aktif zamanlayıcıları kontrol eder
- ✅ Gereksiz komut çalıştırma YOK
- ✅ Storage kullanımı minimal

---

## 🐛 BİLİNEN SINIRLAMALAR

1. Zamanlayıcılar sunucu kapatıldığında sıfırlanır
2. Maksimum zamanlayıcı süresi: 2,147,483,647 tick (~3 yıl)
3. Oyuncu verileri sunucu her açıldığında sıfırlanır (ama oyuncular tekrar bağlanınca otomatik kaydedilir)

---

## 💡 İPUÇLARI

1. **Zamanlayıcı ID'lerini not et** - İptal etmek istersen lazım olur
2. **Aktif görevleri düzenli kontrol et** - `/function scheduler:list`
3. **Uzun süreli görevler için** - Dakika x 1200 = tick
4. **Oyuncu takibi** - ID sistemi ile her oyuncuyu benzersiz şekilde tanımla

---

## 🎨 GELECEK GÜNCELLEMELER İÇİN FİKİRLER

- Zamanlayıcıların kalıcı olması (restart sonrası devam)
- Tekrarlayan zamanlayıcılar
- Oyuncu istatistiklerinin dosyaya kaydedilmesi
- Web panel entegrasyonu
- Daha fazla preset şablonlar

---

## 📞 DESTEK

Sorun yaşarsan:
1. `/reload` komutunu dene
2. Datapack'in düzgün yüklendiğinden emin ol
3. Skorboard'ların oluştuğunu kontrol et: `/scoreboard objectives list`

---

**Geliştirici Notu:**
Bu datapack, orijinal GULCE Admin Power sistemini koruyarak geliştirilmiştir. 
Tüm eski özellikler aynen çalışmaya devam ediyor!

🎮 **İyi Oyunlar!** 🚀
