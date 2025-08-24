import 'package:flutter/material.dart';
import 'test_sayfasi.dart';

class KonuBasliklariSayfasi extends StatelessWidget {
  final String sinifAdi;
  final String dersAdi;
  final String konuAdi; // Seçilen konu adı
  final Color renk;

  const KonuBasliklariSayfasi({
    super.key,
    required this.sinifAdi,
    required this.dersAdi,
    required this.konuAdi, // Konu adı eklendi
    required this.renk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$sinifAdi - $dersAdi - $konuAdi',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: renk,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              renk,
              renk.withOpacity(0.8),
              renk.withOpacity(0.6),
              renk.withOpacity(0.4),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36),
          child: Column(
            children: [
              // Konu Başlığı
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            renk.withOpacity(0.1),
                            renk.withOpacity(0.2),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.school, color: renk, size: 32),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      konuAdi,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: renk,
                            fontSize: 24,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Test Seviyeleri',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Test Seviyeleri
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTestButton(
                      context,
                      'Kolay Test',
                      Colors.green,
                      Icons.sentiment_satisfied,
                      '15 Soru - 5 Şık',
                      () => _startTest(context, konuAdi, 'Kolay', 1),
                    ),
                    const SizedBox(height: 12),
                    _buildTestButton(
                      context,
                      'Orta Test',
                      Colors.orange,
                      Icons.sentiment_neutral,
                      '15 Soru - 5 Şık',
                      () => _startTest(context, konuAdi, 'Orta', 2),
                    ),
                    const SizedBox(height: 12),
                    _buildTestButton(
                      context,
                      'Zor Test',
                      Colors.red,
                      Icons.sentiment_dissatisfied,
                      '15 Soru - 5 Şık',
                      () => _startTest(context, konuAdi, 'Zor', 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestButton(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.1), color.withOpacity(0.2)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  void _startTest(
    BuildContext context,
    String konuAdi,
    String zorluk,
    int testNo,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestSayfasi(
          sinifAdi: sinifAdi,
          dersAdi: dersAdi,
          konuAdi: konuAdi,
          zorluk: zorluk,
          testNo: testNo,
          renk: renk,
        ),
      ),
    );
  }
}
