import 'package:flutter/material.dart';
import 'base_sinif.dart';

class DokuzuncuSinif extends BaseSinif {
  @override
  final String isim = '9. Sınıf';

  @override
  final Color renk = const Color(0xFF6C63FF);

  @override
  Map<String, List<Map<String, dynamic>>> get curriculumTopics => {
    'Matematik': [
      {
        'topic': 'Kümeler ve Kartezyen Çarpım',
        'color': Colors.purple,
        'icon': Icons.category,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Sayılar ve Cebir',
        'color': Colors.blue,
        'icon': Icons.calculate,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Denklemler ve Eşitsizlikler',
        'color': Colors.green,
        'icon': Icons.functions,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Fonksiyonlar',
        'color': Colors.orange,
        'icon': Icons.trending_up,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Üçgenler ve Trigonometri',
        'color': Colors.red,
        'icon': Icons.change_history,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Veri Analizi',
        'color': Colors.teal,
        'icon': Icons.bar_chart,
        'difficulty': 'Kolay',
      },
    ],
    'Fizik': [
      {
        'topic': 'Fizik Bilimine Giriş',
        'color': Colors.indigo,
        'icon': Icons.science,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Madde ve Özellikleri',
        'color': Colors.cyan,
        'icon': Icons.circle,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Hareket ve Kuvvet',
        'color': Colors.amber,
        'icon': Icons.directions_run,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Enerji',
        'color': Colors.lime,
        'icon': Icons.flash_on,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Isı ve Sıcaklık',
        'color': Colors.deepOrange,
        'icon': Icons.thermostat,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Elektrik ve Manyetizma',
        'color': Colors.pink,
        'icon': Icons.electric_bolt,
        'difficulty': 'Zor',
      },
    ],
    'Kimya': [
      {
        'topic': 'Kimya Bilimi',
        'color': Colors.deepPurple,
        'icon': Icons.science,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Atom ve Yapısı',
        'color': Colors.blueGrey,
        'icon': Icons.science,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Periyodik Sistem',
        'color': Colors.indigo,
        'icon': Icons.table_chart,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Kimyasal Türler Arası Etkileşimler',
        'color': Colors.teal,
        'icon': Icons.link,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Maddenin Hâlleri',
        'color': Colors.cyan,
        'icon': Icons.water_drop,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Karışımlar',
        'color': Colors.orange,
        'icon': Icons.blur_on,
        'difficulty': 'Orta',
      },
    ],
    'Biyoloji': [
      {
        'topic': 'Yaşam Bilimi Biyoloji',
        'color': Colors.green,
        'icon': Icons.eco,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Hücre',
        'color': Colors.lightGreen,
        'icon': Icons.circle,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Canlılar Dünyası',
        'color': Colors.teal,
        'icon': Icons.pets,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Güncel Çevre Sorunları',
        'color': Colors.blue,
        'icon': Icons.nature,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Doğal Kaynaklar ve Biyolojik Çeşitlilik',
        'color': Colors.brown,
        'icon': Icons.forest,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Sağlıklı Yaşam',
        'color': Colors.red,
        'icon': Icons.favorite,
        'difficulty': 'Kolay',
      },
    ],
    'Tarih': [
      {
        'topic': 'Tarih ve Zaman',
        'color': Colors.brown,
        'icon': Icons.history,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'İnsanlığın İlk Dönemleri',
        'color': Colors.orange,
        'icon': Icons.person,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Orta Çağ\'da Dünya',
        'color': Colors.grey,
        'icon': Icons.castle,
        'difficulty': 'Orta',
      },
      {
        'topic': 'İlk ve Orta Çağlarda Türk Dünyası',
        'color': Colors.amber,
        'icon': Icons.flag,
        'difficulty': 'Orta',
      },
      {
        'topic': 'İslam Medeniyeti ve Türkler',
        'color': Colors.green,
        'icon': Icons.mosque,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Türklerin İslamiyet\'i Kabulü',
        'color': Colors.blue,
        'icon': Icons.star,
        'difficulty': 'Orta',
      },
    ],
    'Coğrafya': [
      {
        'topic': 'Doğal Sistemler',
        'color': Colors.green,
        'icon': Icons.landscape,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Beşeri Sistemler',
        'color': Colors.blue,
        'icon': Icons.location_city,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Mekânsal Sentez Türkiye',
        'color': Colors.red,
        'icon': Icons.map,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Küresel Ortam: Bölgeler ve Ülkeler',
        'color': Colors.purple,
        'icon': Icons.public,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Çevre ve Toplum',
        'color': Colors.teal,
        'icon': Icons.eco,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Geleceğin Dünyası',
        'color': Colors.orange,
        'icon': Icons.trending_up,
        'difficulty': 'Kolay',
      },
    ],
    'Edebiyat': [
      {
        'topic': 'Türk Dili ve Edebiyatına Giriş',
        'color': Colors.indigo,
        'icon': Icons.book,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Hikâye',
        'color': Colors.purple,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Şiir',
        'color': Colors.pink,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Roman',
        'color': Colors.deepPurple,
        'icon': Icons.library_books,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Tiyatro',
        'color': Colors.amber,
        'icon': Icons.theater_comedy,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Deneme',
        'color': Colors.blue,
        'icon': Icons.edit_note,
        'difficulty': 'Orta',
      },
    ],
  };
}
