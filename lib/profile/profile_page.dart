import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.currentUser;

    if (user == null) {
      return const Scaffold(body: Center(child: Text('Kullanıcı bulunamadı')));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('👤 Profil'),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5FF),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Kullanıcı bilgileri kartı
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C63FF),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      user.username,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      user.email,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),

                    // Genel kullanım yüzdesi
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C63FF).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF6C63FF).withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Genel Kullanım:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${user.genelKullanimYuzdesi.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6C63FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Ders performansları başlık
              const Text(
                '📊 Ders Performansları',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C63FF),
                ),
              ),
              const SizedBox(height: 16),

              // Ders performansları
              ...user.dersPerformanslari.entries.map((entry) {
                final dersAdi = entry.key;
                final sinifPerformanslari = entry.value;

                return _buildDersPerformansCard(dersAdi, sinifPerformanslari);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDersPerformansCard(
    String dersAdi,
    Map<String, double> sinifPerformanslari,
  ) {
    final dersRenkleri = {
      'Matematik': const Color(0xFFE91E63),
      'Fizik': const Color(0xFF9C27B0),
      'Kimya': const Color(0xFFFF5722),
      'Biyoloji': const Color(0xFF4CAF50),
      'Tarih': const Color(0xFF795548),
      'Coğrafya': const Color(0xFF00BCD4),
    };

    final dersRenk = dersRenkleri[dersAdi] ?? const Color(0xFF6C63FF);
    final ortalamaPerformans =
        sinifPerformanslari.values.reduce((a, b) => a + b) /
        sinifPerformanslari.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        children: [
          // Ders başlığı ve ortalama
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dersAdi,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: dersRenk,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: dersRenk.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${ortalamaPerformans.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: dersRenk,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Sınıf seviyeleri performansları
          ...sinifPerformanslari.entries.map((sinifEntry) {
            final sinifAdi = sinifEntry.key;
            final performans = sinifEntry.value;

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      sinifAdi,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: LinearProgressIndicator(
                      value: performans / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(dersRenk),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 50,
                    child: Text(
                      '${performans.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: dersRenk,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Çıkış Yap'),
        content: const Text(
          'Hesabınızdan çıkış yapmak istediğinizden emin misiniz?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              UserProvider.clearUser();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              foregroundColor: Colors.white,
            ),
            child: const Text('Çıkış Yap'),
          ),
        ],
      ),
    );
  }
}
