import 'package:flutter/material.dart';
import 'base_sinif.dart';

class OnBirinciSinif extends BaseSinif {
  @override
  final String isim = '11. Sınıf';

  @override
  final Color renk = const Color(0xFFFF9800);

  @override
  Map<String, List<Map<String, dynamic>>> get curriculumTopics => {
    'Matematik': [
      {
        'topic': 'Türev',
        'color': Colors.purple,
        'icon': Icons.trending_up,
        'difficulty': 'Zor',
      },
      {
        'topic': 'İntegral',
        'color': Colors.blue,
        'icon': Icons.integration_instructions,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Limit',
        'color': Colors.green,
        'icon': Icons.functions,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Süreklilik',
        'color': Colors.orange,
        'icon': Icons.timeline,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Türev Uygulamaları',
        'color': Colors.red,
        'icon': Icons.analytics,
        'difficulty': 'Zor',
      },
      {
        'topic': 'İntegral Uygulamaları',
        'color': Colors.teal,
        'icon': Icons.calculate,
        'difficulty': 'Zor',
      },
    ],
    'Fizik': [
      {
        'topic': 'Kuvvet ve Hareket',
        'color': Colors.indigo,
        'icon': Icons.directions_run,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Elektrik ve Manyetizma',
        'color': Colors.cyan,
        'icon': Icons.electric_bolt,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Dalgalar',
        'color': Colors.amber,
        'icon': Icons.waves,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Optik',
        'color': Colors.lime,
        'icon': Icons.visibility,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Modern Fizik',
        'color': Colors.deepOrange,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Atom Fiziği',
        'color': Colors.pink,
        'icon': Icons.circle,
        'difficulty': 'Zor',
      },
    ],
    'Kimya': [
      {
        'topic': 'Modern Atom Teorisi',
        'color': Colors.deepPurple,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Gazlar',
        'color': Colors.blueGrey,
        'icon': Icons.air,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Sıvı Çözeltiler',
        'color': Colors.indigo,
        'icon': Icons.water_drop,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Kimyasal Tepkimelerde Enerji',
        'color': Colors.teal,
        'icon': Icons.flash_on,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Kimyasal Tepkimelerde Hız',
        'color': Colors.cyan,
        'icon': Icons.speed,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Kimyasal Tepkimelerde Denge',
        'color': Colors.orange,
        'icon': Icons.balance,
        'difficulty': 'Zor',
      },
    ],
    'Biyoloji': [
      {
        'topic': 'İnsan Fizyolojisi',
        'color': Colors.green,
        'icon': Icons.person,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Endokrin Sistem',
        'color': Colors.lightGreen,
        'icon': Icons.favorite,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Duyu Organları',
        'color': Colors.teal,
        'icon': Icons.visibility,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Destek ve Hareket Sistemi',
        'color': Colors.blue,
        'icon': Icons.accessibility,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Sindirim Sistemi',
        'color': Colors.brown,
        'icon': Icons.restaurant,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Dolaşım Sistemi',
        'color': Colors.red,
        'icon': Icons.favorite,
        'difficulty': 'Zor',
      },
    ],
    'Tarih': [
      {
        'topic': 'Değişen Dünya Dengeleri Karşısında Osmanlı Siyaseti',
        'color': Colors.brown,
        'icon': Icons.history,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Değişim Çağında Avrupa ve Osmanlı',
        'color': Colors.orange,
        'icon': Icons.public,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Uluslararası İlişkilerde Denge Stratejisi',
        'color': Colors.grey,
        'icon': Icons.balance,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Devrimler Çağında Değişen Devlet-Toplum İlişkileri',
        'color': Colors.amber,
        'icon': Icons.change_history,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Sermaye ve Emek',
        'color': Colors.green,
        'icon': Icons.work,
        'difficulty': 'Orta',
      },
      {
        'topic': 'XIX. ve XX. Yüzyılda Değişen Gündelik Yaşam',
        'color': Colors.blue,
        'icon': Icons.home,
        'difficulty': 'Orta',
      },
    ],
    'Coğrafya': [
      {
        'topic': 'Doğal Sistemler',
        'color': Colors.green,
        'icon': Icons.landscape,
        'difficulty': 'Orta',
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
        'topic': 'Hikâye',
        'color': Colors.indigo,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Şiir',
        'color': Colors.purple,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Roman',
        'color': Colors.pink,
        'icon': Icons.library_books,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Tiyatro',
        'color': Colors.deepPurple,
        'icon': Icons.theater_comedy,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Deneme',
        'color': Colors.amber,
        'icon': Icons.edit_note,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Söylev (Nutuk)',
        'color': Colors.blue,
        'icon': Icons.record_voice_over,
        'difficulty': 'Zor',
      },
    ],
  };
}
