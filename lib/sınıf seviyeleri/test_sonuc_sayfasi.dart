import 'package:flutter/material.dart';

class TestSonucSayfasi extends StatelessWidget {
  final String sinifAdi;
  final String dersAdi;
  final String konuAdi;
  final String zorluk;
  final int testNo;
  final Color renk;
  final List<Map<String, dynamic>> questions;
  final List<int?> userAnswers;

  const TestSonucSayfasi({
    super.key,
    required this.sinifAdi,
    required this.dersAdi,
    required this.konuAdi,
    required this.zorluk,
    required this.testNo,
    required this.renk,
    required this.questions,
    required this.userAnswers,
  });

  int get correctAnswers {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i]['correctAnswer']) {
        count++;
      }
    }
    return count;
  }

  int get wrongAnswers {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] != null &&
          userAnswers[i] != questions[i]['correctAnswer']) {
        count++;
      }
    }
    return count;
  }

  int get emptyAnswers {
    return userAnswers.where((answer) => answer == null).length;
  }

  double get successRate {
    return (correctAnswers / questions.length) * 100;
  }

  String _getSuccessMessage() {
    if (successRate >= 90) {
      return 'Mükemmel! Harika bir performans gösterdin! 🎉';
    } else if (successRate >= 80) {
      return 'Çok iyi! Başarılı bir sonuç elde ettin! 👏';
    } else if (successRate >= 70) {
      return 'İyi! Daha da geliştirebilirsin! 💪';
    } else if (successRate >= 60) {
      return 'Orta! Biraz daha çalışmaya ihtiyacın var! 📚';
    } else {
      return 'Bu konuyu tekrar çalışman gerekiyor! 🔄';
    }
  }

  String _getOptionLetter(int index) {
    return String.fromCharCode(65 + index); // A, B, C, D, E
  }

  Color _getAnswerColor(int questionIndex, int optionIndex) {
    final correctAnswer = questions[questionIndex]['correctAnswer'] as int;
    final userAnswer = userAnswers[questionIndex];

    if (optionIndex == correctAnswer) {
      return Colors.green;
    } else if (userAnswer == optionIndex && userAnswer != correctAnswer) {
      return Colors.red;
    }
    return Colors.grey.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test Sonucu',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: renk,
        automaticallyImplyLeading: false,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Başarı Kartı
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(25),
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
                    // Başarı İkonu
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            renk.withValues(alpha: 0.1),
                            renk.withValues(alpha: 0.2),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(_getSuccessIcon(), size: 50, color: renk),
                    ),
                    const SizedBox(height: 16),

                    // Başarı Mesajı
                    Text(
                      _getSuccessMessage(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold, color: renk),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Başarı Yüzdesi
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [renk, renk.withValues(alpha: 0.8)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${successRate.toInt()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Başarı Oranı',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // İstatistikler
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'Doğru',
                            correctAnswers.toString(),
                            Colors.green,
                            Icons.check_circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            'Yanlış',
                            wrongAnswers.toString(),
                            Colors.red,
                            Icons.cancel,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            'Boş',
                            emptyAnswers.toString(),
                            Colors.orange,
                            Icons.help,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Cevap Anahtarı
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(25),
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
                        Icon(Icons.quiz, color: renk, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          'Cevap Anahtarı',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: renk,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Sorular ve Cevaplar
                    ...List.generate(questions.length, (index) {
                      final question = questions[index];
                      final userAnswer = userAnswers[index];
                      final correctAnswer = question['correctAnswer'] as int;

                      return _buildQuestionResult(
                        index + 1,
                        question['question'],
                        question['options'],
                        correctAnswer,
                        userAnswer,
                        question['explanation'],
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Butonlar
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        foregroundColor: renk,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(width: 8),
                          Text('Geri Dön'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Yeni test başlat
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: renk,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh),
                          SizedBox(width: 8),
                          Text('Yeni Test'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionResult(
    int questionNumber,
    String question,
    List<String> options,
    int correctAnswer,
    int? userAnswer,
    String explanation,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Soru Numarası ve Durum
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: renk.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Soru $questionNumber',
                  style: TextStyle(
                    color: renk,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              if (userAnswer == correctAnswer)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Doğru',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close, color: Colors.red, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Yanlış',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Soru
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),

          // Şıklar
          ...List.generate(options.length, (index) {
            final isCorrect = index == correctAnswer;
            final isUserAnswer = index == userAnswer;
            final isWrong = isUserAnswer && !isCorrect;

            Color backgroundColor;
            Color textColor;
            IconData? icon;

            if (isCorrect) {
              backgroundColor = Colors.green.withValues(alpha: 0.2);
              textColor = Colors.green;
              icon = Icons.check;
            } else if (isWrong) {
              backgroundColor = Colors.red.withValues(alpha: 0.2);
              textColor = Colors.red;
              icon = Icons.close;
            } else {
              backgroundColor = Colors.grey.withValues(alpha: 0.1);
              textColor = Colors.grey[700]!;
            }

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: textColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: textColor.withValues(alpha: 0.2),
                    ),
                    child: Center(
                      child: Text(
                        _getOptionLetter(index),
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      options[index],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: isCorrect || isWrong
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(icon, color: textColor, size: 18),
                  ],
                ],
              ),
            );
          }),

          // Açıklama
          if (userAnswer != correctAnswer) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      explanation,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getSuccessIcon() {
    if (successRate >= 90) {
      return Icons.emoji_events;
    } else if (successRate >= 80) {
      return Icons.star;
    } else if (successRate >= 70) {
      return Icons.thumb_up;
    } else if (successRate >= 60) {
      return Icons.school;
    } else {
      return Icons.psychology;
    }
  }
}
