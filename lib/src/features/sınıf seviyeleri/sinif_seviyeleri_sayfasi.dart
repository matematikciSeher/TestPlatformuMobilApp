import 'package:flutter/material.dart';
import 'konu_basliklari_sayfasi.dart';
import 'base_sinif.dart';
import '9.sınıf.dart';
import '10.sınıf.dart';
import '11.sınıf.dart';
import '12.sınıf.dart';
import 'tyt.dart';
import 'ayt.dart';

class SinifSeviyeleriSayfasi extends StatelessWidget {
  final String dersAdi;
  final Color dersRenk;

  const SinifSeviyeleriSayfasi({
    super.key,
    required this.dersAdi,
    required this.dersRenk,
  });

  // Her ders için bilim insanı sözleri
  Map<String, Map<String, dynamic>> _getSubjectQuotes() {
    return {
      'Matematik': {
        'quote': 'Matematik, doğanın dilidir.',
        'author': 'Galileo Galilei',
        'icon': Icons.functions,
      },
      'Fizik': {
        'quote': 'Fizik, evrenin en temel yasalarını keşfetme sanatıdır.',
        'author': 'Richard Feynman',
        'icon': Icons.science,
      },
      'Kimya': {
        'quote': 'Kimya, maddenin gizemlerini çözen büyülü bir dünyadır.',
        'author': 'Marie Curie',
        'icon': Icons.science_outlined,
      },
      'Biyoloji': {
        'quote': 'Yaşam, evrimin en büyük eseridir.',
        'author': 'Charles Darwin',
        'icon': Icons.biotech,
      },
      'Tarih': {
        'quote': 'Tarih, geçmişten geleceğe uzanan bir köprüdür.',
        'author': 'Mustafa Kemal Atatürk',
        'icon': Icons.history,
      },
      'Coğrafya': {
        'quote': 'Dünya, keşfedilmeyi bekleyen muhteşem bir kitaptır.',
        'author': 'Alexander von Humboldt',
        'icon': Icons.public,
      },
      'Edebiyat': {
        'quote': 'Edebiyat, insan ruhunun en derin sesidir.',
        'author': 'Nazım Hikmet',
        'icon': Icons.book,
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<BaseSinif> siniflar = [
      DokuzuncuSinif(),
      OnuncuSinif(),
      OnBirinciSinif(),
      OnIkinciSinif(),
      TYT(),
      AYT(),
    ];

    final subjectQuotes = _getSubjectQuotes();
    final currentQuote = subjectQuotes[dersAdi] ?? subjectQuotes['Matematik']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$dersAdi - Sınıf Seviyeleri',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: dersRenk,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              dersRenk,
              dersRenk.withOpacity(0.8),
              dersRenk.withOpacity(0.6),
              dersRenk.withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          children: [
            // Bilim İnsanı Sözü Container'ı
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.95),
                    Colors.white.withValues(alpha: 0.9),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: dersRenk.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 2,
                  ),
                ],
                border: Border.all(
                  color: dersRenk.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  // Başlık ve İkon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              dersRenk.withValues(alpha: 0.1),
                              dersRenk.withValues(alpha: 0.2),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          currentQuote['icon'] as IconData,
                          color: dersRenk,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          '$dersAdi Dersi',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: dersRenk,
                                fontSize: 22,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Söz
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          dersRenk.withValues(alpha: 0.05),
                          dersRenk.withValues(alpha: 0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: dersRenk.withValues(alpha: 0.15),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '"${currentQuote['quote']}"',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontStyle: FontStyle.italic,
                                color: dersRenk.withValues(alpha: 0.8),
                                fontSize: 18,
                                height: 1.4,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: dersRenk.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                '- ${currentQuote['author']}',
                                style: TextStyle(
                                  color: dersRenk,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Sınıf Seviyeleri Listesi
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: siniflar.length,
                itemBuilder: (context, index) {
                  final sinif = siniflar[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SinifDetaySayfasi(
                            sinifAdi: sinif.isim,
                            sinifRenk: sinif.renk,
                            dersAdi: dersAdi,
                            dersRenk: dersRenk,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: sinif.renk.withValues(alpha: 0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                            spreadRadius: 55,
                          ),
                        ],
                        border: Border.all(
                          color: sinif.renk.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Başlık
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  sinif.renk.withValues(alpha: 0.1),
                                  sinif.renk.withValues(alpha: 0.2),
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: sinif.renk.withValues(alpha: 0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.school,
                                    color: sinif.renk,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    sinif.isim,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: sinif.renk,
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Açıklama
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SinifDetaySayfasi extends StatelessWidget {
  final String sinifAdi;
  final Color sinifRenk;
  final String dersAdi;
  final Color dersRenk;

  const SinifDetaySayfasi({
    super.key,
    required this.sinifAdi,
    required this.sinifRenk,
    required this.dersAdi,
    required this.dersRenk,
  });

  Map<String, List<Map<String, dynamic>>> _getCurriculumTopics(
    String sinifAdi,
  ) {
    switch (sinifAdi) {
      case '9. Sınıf':
        return DokuzuncuSinif().curriculumTopics;
      case '10. Sınıf':
        return OnuncuSinif().curriculumTopics;
      case '11. Sınıf':
        return OnBirinciSinif().curriculumTopics;
      case '12. Sınıf':
        return OnIkinciSinif().curriculumTopics;
      case 'TYT':
        return TYT().curriculumTopics;
      case 'AYT':
        return AYT().curriculumTopics;
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final curriculumTopics = _getCurriculumTopics(sinifAdi);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$dersAdi - $sinifAdi',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: sinifRenk,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              sinifRenk,
              sinifRenk.withValues(alpha: 0.8),
              sinifRenk.withValues(alpha: 0.6),
              sinifRenk.withValues(alpha: 0.4),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 2025 Müfredat Konuları
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                dersRenk.withValues(alpha: 0.1),
                                dersRenk.withValues(alpha: 0.2),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.school, size: 28, color: dersRenk),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2025 MEB Müfredatı',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: dersRenk,
                                    ),
                              ),
                              Text(
                                '$sinifAdi $dersAdi Konuları',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Colors.grey[700],
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Konular Listesi
                    if (curriculumTopics.containsKey(dersAdi))
                      ...curriculumTopics[dersAdi]!.map((topic) {
                        final topicColor = topic['color'] as Color;
                        final topicIcon = topic['icon'] as IconData;
                        final difficulty = topic['difficulty'] as String;

                        Color difficultyColor;
                        switch (difficulty) {
                          case 'Kolay':
                            difficultyColor = Colors.green;
                            break;
                          case 'Orta':
                            difficultyColor = Colors.orange;
                            break;
                          case 'Zor':
                            difficultyColor = Colors.red;
                            break;
                          default:
                            difficultyColor = Colors.grey;
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KonuBasliklariSayfasi(
                                  sinifAdi: sinifAdi,
                                  dersAdi: dersAdi,
                                  konuAdi: topic['topic'] as String,
                                  renk: topicColor,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  topicColor.withValues(alpha: 0.1),
                                  topicColor.withValues(alpha: 0.2),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: topicColor.withValues(alpha: 0.3),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: topicColor.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: topicColor.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    topicIcon,
                                    color: topicColor,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        topic['topic'] as String,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: topicColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: difficultyColor.withValues(
                                                alpha: 0.2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Text(
                                              difficulty,
                                              style: TextStyle(
                                                color: difficultyColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Test çözmeye başla',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: topicColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
