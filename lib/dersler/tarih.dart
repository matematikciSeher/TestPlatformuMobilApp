import 'package:flutter/material.dart';
import 'base_ders.dart';

class TarihDersi extends BaseDers {
  @override
  final String isim = 'Tarih';

  @override
  final IconData ikon = Icons.history;

  @override
  final Color renk = const Color(0xFFFF9800);

  @override
  final String soz = 'Tarih, geçmişin aynasında geleceği görmektir.';

  @override
  final String yazar = 'Halil İnalcık';

  @override
  final String strateji =
      'Tarih testlerinde:\n• Kronolojik sırayı öğrenin\n• Önemli tarihleri ezberleyin\n• Neden-sonuç ilişkilerini kurun\n• Haritaları inceleyin';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Tarih ve Zaman',
        'İnsanlığın İlk Dönemleri',
        'Orta Çağ\'da Dünya',
        'İlk ve Orta Çağlarda Türk Dünyası',
        'İslam Medeniyeti ve Türkler',
        'Türklerin İslamiyet\'i Kabulü',
      ],
      '10. Sınıf': [
        'Yerleşme ve Devletleşme Sürecinde Selçuklu Türkiyesi',
        'Beylikten Devlete Osmanlı Siyaseti',
        'Devletleşme Sürecinde Savaşçılar ve Askerler',
        'Beylikten Devlete Osmanlı Medeniyeti',
        'Dünya Gücü Osmanlı',
        'Sultan ve Osmanlı Merkez Teşkilatı',
      ],
      '11. Sınıf': [
        'Değişen Dünya Dengeleri Karşısında Osmanlı Siyaseti',
        'Değişim Çağında Avrupa ve Osmanlı',
        'Uluslararası İlişkilerde Denge Stratejisi',
        'Devrimler Çağında Değişen Devlet-Toplum İlişkileri',
        'Sermaye ve Emek',
        'XIX. ve XX. Yüzyılda Değişen Gündelik Yaşam',
      ],
      '12. Sınıf': [
        'XX. Yüzyıl Başlarında Osmanlı Devleti ve Dünya',
        'Millî Mücadele',
        'Atatürkçülük ve Türk İnkılabı',
        'İki Savaş Arasındaki Dönemde Türkiye ve Dünya',
        'II. Dünya Savaşı Sürecinde Türkiye ve Dünya',
        'II. Dünya Savaşı Sonrasında Türkiye ve Dünya',
      ],
      'TYT': [
        'Tarih ve Zaman',
        'İnsanlığın İlk Dönemleri',
        'Orta Çağ\'da Dünya',
        'İlk ve Orta Çağlarda Türk Dünyası',
        'İslam Medeniyeti ve Türkler',
        'Türklerin İslamiyet\'i Kabulü',
      ],
      'AYT': [
        'Değişen Dünya Dengeleri Karşısında Osmanlı Siyaseti',
        'Değişim Çağında Avrupa ve Osmanlı',
        'Uluslararası İlişkilerde Denge Stratejisi',
        'Devrimler Çağında Değişen Devlet-Toplum İlişkileri',
        'Sermaye ve Emek',
        'XIX. ve XX. Yüzyılda Değişen Gündelik Yaşam',
      ],
    };
  }
}
