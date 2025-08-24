import 'package:flutter/material.dart';
import '../sınıf seviyeleri/sinif_seviyeleri_sayfasi.dart';
import '../../../models/user_model.dart';
import '../profile/profile_page.dart';
import '../auth/presentation/pages/login_page.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({super.key});

  final List<Map<String, dynamic>> dersler = const [
    {'ad': 'Matematik', 'ikon': Icons.functions, 'renk': Color(0xFFE91E63)},
    {'ad': 'Fizik', 'ikon': Icons.science, 'renk': Color(0xFF9C27B0)},
    {'ad': 'Kimya', 'ikon': Icons.science_outlined, 'renk': Color(0xFFFF5722)},
    {'ad': 'Biyoloji', 'ikon': Icons.eco, 'renk': Color(0xFF4CAF50)},
    {'ad': 'Tarih', 'ikon': Icons.history, 'renk': Color(0xFF795548)},
    {'ad': 'Coğrafya', 'ikon': Icons.public, 'renk': Color(0xFF00BCD4)},
  ];

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.currentUser;

    // Kullanıcı girişi yapılmamışsa giriş sayfasına yönlendir
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎓 Test Platformu',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 0,
        actions: [
          // Profil ikonu
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5FF),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hoş geldin mesajı
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.waving_hand,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Hoş geldin, ${user.username}!',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Genel kullanım oranın: ${user.genelKullanimYuzdesi.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Test Stratejileri
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '🧠 Test Çözme Stratejileri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text('• Soruları dikkatli ve anlayarak oku.'),
                      Text('• Önce kolay soruları çöz.'),
                      Text('• Zaman yönetimine dikkat et.'),
                      Text('• Cevaplarını mutlaka kontrol et.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Dersler Başlık
                const Text(
                  '📚 Dersler',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(height: 12),

                // Alt alta ders kutuları
                ...dersler
                    .map((ders) => _buildDersCard(context, ders, user))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDersCard(
    BuildContext context,
    Map<String, dynamic> ders,
    User user,
  ) {
    final dersAdi = ders['ad'] as String;
    final dersPerformanslari = user.dersPerformanslari[dersAdi];
    final ortalamaPerformans = dersPerformanslari != null
        ? dersPerformanslari.values.reduce((a, b) => a + b) /
              dersPerformanslari.length
        : 0.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SinifSeviyeleriSayfasi(
              dersAdi: ders['ad'],
              dersRenk: ders['renk'],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ders['renk'].withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ders['renk'].withOpacity(0.4), width: 1.5),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(ders['ikon'], color: ders['renk'], size: 28),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    ders['ad'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ders['renk'],
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
            if (dersPerformanslari != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: ortalamaPerformans / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(ders['renk']),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${ortalamaPerformans.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ders['renk'],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
