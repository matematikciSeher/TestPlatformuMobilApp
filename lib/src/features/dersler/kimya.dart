import 'package:flutter/material.dart';
import 'base_ders.dart';

class KimyaDersi extends BaseDers {
  @override
  final String isim = 'Kimya';

  @override
  final IconData ikon = Icons.science;

  @override
  final Color renk = const Color(0xFF4CAF50);

  @override
  final String soz = 'Kimya, maddenin büyülü dönüşümüdür.';

  @override
  final String yazar = 'Linus Pauling';

  @override
  final String strateji =
      'Kimya testlerinde:\n• Periyodik tabloyu iyi öğrenin\n• Formülleri ezberleyin\n• Denge kurallarını bilin\n• Birim dönüşümlerine dikkat edin';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Kimya Bilimi',
        'Atom ve Yapısı',
        'Periyodik Sistem',
        'Kimyasal Türler Arası Etkileşimler',
        'Maddenin Hâlleri',
        'Karışımlar',
      ],
      '10. Sınıf': [
        'Karışımlar',
        'Asitler, Bazlar ve Tuzlar',
        'Karışımların Ayrılması',
        'Endüstride ve Canlılarda Enerji',
        'Kimya Her Yerde',
        'Organik Bileşikler',
      ],
      '11. Sınıf': [
        'Modern Atom Teorisi',
        'Gazlar',
        'Sıvı Çözeltiler',
        'Kimyasal Tepkimelerde Enerji',
        'Kimyasal Tepkimelerde Hız',
        'Kimyasal Tepkimelerde Denge',
      ],
      '12. Sınıf': [
        'Organik Bileşikler',
        'Enerji Kaynakları ve Bilimsel Gelişmeler',
        'Kimya ve Enerji',
        'Hayatımızda Kimya',
        'Kimya ve Çevre',
        'Kimya ve Teknoloji',
      ],
      'TYT': [
        'Kimya Bilimi',
        'Atom ve Yapısı',
        'Periyodik Sistem',
        'Kimyasal Türler Arası Etkileşimler',
        'Maddenin Hâlleri',
        'Karışımlar',
      ],
      'AYT': [
        'Modern Atom Teorisi',
        'Gazlar',
        'Sıvı Çözeltiler',
        'Kimyasal Tepkimelerde Enerji',
        'Kimyasal Tepkimelerde Hız',
        'Organik Bileşikler',
      ],
    };
  }
}
