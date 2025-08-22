import 'package:flutter/material.dart';
import 'ders_detay_sayfasi.dart';
import 'base_ders.dart';
import 'matematik.dart';
import 'fizik.dart';
import 'kimya.dart';
import 'biyoloji.dart';
import 'tarih.dart';
import 'cografya.dart';
import 'edebiyat.dart';

class DerslerSayfasi extends StatelessWidget {
  const DerslerSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BaseDers> dersler = [
      MatematikDersi(),
      FizikDersi(),
      KimyaDersi(),
      BiyolojiDersi(),
      TarihDersi(),
      CografyaDersi(),
      EdebiyatDersi(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '📚 Dersler',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6C63FF),
              Color(0xFF8B7CF6),
              Color(0xFFB8A9FF),
              Color(0xFFE0B0FF),
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: dersler.length,
          itemBuilder: (context, index) {
            final ders = dersler[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DersDetaySayfasi(
                      dersAdi: ders.isim,
                      soz: ders.soz,
                      yazar: ders.yazar,
                      strateji: ders.strateji,
                      renk: ders.renk,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: ders.renk.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                      spreadRadius: 2,
                    ),
                  ],
                  border: Border.all(
                    color: ders.renk.withValues(alpha: 0.2),
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Icon Container
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ders.renk.withValues(alpha: 0.1),
                            ders.renk.withValues(alpha: 0.2),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ders.renk.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(ders.ikon, size: 50, color: ders.renk),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      ders.isim,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ders.renk,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: ders.renk.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: ders.renk.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        'Test Çöz',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ders.renk,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
