# 🎓 Test Platformu Mobil Uygulaması

Bu Flutter projesi, öğrencilerin test çözebileceği, performanslarını takip edebileceği ve çeşitli derslerde kendilerini geliştirebileceği kapsamlı bir mobil uygulamadır.

## ✨ Özellikler

### 🔐 Kullanıcı Girişi Sistemi
- Güvenli kullanıcı girişi
- Oturum yönetimi
- Kullanıcı profil sistemi

### 📚 Ders Kategorileri
- **Matematik** - Fonksiyonlar, kümeler, geometri
- **Fizik** - Mekanik, elektrik, optik
- **Kimya** - Organik kimya, analitik kimya
- **Biyoloji** - Hücre biyolojisi, genetik
- **Tarih** - Osmanlı tarihi, Cumhuriyet tarihi
- **Coğrafya** - Türkiye coğrafyası, dünya coğrafyası

### 🎯 Sınıf Seviyeleri
- 9. Sınıf
- 10. Sınıf
- 11. Sınıf
- 12. Sınıf
- TYT (Temel Yeterlilik Testi)
- AYT (Alan Yeterlilik Testi)

### 📊 Performans Takibi
- Her ders için ayrı performans istatistikleri
- Sınıf seviyesi bazında başarı oranları
- Genel kullanım yüzdesi
- Test sonuçlarının detaylı analizi

### 🧠 Test Sistemi
- MEB müfredatına uygun sorular
- Zorluk seviyeleri (Kolay, Orta, Zor)
- Detaylı çözüm açıklamaları
- Anlık performans güncellemesi

## 🚀 Kurulum

### Gereksinimler
- Flutter SDK (3.8.1 veya üzeri)
- Dart SDK
- Android Studio / VS Code
- Git

### Adımlar
1. Projeyi klonlayın:
```bash
git clone [repository-url]
cd TestPlatformuMobilApp
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## 📱 Kullanım

### İlk Giriş
1. Uygulamayı açın
2. Giriş sayfasında herhangi bir kullanıcı adı ve şifre girin (demo mod)
3. Ana sayfaya yönlendirileceksiniz

### Test Çözme
1. Ana sayfada istediğiniz dersi seçin
2. Sınıf seviyenizi belirleyin
3. Konu başlığını seçin
4. Testi başlatın ve soruları cevaplayın
5. Test sonunda performansınızı görün

### Profil Takibi
1. Sağ üst köşedeki profil ikonuna tıklayın
2. Genel kullanım oranınızı görün
3. Her ders için detaylı performans istatistiklerini inceleyin
4. Çıkış yapmak için logout butonunu kullanın

## 🏗️ Proje Yapısı

```
lib/
├── main.dart                 # Ana uygulama dosyası
├── models/
│   └── user_model.dart      # Kullanıcı modeli
├── auth/
│   └── login_page.dart      # Giriş sayfası
├── anasayfa/
│   └── anasayfa.dart        # Ana sayfa
├── profile/
│   └── profile_page.dart    # Profil sayfası
├── dersler/                 # Ders sayfaları
└── sınıf seviyeleri/        # Sınıf ve test sayfaları
```

## 🔧 Teknik Detaylar

### Kullanılan Paketler
- `shared_preferences`: Kullanıcı verilerini yerel olarak saklama
- `provider`: Durum yönetimi
- `flutter`: UI framework

### Veri Saklama
- Kullanıcı performans verileri SharedPreferences ile saklanır
- Test sonuçları anlık olarak güncellenir
- Oturum bilgileri cihazda kalıcı olarak tutulur

### Performans Özellikleri
- Lazy loading ile optimize edilmiş
- Minimal bellek kullanımı
- Hızlı sayfa geçişleri

## 🎨 UI/UX Özellikleri

- Modern Material Design 3
- Responsive tasarım
- Renk kodlu ders kategorileri
- Görsel performans göstergeleri
- Kullanıcı dostu navigasyon

## 📊 Demo Veriler

Uygulama demo modunda çalışır ve örnek performans verileri içerir:
- Her ders için farklı sınıf seviyelerinde başarı oranları
- Gerçekçi test sonuçları
- Örnek kullanıcı profili

## 🔮 Gelecek Özellikler

- [ ] Gerçek kullanıcı kayıt sistemi
- [ ] Çevrimiçi veri senkronizasyonu
- [ ] Sosyal özellikler (arkadaş ekleme, sıralama)
- [ ] Offline test çözme
- [ ] PDF rapor oluşturma
- [ ] Push bildirimler

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Commit yapın (`git commit -m 'Add some AmazingFeature'`)
4. Push yapın (`git push origin feature/AmazingFeature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## 📞 İletişim

Proje hakkında sorularınız için:
- GitHub Issues
- Email: [your-email@example.com]

---

**Not:** Bu uygulama eğitim amaçlı geliştirilmiştir ve demo veriler içermektedir.
