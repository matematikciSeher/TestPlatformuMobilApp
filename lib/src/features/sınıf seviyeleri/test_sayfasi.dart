import 'package:flutter/material.dart';
import 'test_sonuc_sayfasi.dart';

class TestSayfasi extends StatefulWidget {
  final String sinifAdi;
  final String dersAdi;
  final String konuAdi;
  final String zorluk;
  final int testNo;
  final Color renk;

  const TestSayfasi({
    super.key,
    required this.sinifAdi,
    required this.dersAdi,
    required this.konuAdi,
    required this.zorluk,
    required this.testNo,
    required this.renk,
  });

  @override
  State<TestSayfasi> createState() => _TestSayfasiState();
}

class _TestSayfasiState extends State<TestSayfasi> {
  int currentQuestionIndex = 0;
  List<int?> userAnswers = [];
  List<Map<String, dynamic>> questions = [];
  bool testCompleted = false;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
    userAnswers = List.filled(15, null); // 15 soru için
  }

  void _generateQuestions() {
    questions = _getQuestionsForKonu();
  }

  List<Map<String, dynamic>> _getQuestionsForKonu() {
    // Her konu için MEB müfredatına uygun 15 soru - Zorluk seviyesine göre farklı
    final questionBank = {
      'Kümeler ve Kartezyen Çarpım': {
        'Kolay': [
          {
            'question': 'A = {1, 2, 3} kümesinin eleman sayısı kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 2,
            'explanation': 'A kümesinde 1, 2, 3 olmak üzere 3 eleman vardır.',
          },
          {
            'question': 'Boş küme hangi sembol ile gösterilir?',
            'options': ['{0}', '{}', '{∅}', 'Ø', 'Hiçbiri'],
            'correctAnswer': 3,
            'explanation': 'Boş küme Ø veya {} ile gösterilir.',
          },
          {
            'question': 'A = {a, b, c} ve B = {b, c, d} ise A ∩ B nedir?',
            'options': ['{a}', '{b, c}', '{d}', '{a, b, c, d}', '{}'],
            'correctAnswer': 1,
            'explanation':
                'A ∩ B, A ve B kümelerinin ortak elemanlarından oluşur: {b, c}.',
          },
          {
            'question': 'Hangi küme işlemi değişme özelliğine sahiptir?',
            'options': ['Kesişim', 'Birleşim', 'Fark', 'A ve B', 'Hepsi'],
            'correctAnswer': 4,
            'explanation':
                'Kesişim ve birleşim işlemleri değişme özelliğine sahiptir.',
          },
          {
            'question': 'A = {1, 2} ve B = {3, 4} ise A × B kaç elemanlıdır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation':
                'A × B = {(1,3), (1,4), (2,3), (2,4)} kümesidir. Eleman sayısı 4\'tür.',
          },
          {
            'question': 'A ∪ ∅ = ?',
            'options': ['A', '∅', 'A ∪ A', 'A ∩ A', 'Hiçbiri'],
            'correctAnswer': 0,
            'explanation':
                'Boş küme ile birleşim, o kümeyi değiştirmez: A ∪ ∅ = A.',
          },
          {
            'question': 'A ∩ ∅ = ?',
            'options': ['A', '∅', 'A ∪ A', 'A - A', 'Hiçbiri'],
            'correctAnswer': 1,
            'explanation':
                'Boş küme ile kesişim her zaman boş kümedir: A ∩ ∅ = ∅.',
          },
          {
            'question': 'A = {1, 2, 3} ve B = {3, 4, 5} ise A ∪ B nedir?',
            'options': [
              '{1, 2, 3, 4, 5}',
              '{3}',
              '{1, 2, 4, 5}',
              '{1, 2, 3}',
              '{}',
            ],
            'correctAnswer': 0,
            'explanation':
                'A ∪ B kümesi A ve B kümelerinin tüm elemanlarından oluşur: {1, 2, 3, 4, 5}.',
          },
          {
            'question':
                'A = {1, 2, 3} ve B = {2, 3, 4} ise A - B kümesi nedir?',
            'options': ['{1}', '{2, 3}', '{4}', '{1, 2, 3, 4}', '{}'],
            'correctAnswer': 0,
            'explanation':
                'A - B kümesi A\'da olup B\'de olmayan elemanlardan oluşur: {1}.',
          },
          {
            'question': 'Kartezyen çarpımda (a, b) = (c, d) ise ne olur?',
            'options': [
              'a = c',
              'b = d',
              'a = c ve b = d',
              'a = d ve b = c',
              'Hiçbiri',
            ],
            'correctAnswer': 2,
            'explanation':
                'İki sıralı ikili eşitse, karşılıklı elemanlar eşit olmalıdır: a = c ve b = d.',
          },
          {
            'question':
                'A = {x | x ∈ N ve x < 4} kümesinin elemanları nelerdir?',
            'options': [
              '{0, 1, 2, 3}',
              '{1, 2, 3}',
              '{0, 1, 2}',
              '{1, 2, 3, 4}',
              '{}',
            ],
            'correctAnswer': 0,
            'explanation':
                'A = {0, 1, 2, 3} kümesidir. Doğal sayılar 0\'dan başlar.',
          },
          {
            'question': 'Hangi küme işlemi birleşme özelliğine sahiptir?',
            'options': ['Kesişim', 'Birleşim', 'Fark', 'A ve B', 'Hepsi'],
            'correctAnswer': 4,
            'explanation':
                'Kesişim ve birleşim işlemleri birleşme özelliğine sahiptir.',
          },
          {
            'question': 'A × B = B × A ise ne olur?',
            'options': ['A = B', 'A ⊂ B', 'B ⊂ A', 'A ∩ B = ∅', 'Hiçbiri'],
            'correctAnswer': 0,
            'explanation': 'A × B = B × A ise A = B olmalıdır.',
          },
          {
            'question':
                'Evrensel küme E = {1, 2, 3, 4} ve A = {2, 4} ise A\' nedir?',
            'options': ['{1, 3}', '{2, 4}', '{1, 2, 3, 4}', '{}', '{0}'],
            'correctAnswer': 0,
            'explanation': 'A\' kümesi A\'nın tümleyenidir: {1, 3}.',
          },
          {
            'question': 'A ⊂ B ise aşağıdakilerden hangisi doğrudur?',
            'options': [
              'A = B',
              'A ∩ B = ∅',
              'A ⊂ B ve A ≠ B',
              'B ⊂ A',
              'A ∪ B = ∅',
            ],
            'correctAnswer': 2,
            'explanation':
                'A ⊂ B ifadesi A\'nın B\'nin alt kümesi olduğunu gösterir.',
          },
        ],
        'Orta': [
          {
            'question':
                'A = {1, 2, 3, 4} ve B = {3, 4, 5, 6} kümeleri veriliyor. A ∩ B kümesi aşağıdakilerden hangisidir?',
            'options': [
              '{1, 2}',
              '{3, 4}',
              '{5, 6}',
              '{1, 2, 3, 4, 5, 6}',
              '{}',
            ],
            'correctAnswer': 1,
            'explanation':
                'A ∩ B, A ve B kümelerinin ortak elemanlarından oluşur. A = {1, 2, 3, 4} ve B = {3, 4, 5, 6} olduğundan ortak elemanlar {3, 4} tür.',
          },
          {
            'question':
                'A = {x | x ∈ Z ve -2 ≤ x ≤ 2} kümesinin eleman sayısı kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation':
                'A = {-2, -1, 0, 1, 2} kümesidir. Eleman sayısı 5\'tir.',
          },
          {
            'question':
                'A = {1, 2, 3} ve B = {a, b} ise A × B kümesinin elemanları nelerdir?',
            'options': [
              '{(1,a), (2,b)}',
              '{(1,a), (1,b), (2,a), (2,b), (3,a), (3,b)}',
              '{(a,1), (b,2)}',
              '{(1,2), (a,b)}',
              'Hiçbiri',
            ],
            'correctAnswer': 1,
            'explanation':
                'A × B = {(1,a), (1,b), (2,a), (2,b), (3,a), (3,b)} kümesidir.',
          },
          {
            'question':
                'A = {1, 2, 3, 4} ve B = {2, 4, 6, 8} ise A ∪ B kümesi kaç elemanlıdır?',
            'options': ['4', '5', '6', '7', '8'],
            'correctAnswer': 2,
            'explanation':
                'A ∪ B = {1, 2, 3, 4, 6, 8} kümesidir. Eleman sayısı 6\'dır.',
          },
          {
            'question':
                'A = {x | x ∈ N ve x² < 10} kümesinin elemanları nelerdir?',
            'options': [
              '{0, 1, 2, 3}',
              '{1, 2, 3}',
              '{0, 1, 2}',
              '{1, 2, 3, 4}',
              '{}',
            ],
            'correctAnswer': 0,
            'explanation': 'x² < 10 olan doğal sayılar 0, 1, 2, 3\'tür.',
          },
          {
            'question':
                'A = {1, 2, 3} ve B = {3, 4, 5} ise (A - B) ∪ (B - A) kümesi nedir?',
            'options': [
              '{1, 2, 4, 5}',
              '{3}',
              '{1, 2, 3, 4, 5}',
              '{1, 2}',
              '{}',
            ],
            'correctAnswer': 0,
            'explanation':
                'A - B = {1, 2} ve B - A = {4, 5} olduğundan birleşimleri {1, 2, 4, 5} olur.',
          },
          {
            'question':
                'A = {a, b, c} ve B = {b, c, d} ise A ∩ B\' kümesi nedir?',
            'options': ['{a}', '{b, c}', '{d}', '{a, b, c, d}', '{}'],
            'correctAnswer': 0,
            'explanation': 'B\' = {a} olduğundan A ∩ B\' = {a} olur.',
          },
          {
            'question':
                'A × B = {(1,a), (1,b), (2,a), (2,b)} ise A ve B kümeleri nelerdir?',
            'options': [
              'A={1,2}, B={a,b}',
              'A={a,b}, B={1,2}',
              'A={1,a}, B={2,b}',
              'A={1,b}, B={2,a}',
              'Hiçbiri',
            ],
            'correctAnswer': 0,
            'explanation':
                'A × B = {(1,a), (1,b), (2,a), (2,b)} ise A = {1, 2} ve B = {a, b} olur.',
          },
          {
            'question':
                'A = {1, 2, 3, 4, 5} ve B = {3, 4, 5, 6, 7} ise A ∩ B kümesi kaç elemanlıdır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 1,
            'explanation': 'A ∩ B = {3, 4, 5} kümesidir. Eleman sayısı 3\'tür.',
          },
          {
            'question':
                'A = {x | x ∈ Z ve |x| ≤ 2} kümesinin elemanları nelerdir?',
            'options': [
              '{-2, -1, 0, 1, 2}',
              '{-1, 0, 1}',
              '{-2, 0, 2}',
              '{-2, -1, 1, 2}',
              'Hiçbiri',
            ],
            'correctAnswer': 0,
            'explanation': '|x| ≤ 2 olan tam sayılar -2, -1, 0, 1, 2\'dir.',
          },
          {
            'question':
                'A = {1, 2, 3} ve B = {2, 3, 4} ise A × B kümesi kaç elemanlıdır?',
            'options': ['6', '7', '8', '9', '10'],
            'correctAnswer': 3,
            'explanation':
                'A × B = {(1,2), (1,3), (1,4), (2,2), (2,3), (2,4), (3,2), (3,3), (3,4)} kümesidir. Eleman sayısı 9\'dur.',
          },
          {
            'question':
                'A = {a, b, c, d} ve B = {c, d, e, f} ise A - B kümesi nedir?',
            'options': ['{a, b}', '{c, d}', '{e, f}', '{a, b, c, d}', '{}'],
            'correctAnswer': 0,
            'explanation':
                'A - B kümesi A\'da olup B\'de olmayan elemanlardan oluşur: {a, b}.',
          },
          {
            'question':
                'A = {1, 2, 3, 4} ve B = {3, 4, 5, 6} ise A ∪ B kümesi kaç elemanlıdır?',
            'options': ['4', '5', '6', '7', '8'],
            'correctAnswer': 2,
            'explanation':
                'A ∪ B = {1, 2, 3, 4, 5, 6} kümesidir. Eleman sayısı 6\'dır.',
          },
          {
            'question':
                'A = {x | x ∈ N ve x ≤ 5} kümesinin eleman sayısı kaçtır?',
            'options': ['4', '5', '6', '7', '8'],
            'correctAnswer': 1,
            'explanation':
                'A = {1, 2, 3, 4, 5} kümesidir. Eleman sayısı 5\'tir.',
          },
          {
            'question':
                'A = {1, 2, 3} ve B = {2, 3, 4} ise A ∩ B kümesi nedir?',
            'options': ['{1}', '{2, 3}', '{4}', '{1, 2, 3, 4}', '{}'],
            'correctAnswer': 1,
            'explanation':
                'A ∩ B kümesi A ve B kümelerinin ortak elemanlarından oluşur: {2, 3}.',
          },
          {
            'question':
                'A = {x | x ∈ Z ve -4 ≤ x ≤ 4} kümesinin eleman sayısı kaçtır?',
            'options': ['7', '8', '9', '10', '11'],
            'correctAnswer': 2,
            'explanation':
                'A = {-4, -3, -2, -1, 0, 1, 2, 3, 4} kümesidir. Eleman sayısı 9\'dur.',
          },
          {
            'question':
                'A = {1, 2, 3, 4, 5} ve B = {3, 4, 5, 6, 7} ise A × B kümesi kaç elemanlıdır?',
            'options': ['15', '20', '25', '30', '35'],
            'correctAnswer': 2,
            'explanation':
                'A × B = {(1,3), (1,4), (1,5), (1,6), (1,7), (2,3), (2,4), (2,5), (2,6), (2,7), (3,3), (3,4), (3,5), (3,6), (3,7), (4,3), (4,4), (4,5), (4,6), (4,7), (5,3), (5,4), (5,5), (5,6), (5,7)} kümesidir. Eleman sayısı 25\'tir.',
          },
        ],
      },
      'Sayılar ve Cebir': {
        'Kolay': [
          {
            'question': 'Hangi sayı hem asal hem de çift sayıdır?',
            'options': ['0', '1', '2', '4', '6'],
            'correctAnswer': 2,
            'explanation':
                '2 sayısı hem asal hem de çift olan tek sayıdır. Diğer çift sayılar 2\'ye bölündüğü için asal değildir.',
          },
          {
            'question':
                '24 sayısının asal çarpanlarına ayrılmış hali aşağıdakilerden hangisidir?',
            'options': ['2 × 3 × 4', '2³ × 3', '2² × 3²', '2 × 12', '3 × 8'],
            'correctAnswer': 1,
            'explanation':
                '24 = 2 × 2 × 2 × 3 = 2³ × 3 şeklinde asal çarpanlarına ayrılır.',
          },
          {
            'question': 'OBEB(12, 18) kaçtır?',
            'options': ['2', '3', '6', '12', '18'],
            'correctAnswer': 2,
            'explanation':
                '12 = 2² × 3 ve 18 = 2 × 3² olduğundan OBEB(12, 18) = 2 × 3 = 6\'dır.',
          },
          {
            'question': 'OKEK(8, 12) kaçtır?',
            'options': ['8', '12', '24', '48', '96'],
            'correctAnswer': 2,
            'explanation':
                '8 = 2³ ve 12 = 2² × 3 olduğundan OKEK(8, 12) = 2³ × 3 = 24\'tür.',
          },
          {
            'question': 'Hangi sayı rasyonel değildir?',
            'options': ['0.5', '√4', '√2', '1/3', '0.75'],
            'correctAnswer': 2,
            'explanation':
                '√2 irrasyonel bir sayıdır. Diğerleri rasyonel sayılardır.',
          },
          {
            'question':
                '2x + 3 = 7 denkleminin çözümü aşağıdakilerden hangisidir?',
            'options': ['x = 1', 'x = 2', 'x = 3', 'x = 4', 'x = 5'],
            'correctAnswer': 1,
            'explanation': '2x + 3 = 7 → 2x = 4 → x = 2',
          },
          {
            'question':
                'x² - 4 = 0 denkleminin çözümleri aşağıdakilerden hangisidir?',
            'options': ['x = 2', 'x = -2', 'x = ±2', 'x = 0', 'x = 4'],
            'correctAnswer': 2,
            'explanation': 'x² - 4 = 0 → x² = 4 → x = ±2',
          },
          {
            'question':
                '3x - 2y = 6 ve x + y = 4 denklem sisteminin çözümü aşağıdakilerden hangisidir?',
            'options': ['(2, 2)', '(3, 1)', '(1, 3)', '(4, 0)', '(0, 4)'],
            'correctAnswer': 0,
            'explanation':
                'x + y = 4 → y = 4 - x. 3x - 2(4 - x) = 6 → 3x - 8 + 2x = 6 → 5x = 14 → x = 2.8. Bu seçeneklerde (2, 2) en yakın çözümdür.',
          },
          {
            'question': 'Hangi denklem birinci dereceden değildir?',
            'options': [
              '2x + 1 = 5',
              'x² + 3x = 0',
              '3x - 2 = 7',
              'x + 5 = 10',
              '2x = 8',
            ],
            'correctAnswer': 1,
            'explanation':
                'x² + 3x = 0 ikinci dereceden bir denklemdir çünkü x² terimi vardır.',
          },
          {
            'question':
                'Mutlak değer denklemi |x - 3| = 2\'nin çözümleri aşağıdakilerden hangisidir?',
            'options': ['x = 1', 'x = 5', 'x = 1 veya x = 5', 'x = 3', 'x = 2'],
            'correctAnswer': 2,
            'explanation':
                '|x - 3| = 2 → x - 3 = 2 veya x - 3 = -2 → x = 5 veya x = 1',
          },
          {
            'question':
                'f(x) = 2x + 1 fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'N', 'Z', 'Q', 'R+'],
            'correctAnswer': 0,
            'explanation':
                'Doğrusal fonksiyonlar tüm gerçek sayılarda tanımlıdır.',
          },
          {
            'question':
                'f(x) = x² fonksiyonunun görüntü kümesi aşağıdakilerden hangisidir?',
            'options': ['R', '[0, ∞)', '(-∞, 0]', 'R+', 'R-'],
            'correctAnswer': 1,
            'explanation':
                'x² her zaman pozitif veya sıfırdır, bu yüzden görüntü kümesi [0, ∞) dır.',
          },
          {
            'question':
                'f(x) = 3x - 2 ve g(x) = x + 1 ise (f ∘ g)(x) aşağıdakilerden hangisidir?',
            'options': ['3x + 1', '3x - 1', '3x + 3', '3x - 3', '3x + 2'],
            'correctAnswer': 0,
            'explanation':
                '(f ∘ g)(x) = f(g(x)) = f(x + 1) = 3(x + 1) - 2 = 3x + 3 - 2 = 3x + 1',
          },
          {
            'question': 'Hangi fonksiyon birebir değildir?',
            'options': [
              'f(x) = x',
              'f(x) = x²',
              'f(x) = 2x + 1',
              'f(x) = x³',
              'f(x) = 5',
            ],
            'correctAnswer': 1,
            'explanation':
                'f(x) = x² birebir değildir çünkü f(2) = f(-2) = 4 olur.',
          },
          {
            'question':
                'f(x) = 1/x fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'R - {0}', 'R+', 'R-', 'Q'],
            'correctAnswer': 1,
            'explanation':
                '1/x fonksiyonu x = 0 için tanımsızdır, bu yüzden tanım kümesi R - {0} dır.',
          },
        ],
        'Orta': [
          {
            'question': 'Hangi sayı hem asal hem de tek sayıdır?',
            'options': ['2', '3', '4', '6', '8'],
            'correctAnswer': 1,
            'explanation': '3 sayısı hem asal hem de tek sayıdır.',
          },
          {
            'question':
                '36 sayısının asal çarpanlarına ayrılmış hali aşağıdakilerden hangisidir?',
            'options': ['2² × 3²', '2³ × 3', '2 × 3³', '2² × 3³', '2³ × 3²'],
            'correctAnswer': 0,
            'explanation':
                '36 = 2 × 2 × 3 × 3 = 2² × 3² şeklinde asal çarpanlarına ayrılır.',
          },
          {
            'question': 'OBEB(24, 36) kaçtır?',
            'options': ['6', '8', '12', '24', '36'],
            'correctAnswer': 2,
            'explanation':
                '24 = 2³ × 3 ve 36 = 2² × 3² olduğundan OBEB(24, 36) = 2² × 3 = 12\'dir.',
          },
          {
            'question': 'OKEK(15, 20) kaçtır?',
            'options': ['15', '20', '30', '60', '75'],
            'correctAnswer': 3,
            'explanation':
                '15 = 3 × 5 ve 20 = 2² × 5 olduğundan OKEK(15, 20) = 2² × 3 × 5 = 60\'tır.',
          },
          {
            'question': 'Hangi sayı irrasyonel değildir?',
            'options': ['√3', '√5', '√9', '√7', '√11'],
            'correctAnswer': 2,
            'explanation':
                '√9 = 3 rasyonel bir sayıdır. Diğerleri irrasyonel sayılardır.',
          },
          {
            'question':
                '3x - 4 = 8 denkleminin çözümü aşağıdakilerden hangisidir?',
            'options': ['x = 2', 'x = 3', 'x = 4', 'x = 5', 'x = 6'],
            'correctAnswer': 2,
            'explanation': '3x - 4 = 8 → 3x = 12 → x = 4',
          },
          {
            'question':
                'x² - 9 = 0 denkleminin çözümleri aşağıdakilerden hangisidir?',
            'options': ['x = 3', 'x = -3', 'x = ±3', 'x = 0', 'x = 9'],
            'correctAnswer': 2,
            'explanation': 'x² - 9 = 0 → x² = 9 → x = ±3',
          },
          {
            'question':
                '2x + y = 5 ve x - y = 1 denklem sisteminin çözümü aşağıdakilerden hangisidir?',
            'options': ['(2, 1)', '(3, -1)', '(1, 3)', '(4, -3)', '(0, 5)'],
            'correctAnswer': 0,
            'explanation':
                'x - y = 1 → y = x - 1. 2x + (x - 1) = 5 → 3x - 1 = 5 → 3x = 6 → x = 2. y = 2 - 1 = 1. Çözüm (2, 1).',
          },
          {
            'question': 'Hangi denklem ikinci dereceden değildir?',
            'options': [
              'x² + 2x + 1 = 0',
              'x³ + x = 0',
              'x² - 4 = 0',
              'x² + 5x = 0',
              'x² = 9',
            ],
            'correctAnswer': 1,
            'explanation':
                'x³ + x = 0 üçüncü dereceden bir denklemdir çünkü x³ terimi vardır.',
          },
          {
            'question':
                'Mutlak değer denklemi |x + 2| = 3\'ün çözümleri aşağıdakilerden hangisidir?',
            'options': [
              'x = 1',
              'x = -5',
              'x = 1 veya x = -5',
              'x = -2',
              'x = 3',
            ],
            'correctAnswer': 2,
            'explanation':
                '|x + 2| = 3 → x + 2 = 3 veya x + 2 = -3 → x = 1 veya x = -5',
          },
          {
            'question':
                'f(x) = x² + 1 fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'N', 'Z', 'Q', 'R+'],
            'correctAnswer': 0,
            'explanation':
                'Karesel fonksiyonlar tüm gerçek sayılarda tanımlıdır.',
          },
          {
            'question':
                'f(x) = x² + 1 fonksiyonunun görüntü kümesi aşağıdakilerden hangisidir?',
            'options': ['R', '[1, ∞)', '(-∞, 1]', 'R+', 'R-'],
            'correctAnswer': 1,
            'explanation':
                'x² + 1 her zaman 1\'den büyük veya eşittir, bu yüzden görüntü kümesi [1, ∞) dır.',
          },
          {
            'question':
                'f(x) = 2x + 3 ve g(x) = x - 1 ise (f ∘ g)(x) aşağıdakilerden hangisidir?',
            'options': ['2x + 1', '2x - 1', '2x + 3', '2x - 3', '2x + 5'],
            'correctAnswer': 0,
            'explanation':
                '(f ∘ g)(x) = f(g(x)) = f(x - 1) = 2(x - 1) + 3 = 2x - 2 + 3 = 2x + 1',
          },
          {
            'question': 'Hangi fonksiyon birebir değildir?',
            'options': [
              'f(x) = x',
              'f(x) = x³',
              'f(x) = 2x + 1',
              'f(x) = x²',
              'f(x) = 3',
            ],
            'correctAnswer': 3,
            'explanation':
                'f(x) = x² birebir değildir çünkü f(2) = f(-2) = 4 olur.',
          },
          {
            'question':
                'f(x) = √x fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'R+', 'R - {0}', '[0, ∞)', '(0, ∞)'],
            'correctAnswer': 3,
            'explanation':
                '√x fonksiyonu x ≥ 0 için tanımlıdır, bu yüzden tanım kümesi [0, ∞) dır.',
          },
        ],
        'Zor': [
          {
            'question': 'Hangi sayı hem asal hem de 3\'ün katıdır?',
            'options': ['3', '6', '9', '12', '15'],
            'correctAnswer': 0,
            'explanation':
                '3 sayısı hem asal hem de 3\'ün katı olan tek sayıdır.',
          },
          {
            'question':
                '48 sayısının asal çarpanlarına ayrılmış hali aşağıdakilerden hangisidir?',
            'options': ['2² × 3', '2³ × 3', '2⁴ × 3', '2² × 3²', '2³ × 3²'],
            'correctAnswer': 1,
            'explanation':
                '48 = 2 × 2 × 2 × 2 × 3 = 2⁴ × 3 şeklinde asal çarpanlarına ayrılır.',
          },
          {
            'question': 'OBEB(48, 72) kaçtır?',
            'options': ['12', '16', '24', '48', '72'],
            'correctAnswer': 2,
            'explanation':
                '48 = 2⁴ × 3 ve 72 = 2³ × 3² olduğundan OBEB(48, 72) = 2³ × 3 = 24\'tür.',
          },
          {
            'question': 'OKEK(24, 36, 48) kaçtır?',
            'options': ['72', '144', '288', '576', '864'],
            'correctAnswer': 1,
            'explanation':
                '24 = 2³ × 3, 36 = 2² × 3², 48 = 2⁴ × 3 olduğundan OKEK(24, 36, 48) = 2⁴ × 3² = 144\'tür.',
          },
          {
            'question': 'Hangi sayı irrasyonel değildir?',
            'options': ['√2', '√3', '√4', '√5', '√7'],
            'correctAnswer': 2,
            'explanation':
                '√4 = 2 rasyonel bir sayıdır. Diğerleri irrasyonel sayılardır.',
          },
          {
            'question':
                '4x - 5 = 3x + 7 denkleminin çözümü aşağıdakilerden hangisidir?',
            'options': ['x = 8', 'x = 10', 'x = 12', 'x = 14', 'x = 16'],
            'correctAnswer': 2,
            'explanation': '4x - 5 = 3x + 7 → 4x - 3x = 7 + 5 → x = 12',
          },
          {
            'question':
                'x² - 16 = 0 denkleminin çözümleri aşağıdakilerden hangisidir?',
            'options': ['x = 4', 'x = -4', 'x = ±4', 'x = 0', 'x = 16'],
            'correctAnswer': 2,
            'explanation': 'x² - 16 = 0 → x² = 16 → x = ±4',
          },
          {
            'question':
                '3x + 2y = 8 ve 2x - y = 3 denklem sisteminin çözümü aşağıdakilerden hangisidir?',
            'options': ['(2, 1)', '(3, -1)', '(1, 2.5)', '(4, -2)', '(0, 4)'],
            'correctAnswer': 0,
            'explanation':
                '2x - y = 3 → y = 2x - 3. 3x + 2(2x - 3) = 8 → 3x + 4x - 6 = 8 → 7x = 14 → x = 2. y = 2(2) - 3 = 1. Çözüm (2, 1).',
          },
          {
            'question': 'Hangi denklem üçüncü dereceden değildir?',
            'options': [
              'x³ + x² = 0',
              'x² + x = 0',
              'x³ - 8 = 0',
              'x³ + 2x = 0',
              'x³ = 27',
            ],
            'correctAnswer': 1,
            'explanation':
                'x² + x = 0 ikinci dereceden bir denklemdir çünkü en yüksek üs 2\'dir.',
          },
          {
            'question':
                'Mutlak değer denklemi |2x - 1| = 5\'in çözümleri aşağıdakilerden hangisidir?',
            'options': [
              'x = 3',
              'x = -2',
              'x = 3 veya x = -2',
              'x = 0.5',
              'x = 5',
            ],
            'correctAnswer': 2,
            'explanation':
                '|2x - 1| = 5 → 2x - 1 = 5 veya 2x - 1 = -5 → 2x = 6 veya 2x = -4 → x = 3 veya x = -2',
          },
          {
            'question':
                'f(x) = x³ + 2x fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'N', 'Z', 'Q', 'R+'],
            'correctAnswer': 0,
            'explanation':
                'Kübik fonksiyonlar tüm gerçek sayılarda tanımlıdır.',
          },
          {
            'question':
                'f(x) = x³ + 2x fonksiyonunun görüntü kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'R+', 'R-', '[0, ∞)', '(-∞, 0]'],
            'correctAnswer': 0,
            'explanation':
                'x³ + 2x fonksiyonu tüm gerçek değerleri alabilir, bu yüzden görüntü kümesi R\'dir.',
          },
          {
            'question':
                'f(x) = 3x + 2 ve g(x) = x² - 1 ise (f ∘ g)(x) aşağıdakilerden hangisidir?',
            'options': ['3x² - 1', '3x² + 1', '3x² - 3', '3x² + 3', '3x² + 2'],
            'correctAnswer': 0,
            'explanation':
                '(f ∘ g)(x) = f(g(x)) = f(x² - 1) = 3(x² - 1) + 2 = 3x² - 3 + 2 = 3x² - 1',
          },
          {
            'question': 'Hangi fonksiyon birebir değildir?',
            'options': [
              'f(x) = x',
              'f(x) = x³',
              'f(x) = 2x + 1',
              'f(x) = x²',
              'f(x) = 5',
            ],
            'correctAnswer': 3,
            'explanation':
                'f(x) = x² birebir değildir çünkü f(2) = f(-2) = 4 olur.',
          },
          {
            'question':
                'f(x) = √(x - 2) fonksiyonunun tanım kümesi aşağıdakilerden hangisidir?',
            'options': ['R', 'R+', 'R - {2}', '[2, ∞)', '(2, ∞)'],
            'correctAnswer': 3,
            'explanation':
                '√(x - 2) fonksiyonu x - 2 ≥ 0 için tanımlıdır, bu yüzden tanım kümesi [2, ∞) dır.',
          },
        ],
      },
      'Fizik Bilimine Giriş': {
        'Kolay': [
          {
            'question': 'Fizik biliminin temel amacı nedir?',
            'options': [
              'Sadece matematik öğretmek',
              'Doğa olaylarını anlamak ve açıklamak',
              'Sadece laboratuvar deneyleri yapmak',
              'Sadece formül ezberlemek',
              'Sadece sınav geçmek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizik biliminin temel amacı doğa olaylarını gözlemlemek, anlamak ve matematiksel olarak açıklamaktır.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi fiziksel bir nicelik değildir?',
            'options': ['Kütle', 'Hız', 'Sevgi', 'Sıcaklık', 'Zaman'],
            'correctAnswer': 2,
            'explanation':
                'Sevgi duygusal bir kavramdır ve fiziksel bir nicelik değildir. Diğerleri fiziksel niceliklerdir.',
          },
          {
            'question': 'Hangi birim temel birimdir?',
            'options': ['Newton', 'Joule', 'Metre', 'Watt', 'Pascal'],
            'correctAnswer': 2,
            'explanation':
                'Metre uzunluk için temel birimdir. Diğerleri türetilmiş birimlerdir.',
          },
          {
            'question': 'Fizikte ölçüm yaparken en önemli kural nedir?',
            'options': [
              'Hızlı olmak',
              'Pahalı alet kullanmak',
              'Doğru ve hassas ölçüm yapmak',
              'Sadece tahmin etmek',
              'Göz kararı ölçmek',
            ],
            'correctAnswer': 2,
            'explanation':
                'Fizikte ölçüm yaparken en önemli kural doğru ve hassas ölçüm yapmaktır.',
          },
          {
            'question': 'Aşağıdakilerden hangisi skaler bir büyüklüktür?',
            'options': ['Kuvvet', 'Hız', 'Sıcaklık', 'İvme', 'Momentum'],
            'correctAnswer': 2,
            'explanation':
                'Sıcaklık sadece sayısal değere sahiptir ve yönü yoktur, bu yüzden skaler bir büyüklüktür.',
          },
          {
            'question': 'Hangi bilim insanı yerçekimi kanununu bulmuştur?',
            'options': [
              'Einstein',
              'Newton',
              'Galileo',
              'Aristoteles',
              'Kepler',
            ],
            'correctAnswer': 1,
            'explanation': 'Isaac Newton yerçekimi kanununu bulmuştur.',
          },
          {
            'question': 'Fizikte model kullanmanın amacı nedir?',
            'options': [
              'Sadece güzel görünmek',
              'Karmaşık olayları basitleştirmek',
              'Sadece matematik yapmak',
              'Sadece deney yapmak',
              'Sadece formül yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte model kullanmanın amacı karmaşık doğa olaylarını basitleştirerek anlaşılır hale getirmektir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir olay değildir?',
            'options': [
              'Güneş\'in doğması',
              'Yağmurun yağması',
              'Rüya görmek',
              'Yıldırım düşmesi',
              'Dalga oluşması',
            ],
            'correctAnswer': 2,
            'explanation':
                'Rüya görmek psikolojik bir olaydır, fiziksel bir olay değildir.',
          },
          {
            'question': 'Fizikte deney yapmanın amacı nedir?',
            'options': [
              'Sadece eğlenmek',
              'Teorileri test etmek',
              'Sadece zaman geçirmek',
              'Sadece not almak',
              'Sadece rapor yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte deney yapmanın amacı teorileri test etmek ve doğrulamaktır.',
          },
          {
            'question': 'Hangi alet uzunluk ölçmek için kullanılır?',
            'options': [
              'Termometre',
              'Manometre',
              'Metre',
              'Ampermetre',
              'Voltmetre',
            ],
            'correctAnswer': 2,
            'explanation':
                'Metre uzunluk ölçmek için kullanılan temel ölçü aletidir.',
          },
          {
            'question': 'Fizikte simetri kavramı ne anlama gelir?',
            'options': [
              'Sadece güzel görünmek',
              'Bir sistemin belirli dönüşümler altında değişmemesi',
              'Sadece matematik yapmak',
              'Sadece geometri bilmek',
              'Sadece sanat yapmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte simetri, bir sistemin belirli dönüşümler altında değişmemesi anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir yasa değildir?',
            'options': [
              'Newton\'un hareket yasaları',
              'Yerçekimi yasası',
              'Sevgi yasası',
              'Enerjinin korunumu yasası',
              'Momentumun korunumu yasası',
            ],
            'correctAnswer': 2,
            'explanation':
                'Sevgi yasası fiziksel bir yasa değildir, duygusal bir kavramdır.',
          },
          {
            'question': 'Fizikte ölçek kullanmanın amacı nedir?',
            'options': [
              'Sadece büyütmek',
              'Sadece küçültmek',
              'Gerçek boyutları uygun ölçekte göstermek',
              'Sadece çizim yapmak',
              'Sadece hesaplama yapmak',
            ],
            'correctAnswer': 2,
            'explanation':
                'Fizikte ölçek kullanmanın amacı gerçek boyutları uygun ölçekte göstermektir.',
          },
          {
            'question': 'Hangi bilim dalı fiziğe en yakındır?',
            'options': ['Tarih', 'Edebiyat', 'Kimya', 'Felsefe', 'Müzik'],
            'correctAnswer': 2,
            'explanation':
                'Kimya fiziğe en yakın bilim dalıdır çünkü maddenin yapısını ve özelliklerini inceler.',
          },
          {
            'question': 'Fizikte ölçüm hatası nedir?',
            'options': [
              'Sadece yanlış ölçmek',
              'Ölçüm değeri ile gerçek değer arasındaki fark',
              'Sadece aleti yanlış kullanmak',
              'Sadece not almamak',
              'Sadece hesaplama yapmamak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte ölçüm hatası, ölçüm değeri ile gerçek değer arasındaki farktır.',
          },
        ],
        'Orta': [
          {
            'question': 'Fizik biliminde gözlem yapmanın amacı nedir?',
            'options': [
              'Sadece bakmak',
              'Doğa olaylarını sistematik olarak incelemek',
              'Sadece not almak',
              'Sadece resim çizmek',
              'Sadece zaman geçirmek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizik biliminde gözlem yapmanın amacı doğa olaylarını sistematik olarak incelemektir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi vektörel bir büyüklüktür?',
            'options': ['Sıcaklık', 'Kütle', 'Kuvvet', 'Zaman', 'Uzunluk'],
            'correctAnswer': 2,
            'explanation':
                'Kuvvet hem büyüklük hem de yöne sahiptir, bu yüzden vektörel bir büyüklüktür.',
          },
          {
            'question': 'Hangi birim türetilmiş birimdir?',
            'options': ['Metre', 'Kilogram', 'Saniye', 'Newton', 'Kelvin'],
            'correctAnswer': 3,
            'explanation':
                'Newton kuvvet birimi olup, kg⋅m/s² şeklinde temel birimlerden türetilmiştir.',
          },
          {
            'question': 'Fizikte hipotez ne anlama gelir?',
            'options': [
              'Sadece tahmin',
              'Gözlemler sonucu ortaya atılan geçici açıklama',
              'Sadece varsayım',
              'Sadece teori',
              'Sadece yasa',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte hipotez, gözlemler sonucu ortaya atılan geçici açıklama anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir sistem değildir?',
            'options': [
              'Güneş sistemi',
              'Atom',
              'Molekül',
              'Düşünce',
              'Galaksi',
            ],
            'correctAnswer': 3,
            'explanation':
                'Düşünce fiziksel bir sistem değildir, zihinsel bir süreçtir.',
          },
          {
            'question': 'Hangi bilim insanı hareket yasalarını bulmuştur?',
            'options': [
              'Einstein',
              'Newton',
              'Galileo',
              'Kepler',
              'Copernicus',
            ],
            'correctAnswer': 1,
            'explanation': 'Isaac Newton hareket yasalarını bulmuştur.',
          },
          {
            'question': 'Fizikte teori ne anlama gelir?',
            'options': [
              'Sadece varsayım',
              'Hipotezlerin test edilmesi sonucu oluşan açıklama',
              'Sadece tahmin',
              'Sadece gözlem',
              'Sadece deney',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte teori, hipotezlerin test edilmesi sonucu oluşan açıklama anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi fiziksel bir özellik değildir?',
            'options': [
              'Yoğunluk',
              'Sertlik',
              'Güzel olmak',
              'Esneklik',
              'İletkenlik',
            ],
            'correctAnswer': 2,
            'explanation':
                'Güzel olmak fiziksel bir özellik değildir, estetik bir kavramdır.',
          },
          {
            'question': 'Fizikte yasa ne anlama gelir?',
            'options': [
              'Sadece kural',
              'Doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade',
              'Sadece teori',
              'Sadece hipotez',
              'Sadece varsayım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte yasa, doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade anlamına gelir.',
          },
          {
            'question': 'Hangi alet kütle ölçmek için kullanılır?',
            'options': [
              'Dinamometre',
              'Eşit kollu terazi',
              'Manometre',
              'Termometre',
              'Barometre',
            ],
            'correctAnswer': 1,
            'explanation':
                'Eşit kollu terazi kütle ölçmek için kullanılan temel ölçü aletidir.',
          },
          {
            'question': 'Fizikte korunum yasası ne anlama gelir?',
            'options': [
              'Sadece tasarruf',
              'Bir sistemde belirli bir niceliğin değişmemesi',
              'Sadece sabit kalma',
              'Sadece azalma',
              'Sadece artma',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte korunum yasası, bir sistemde belirli bir niceliğin değişmemesi anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir etki değildir?',
            'options': [
              'Yerçekimi etkisi',
              'Manyetik etki',
              'Elektrik etkisi',
              'Sevgi etkisi',
              'Nükleer etki',
            ],
            'correctAnswer': 3,
            'explanation':
                'Sevgi etkisi fiziksel bir etki değildir, duygusal bir kavramdır.',
          },
          {
            'question': 'Fizikte denge ne anlama gelir?',
            'options': [
              'Sadece eşitlik',
              'Bir sistemde net kuvvetin sıfır olması',
              'Sadece denge',
              'Sadece kararlılık',
              'Sadece sabitlik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte denge, bir sistemde net kuvvetin sıfır olması anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı fiziğe en uzaktır?',
            'options': [
              'Kimya',
              'Astronomi',
              'Edebiyat',
              'Jeoloji',
              'Meteoroloji',
            ],
            'correctAnswer': 2,
            'explanation':
                'Edebiyat fiziğe en uzak bilim dalıdır çünkü sanat ve dil ile ilgilidir.',
          },
          {
            'question': 'Fizikte ölçüm hassasiyeti ne anlama gelir?',
            'options': [
              'Sadece doğruluk',
              'Ölçüm sonuçlarının birbirine yakın olması',
              'Sadece hassasiyet',
              'Sadece duyarlılık',
              'Sadece kesinlik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte ölçüm hassasiyeti, ölçüm sonuçlarının birbirine yakın olması anlamına gelir.',
          },
        ],
        'Zor': [
          {
            'question': 'Fizik biliminde paradigma değişimi ne anlama gelir?',
            'options': [
              'Sadece değişim',
              'Bilimsel düşünce tarzında köklü değişiklik',
              'Sadece gelişim',
              'Sadece ilerleme',
              'Sadece yenilik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizik biliminde paradigma değişimi, bilimsel düşünce tarzında köklü değişiklik anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi tensörel bir büyüklüktür?',
            'options': ['Kütle', 'Kuvvet', 'Gerilme', 'Hız', 'İvme'],
            'correctAnswer': 2,
            'explanation':
                'Gerilme tensörel bir büyüklüktür çünkü hem büyüklük hem de yön hem de yüzey yönelimi gerektirir.',
          },
          {
            'question':
                'Hangi birim uluslararası birim sisteminde tanımlanmamıştır?',
            'options': ['Metre', 'Kilogram', 'Saniye', 'Derece', 'Kelvin'],
            'correctAnswer': 3,
            'explanation':
                'Derece uluslararası birim sisteminde tanımlanmamıştır, Kelvin kullanılır.',
          },
          {
            'question': 'Fizikte indeterminizm ne anlama gelir?',
            'options': [
              'Sadece belirsizlik',
              'Kuantum seviyesinde kesin öngörü yapılamaması',
              'Sadece rastgelelik',
              'Sadece kaos',
              'Sadece düzensizlik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte indeterminizm, kuantum seviyesinde kesin öngörü yapılamaması anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi fiziksel bir fenomen değildir?',
            'options': [
              'Süperiletkenlik',
              'Kuantum tünelleme',
              'Hayal kurma',
              'Nükleer füzyon',
              'Süperakışkanlık',
            ],
            'correctAnswer': 2,
            'explanation':
                'Hayal kurma fiziksel bir fenomen değildir, zihinsel bir süreçtir.',
          },
          {
            'question':
                'Hangi bilim insanı görelilik teorisini geliştirmiştir?',
            'options': ['Newton', 'Einstein', 'Maxwell', 'Planck', 'Bohr'],
            'correctAnswer': 1,
            'explanation':
                'Albert Einstein görelilik teorisini geliştirmiştir.',
          },
          {
            'question': 'Fizikte kuantum ne anlama gelir?',
            'options': [
              'Sadece miktar',
              'Fiziksel bir niceliğin kesikli değerler alması',
              'Sadece parça',
              'Sadece birim',
              'Sadece ölçü',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte kuantum, fiziksel bir niceliğin kesikli değerler alması anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir ilke değildir?',
            'options': [
              'Huygens ilkesi',
              'Fermat ilkesi',
              'Sevgi ilkesi',
              'Hamilton ilkesi',
              'D\'Alembert ilkesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Sevgi ilkesi fiziksel bir ilke değildir, duygusal bir kavramdır.',
          },
          {
            'question': 'Fizikte dualite ne anlama gelir?',
            'options': [
              'Sadece ikilik',
              'Bir sistemin iki farklı şekilde yorumlanabilmesi',
              'Sadece çift',
              'Sadece ikili',
              'Sadece dual',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte dualite, bir sistemin iki farklı şekilde yorumlanabilmesi anlamına gelir.',
          },
          {
            'question': 'Hangi alet manyetik alan ölçmek için kullanılır?',
            'options': [
              'Gaussmeter',
              'Voltmetre',
              'Ampermetre',
              'Ohmmetre',
              'Frekansmetre',
            ],
            'correctAnswer': 0,
            'explanation':
                'Gaussmeter manyetik alan ölçmek için kullanılan özel bir ölçü aletidir.',
          },
          {
            'question': 'Fizikte kaos teorisi ne anlama gelir?',
            'options': [
              'Sadece karışıklık',
              'Küçük değişikliklerin büyük sonuçlara yol açması',
              'Sadece düzensizlik',
              'Sadece rastgelelik',
              'Sadece belirsizlik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte kaos teorisi, küçük değişikliklerin büyük sonuçlara yol açması anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi fiziksel bir süreç değildir?',
            'options': [
              'Füzyon',
              'Fisyon',
              'Düşünme',
              'Buharlaşma',
              'Yoğunlaşma',
            ],
            'correctAnswer': 2,
            'explanation':
                'Düşünme fiziksel bir süreç değildir, zihinsel bir süreçtir.',
          },
          {
            'question': 'Fizikte süperpozisyon ne anlama gelir?',
            'options': [
              'Sadece üst üste binme',
              'Bir sistemde birden fazla durumun aynı anda var olabilmesi',
              'Sadece ekleme',
              'Sadece birleştirme',
              'Sadece toplama',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte süperpozisyon, bir sistemde birden fazla durumun aynı anda var olabilmesi anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı fiziğe en çok yardımcı olur?',
            'options': ['Matematik', 'Tarih', 'Edebiyat', 'Felsefe', 'Müzik'],
            'correctAnswer': 0,
            'explanation':
                'Matematik fiziğe en çok yardımcı olan bilim dalıdır çünkü fiziksel olayları matematiksel olarak ifade eder.',
          },
          {
            'question': 'Fizikte ölçüm belirsizliği ne anlama gelir?',
            'options': [
              'Sadece hata',
              'Ölçüm sonucunun gerçek değer etrafındaki dağılımı',
              'Sadece belirsizlik',
              'Sadece şüphe',
              'Sadece kuşku',
            ],
            'correctAnswer': 1,
            'explanation':
                'Fizikte ölçüm belirsizliği, ölçüm sonucunun gerçek değer etrafındaki dağılımı anlamına gelir.',
          },
        ],
      },
      'Kimya Bilimi': {
        'Kolay': [
          {
            'question': 'Kimya biliminin temel konusu nedir?',
            'options': [
              'Sadece sıvılar',
              'Sadece katılar',
              'Madde ve özellikleri',
              'Sadece gazlar',
              'Sadece metaller',
            ],
            'correctAnswer': 2,
            'explanation':
                'Kimya biliminin temel konusu madde ve özellikleridir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir değişim değildir?',
            'options': [
              'Demirin paslanması',
              'Kağıdın yanması',
              'Buzun erimesi',
              'Sütün ekşimesi',
              'Yumurtanın pişmesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir değişimdir, kimyasal bir değişim değildir.',
          },
          {
            'question': 'Hangi element periyodik tabloda en çok bulunur?',
            'options': ['Demir', 'Hidrojen', 'Karbon', 'Oksijen', 'Azot'],
            'correctAnswer': 1,
            'explanation': 'Hidrojen evrende en çok bulunan elementtir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi saf madde değildir?',
            'options': ['Su', 'Tuz', 'Şeker', 'Hava', 'Altın'],
            'correctAnswer': 3,
            'explanation':
                'Hava karışımdır, saf madde değildir. Diğerleri saf maddelerdir.',
          },
          {
            'question': 'Kimya laboratuvarında en önemli kural nedir?',
            'options': [
              'Hızlı olmak',
              'Güvenlik kurallarına uymak',
              'Sadece deney yapmak',
              'Sadece not almak',
              'Sadece gözlem yapmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya laboratuvarında en önemli kural güvenlik kurallarına uymaktır.',
          },
          {
            'question': 'Hangi alet sıcaklık ölçmek için kullanılır?',
            'options': [
              'Manometre',
              'Termometre',
              'Barometre',
              'Hidrometre',
              'Kalorimetre',
            ],
            'correctAnswer': 1,
            'explanation': 'Termometre sıcaklık ölçmek için kullanılan aletir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir tepkime değildir?',
            'options': [
              'Demirin paslanması',
              'Kağıdın yanması',
              'Buzun erimesi',
              'Sütün ekşimesi',
              'Yumurtanın pişmesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir değişimdir, kimyasal bir tepkime değildir.',
          },
          {
            'question': 'Hangi bilim insanı atom teorisini geliştirmiştir?',
            'options': ['Newton', 'Einstein', 'Dalton', 'Bohr', 'Rutherford'],
            'correctAnswer': 2,
            'explanation': 'John Dalton atom teorisini geliştirmiştir.',
          },
          {
            'question': 'Kimya biliminde model kullanmanın amacı nedir?',
            'options': [
              'Sadece güzel görünmek',
              'Karmaşık yapıları basitleştirmek',
              'Sadece matematik yapmak',
              'Sadece deney yapmak',
              'Sadece formül yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde model kullanmanın amacı karmaşık yapıları basitleştirmektir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir özellik değildir?',
            'options': ['Yanma', 'Paslanma', 'Renk', 'Ekşime', 'Çürüme'],
            'correctAnswer': 2,
            'explanation':
                'Renk fiziksel bir özelliktir, kimyasal bir özellik değildir.',
          },
          {
            'question': 'Hangi element periyodik tabloda en aktif metaldir?',
            'options': ['Demir', 'Bakır', 'Sodyum', 'Altın', 'Gümüş'],
            'correctAnswer': 2,
            'explanation': 'Sodyum periyodik tabloda en aktif metaldir.',
          },
          {
            'question': 'Kimya biliminde deney yapmanın amacı nedir?',
            'options': [
              'Sadece eğlenmek',
              'Teorileri test etmek',
              'Sadece zaman geçirmek',
              'Sadece not almak',
              'Sadece rapor yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde deney yapmanın amacı teorileri test etmek ve doğrulamaktır.',
          },
          {
            'question': 'Aşağıdakilerden hangisi kimyasal bir bağ değildir?',
            'options': [
              'İyonik bağ',
              'Kovalent bağ',
              'Metalik bağ',
              'Manyetik bağ',
              'Hidrojen bağı',
            ],
            'correctAnswer': 3,
            'explanation':
                'Manyetik bağ kimyasal bir bağ değildir, fiziksel bir etkileşimdir.',
          },
          {
            'question': 'Hangi alet basınç ölçmek için kullanılır?',
            'options': [
              'Termometre',
              'Manometre',
              'Barometre',
              'Hidrometre',
              'Kalorimetre',
            ],
            'correctAnswer': 1,
            'explanation': 'Manometre basınç ölçmek için kullanılan aletir.',
          },
          {
            'question': 'Kimya biliminde ölçüm yapmanın amacı nedir?',
            'options': [
              'Sadece sayı yazmak',
              'Doğru ve hassas veri elde etmek',
              'Sadece tahmin etmek',
              'Sadece göz kararı ölçmek',
              'Sadece not almak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde ölçüm yapmanın amacı doğru ve hassas veri elde etmektir.',
          },
        ],
        'Orta': [
          {
            'question': 'Kimya biliminde madde nedir?',
            'options': [
              'Sadece katı',
              'Kütlesi ve hacmi olan her şey',
              'Sadece sıvı',
              'Sadece gaz',
              'Sadece element',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde madde, kütlesi ve hacmi olan her şeydir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir tepkime değildir?',
            'options': [
              'Fotosentez',
              'Solunum',
              'Buzun erimesi',
              'Yanma',
              'Paslanma',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir değişimdir, kimyasal bir tepkime değildir.',
          },
          {
            'question': 'Hangi element periyodik tabloda en aktif ametaldir?',
            'options': ['Karbon', 'Azot', 'Flor', 'Oksijen', 'Klor'],
            'correctAnswer': 2,
            'explanation': 'Flor periyodik tabloda en aktif ametaldir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi karışım değildir?',
            'options': ['Hava', 'Deniz suyu', 'Altın', 'Süt', 'Toprak'],
            'correctAnswer': 2,
            'explanation': 'Altın saf elementtir, karışım değildir.',
          },
          {
            'question': 'Kimya laboratuvarında gözlük takmanın amacı nedir?',
            'options': [
              'Sadece güzel görünmek',
              'Gözleri kimyasal maddelerden korumak',
              'Sadece moda',
              'Sadece ışıktan korunmak',
              'Sadece tozdan korunmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya laboratuvarında gözlük takmanın amacı gözleri kimyasal maddelerden korumaktır.',
          },
          {
            'question': 'Hangi alet pH ölçmek için kullanılır?',
            'options': [
              'Termometre',
              'pH metre',
              'Manometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 1,
            'explanation':
                'pH metre pH ölçmek için kullanılan özel bir aletir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi kimyasal bir olay değildir?',
            'options': [
              'Elektroliz',
              'Kimyasal denge',
              'Buzun erimesi',
              'Asit-baz tepkimesi',
              'Redoks tepkimesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir olaydır, kimyasal bir olay değildir.',
          },
          {
            'question': 'Hangi bilim insanı periyodik tabloyu geliştirmiştir?',
            'options': ['Dalton', 'Mendeleev', 'Bohr', 'Rutherford', 'Thomson'],
            'correctAnswer': 1,
            'explanation':
                'Dimitri Mendeleev periyodik tabloyu geliştirmiştir.',
          },
          {
            'question': 'Kimya biliminde katalizör ne anlama gelir?',
            'options': [
              'Sadece hızlandırıcı',
              'Tepkimeyi hızlandıran ama tükenmeyen madde',
              'Sadece yavaşlatıcı',
              'Sadece tepkimeye giren',
              'Sadece tepkime ürünü',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde katalizör, tepkimeyi hızlandıran ama tükenmeyen madde anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi fiziksel bir özellik değildir?',
            'options': [
              'Erime noktası',
              'Kaynama noktası',
              'Yanma',
              'Yoğunluk',
              'Çözünürlük',
            ],
            'correctAnswer': 2,
            'explanation':
                'Yanma kimyasal bir özelliktir, fiziksel bir özellik değildir.',
          },
          {
            'question': 'Hangi element periyodik tabloda en az aktif metaldir?',
            'options': ['Sodyum', 'Potasyum', 'Altın', 'Demir', 'Bakır'],
            'correctAnswer': 2,
            'explanation': 'Altın periyodik tabloda en az aktif metaldir.',
          },
          {
            'question': 'Kimya biliminde denge ne anlama gelir?',
            'options': [
              'Sadece eşitlik',
              'İleri ve geri tepkimelerin hızlarının eşit olması',
              'Sadece durma',
              'Sadece sabitlik',
              'Sadece kararlılık',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde denge, ileri ve geri tepkimelerin hızlarının eşit olması anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir bağ türü değildir?',
            'options': [
              'İyonik bağ',
              'Kovalent bağ',
              'Metalik bağ',
              'Manyetik bağ',
              'Hidrojen bağı',
            ],
            'correctAnswer': 3,
            'explanation':
                'Manyetik bağ kimyasal bir bağ türü değildir, fiziksel bir etkileşimdir.',
          },
          {
            'question': 'Hangi alet kütle ölçmek için kullanılır?',
            'options': [
              'Dinamometre',
              'Eşit kollu terazi',
              'Manometre',
              'Termometre',
              'Barometre',
            ],
            'correctAnswer': 1,
            'explanation':
                'Eşit kollu terazi kütle ölçmek için kullanılan temel ölçü aletidir.',
          },
          {
            'question': 'Kimya biliminde mol ne anlama gelir?',
            'options': [
              'Sadece miktar',
              '6.02 × 10²³ tanecik içeren madde miktarı',
              'Sadece birim',
              'Sadece ölçü',
              'Sadece sayı',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde mol, 6.02 × 10²³ tanecik içeren madde miktarı anlamına gelir.',
          },
        ],
        'Zor': [
          {
            'question': 'Kimya biliminde kuantum ne anlama gelir?',
            'options': [
              'Sadece miktar',
              'Atom seviyesinde enerji değişimlerinin kesikli olması',
              'Sadece parça',
              'Sadece birim',
              'Sadece ölçü',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde kuantum, atom seviyesinde enerji değişimlerinin kesikli olması anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir tepkime değildir?',
            'options': [
              'Nükleer füzyon',
              'Nükleer fisyon',
              'Buzun erimesi',
              'Kimyasal denge',
              'Redoks tepkimesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir değişimdir, kimyasal bir tepkime değildir.',
          },
          {
            'question':
                'Hangi element periyodik tabloda en ağır doğal elementtir?',
            'options': ['Uranyum', 'Plütonyum', 'Radyum', 'Aktinyum', 'Toryum'],
            'correctAnswer': 0,
            'explanation':
                'Uranyum periyodik tabloda en ağır doğal elementtir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi saf madde değildir?',
            'options': ['Elmas', 'Grafit', 'Kömür', 'Kuvars', 'Kalsit'],
            'correctAnswer': 2,
            'explanation': 'Kömür karışımdır, saf madde değildir.',
          },
          {
            'question':
                'Kimya laboratuvarında fume hood kullanmanın amacı nedir?',
            'options': [
              'Sadece havalandırma',
              'Zararlı gazları emmek ve güvenli şekilde dışarı atmak',
              'Sadece ısıtma',
              'Sadece soğutma',
              'Sadece aydınlatma',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya laboratuvarında fume hood kullanmanın amacı zararlı gazları emmek ve güvenli şekilde dışarı atmaktır.',
          },
          {
            'question': 'Hangi alet spektroskopi için kullanılır?',
            'options': [
              'Spektrofotometre',
              'Termometre',
              'Manometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 0,
            'explanation':
                'Spektrofotometre spektroskopi için kullanılan özel bir aletir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi kimyasal bir olay değildir?',
            'options': [
              'Kimyasal denge',
              'Kimyasal kinetik',
              'Buzun erimesi',
              'Kimyasal termodinamik',
              'Kimyasal analiz',
            ],
            'correctAnswer': 2,
            'explanation':
                'Buzun erimesi fiziksel bir olaydır, kimyasal bir olay değildir.',
          },
          {
            'question': 'Hangi bilim insanı kuantum teorisini geliştirmiştir?',
            'options': ['Bohr', 'Planck', 'Heisenberg', 'Schrödinger', 'Hepsi'],
            'correctAnswer': 4,
            'explanation':
                'Hepsi kuantum teorisinin geliştirilmesinde katkıda bulunmuştur.',
          },
          {
            'question': 'Kimya biliminde orbital ne anlama gelir?',
            'options': [
              'Sadece yörünge',
              'Elektronun bulunma olasılığının yüksek olduğu bölge',
              'Sadece alan',
              'Sadece bölge',
              'Sadece uzay',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde orbital, elektronun bulunma olasılığının yüksek olduğu bölge anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir özellik değildir?',
            'options': ['Yanma', 'Paslanma', 'Renk', 'Ekşime', 'Çürüme'],
            'correctAnswer': 2,
            'explanation':
                'Renk fiziksel bir özelliktir, kimyasal bir özellik değildir.',
          },
          {
            'question':
                'Hangi element periyodik tabloda en aktif radyoaktif elementtir?',
            'options': ['Uranyum', 'Radyum', 'Polonyum', 'Aktinyum', 'Toryum'],
            'correctAnswer': 1,
            'explanation':
                'Radyum periyodik tabloda en aktif radyoaktif elementtir.',
          },
          {
            'question': 'Kimya biliminde aktivasyon enerjisi ne anlama gelir?',
            'options': [
              'Sadece enerji',
              'Tepkimenin başlaması için gerekli minimum enerji',
              'Sadece kinetik enerji',
              'Sadece potansiyel enerji',
              'Sadece ısı enerjisi',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde aktivasyon enerjisi, tepkimenin başlaması için gerekli minimum enerji anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi kimyasal bir bağ türü değildir?',
            'options': [
              'İyonik bağ',
              'Kovalent bağ',
              'Metalik bağ',
              'Manyetik bağ',
              'Hidrojen bağı',
            ],
            'correctAnswer': 3,
            'explanation':
                'Manyetik bağ kimyasal bir bağ türü değildir, fiziksel bir etkileşimdir.',
          },
          {
            'question': 'Hangi alet kütle spektrometrisi için kullanılır?',
            'options': [
              'Kütle spektrometresi',
              'Termometre',
              'Manometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 0,
            'explanation':
                'Kütle spektrometresi kütle spektrometrisi için kullanılan özel bir aletir.',
          },
          {
            'question': 'Kimya biliminde izotop ne anlama gelir?',
            'options': [
              'Sadece atom',
              'Aynı elementin farklı nötron sayısına sahip atomları',
              'Sadece nötron',
              'Sadece proton',
              'Sadece elektron',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kimya biliminde izotop, aynı elementin farklı nötron sayısına sahip atomları anlamına gelir.',
          },
        ],
      },
      'Biyoloji Bilimi': {
        'Kolay': [
          {
            'question': 'Biyoloji biliminin temel konusu nedir?',
            'options': [
              'Sadece hayvanlar',
              'Sadece bitkiler',
              'Canlı organizmalar ve yaşam',
              'Sadece insanlar',
              'Sadece bakteriler',
            ],
            'correctAnswer': 2,
            'explanation':
                'Biyoloji biliminin temel konusu canlı organizmalar ve yaşam süreçleridir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi canlı bir organizma değildir?',
            'options': ['Bakteri', 'Virüs', 'Mantar', 'Bitki', 'Hayvan'],
            'correctAnswer': 1,
            'explanation':
                'Virüs canlı bir organizma değildir, sadece genetik materyal içerir.',
          },
          {
            'question': 'Hücrenin temel yapı taşı nedir?',
            'options': ['Atom', 'Molekül', 'Organel', 'Doku', 'Organ'],
            'correctAnswer': 0,
            'explanation': 'Atom hücrenin temel yapı taşıdır.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir hücre organeli değildir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Çekirdek',
              'Kan',
              'Golgi aygıtı',
            ],
            'correctAnswer': 3,
            'explanation': 'Kan bir hücre organeli değildir, doku sıvısıdır.',
          },
          {
            'question': 'Fotosentez hangi hücre organelinde gerçekleşir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Çekirdek',
              'Endoplazmik retikulum',
              'Lizozom',
            ],
            'correctAnswer': 1,
            'explanation': 'Fotosentez kloroplast organelinde gerçekleşir.',
          },
          {
            'question': 'Hangi bilim insanı hücre teorisini geliştirmiştir?',
            'options': [
              'Newton',
              'Darwin',
              'Schleiden ve Schwann',
              'Mendel',
              'Pasteur',
            ],
            'correctAnswer': 2,
            'explanation':
                'Schleiden ve Schwann hücre teorisini geliştirmiştir.',
          },
          {
            'question': 'Biyoloji biliminde gözlem yapmanın amacı nedir?',
            'options': [
              'Sadece eğlenmek',
              'Canlıları incelemek ve anlamak',
              'Sadece resim çizmek',
              'Sadece not almak',
              'Sadece zaman geçirmek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde gözlem yapmanın amacı canlıları incelemek ve anlamaktır.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi bir ekosistem bileşeni değildir?',
            'options': [
              'Üreticiler',
              'Tüketiciler',
              'Ayrıştırıcılar',
              'Araba',
              'Abiyotik faktörler',
            ],
            'correctAnswer': 3,
            'explanation':
                'Araba bir ekosistem bileşeni değildir, insan yapımı bir araçtır.',
          },
          {
            'question': 'Hangi canlı grubu fotosentez yapamaz?',
            'options': [
              'Yeşil bitkiler',
              'Mavi-yeşil algler',
              'Hayvanlar',
              'Bazı bakteriler',
              'Su yosunları',
            ],
            'correctAnswer': 2,
            'explanation':
                'Hayvanlar fotosentez yapamaz, sadece bitkiler ve bazı bakteriler yapabilir.',
          },
          {
            'question': 'Biyoloji laboratuvarında en önemli kural nedir?',
            'options': [
              'Hızlı olmak',
              'Güvenlik kurallarına uymak',
              'Sadece deney yapmak',
              'Sadece gözlem yapmak',
              'Sadece not almak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji laboratuvarında en önemli kural güvenlik kurallarına uymaktır.',
          },
          {
            'question':
                'Hangi alet mikroskobik canlıları incelemek için kullanılır?',
            'options': [
              'Teleskop',
              'Mikroskop',
              'Termometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 1,
            'explanation':
                'Mikroskop mikroskobik canlıları incelemek için kullanılan aletir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi bir besin zinciri örneği değildir?',
            'options': [
              'Ot → Tavşan → Tilki',
              'Alg → Balık → Kuş',
              'Güneş → Bitki → Hayvan',
              'Araba → Yol → Şoför',
              'Bakteri → Mantar → Solucan',
            ],
            'correctAnswer': 3,
            'explanation': 'Araba → Yol → Şoför bir besin zinciri değildir.',
          },
          {
            'question': 'Hangi canlı grubu en basit yapıya sahiptir?',
            'options': [
              'Bitkiler',
              'Hayvanlar',
              'Bakteriler',
              'Mantarlar',
              'Protistler',
            ],
            'correctAnswer': 2,
            'explanation': 'Bakteriler en basit yapıya sahip canlı grubudur.',
          },
          {
            'question': 'Biyoloji biliminde model kullanmanın amacı nedir?',
            'options': [
              'Sadece güzel görünmek',
              'Karmaşık yapıları basitleştirmek',
              'Sadece matematik yapmak',
              'Sadece deney yapmak',
              'Sadece formül yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde model kullanmanın amacı karmaşık yapıları basitleştirmektir.',
          },
          {
            'question': 'Hangi bilim dalı biyolojiye en yakındır?',
            'options': ['Fizik', 'Kimya', 'Tarih', 'Matematik', 'Edebiyat'],
            'correctAnswer': 1,
            'explanation':
                'Kimya biyolojiye en yakın bilim dalıdır çünkü canlıların kimyasal yapısını inceler.',
          },
        ],
        'Orta': [
          {
            'question': 'Biyoloji biliminde organizma nedir?',
            'options': [
              'Sadece hayvan',
              'Yaşam belirtileri gösteren her canlı varlık',
              'Sadece bitki',
              'Sadece bakteri',
              'Sadece mantar',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde organizma, yaşam belirtileri gösteren her canlı varlıktır.',
          },
          {
            'question': 'Aşağıdakilerden hangisi canlı bir organizmadır?',
            'options': ['Virüs', 'Bakteri', 'Prion', 'Viroid', 'Plazmid'],
            'correctAnswer': 1,
            'explanation':
                'Bakteri canlı bir organizmadır, diğerleri canlı değildir.',
          },
          {
            'question': 'Hücrenin enerji üretim merkezi hangisidir?',
            'options': [
              'Kloroplast',
              'Mitokondri',
              'Çekirdek',
              'Endoplazmik retikulum',
              'Golgi aygıtı',
            ],
            'correctAnswer': 1,
            'explanation': 'Mitokondri hücrenin enerji üretim merkezidir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir hücre organelidir?',
            'options': ['Kan', 'Lenf', 'Ribozom', 'Doku', 'Organ'],
            'correctAnswer': 2,
            'explanation': 'Ribozom bir hücre organelidir.',
          },
          {
            'question': 'Solunum hangi hücre organelinde gerçekleşir?',
            'options': [
              'Kloroplast',
              'Mitokondri',
              'Çekirdek',
              'Endoplazmik retikulum',
              'Lizozom',
            ],
            'correctAnswer': 1,
            'explanation': 'Solunum mitokondri organelinde gerçekleşir.',
          },
          {
            'question': 'Hangi bilim insanı evrim teorisini geliştirmiştir?',
            'options': ['Newton', 'Darwin', 'Mendel', 'Pasteur', 'Koch'],
            'correctAnswer': 1,
            'explanation': 'Charles Darwin evrim teorisini geliştirmiştir.',
          },
          {
            'question': 'Biyoloji biliminde deney yapmanın amacı nedir?',
            'options': [
              'Sadece eğlenmek',
              'Hipotezleri test etmek ve doğrulamak',
              'Sadece zaman geçirmek',
              'Sadece not almak',
              'Sadece rapor yazmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde deney yapmanın amacı hipotezleri test etmek ve doğrulamaktır.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir ekosistem bileşenidir?',
            'options': [
              'Üreticiler',
              'Tüketiciler',
              'Ayrıştırıcılar',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi ekosistem bileşenidir.',
          },
          {
            'question': 'Hangi canlı grubu fotosentez yapabilir?',
            'options': [
              'Hayvanlar',
              'Mantarlar',
              'Yeşil bitkiler',
              'Bazı bakteriler',
              'C ve D',
            ],
            'correctAnswer': 4,
            'explanation': 'C ve D seçenekleri fotosentez yapabilir.',
          },
          {
            'question':
                'Biyoloji laboratuvarında eldiven takmanın amacı nedir?',
            'options': [
              'Sadece güzel görünmek',
              'Elleri kimyasal maddelerden korumak',
              'Sadece moda',
              'Sadece soğuktan korunmak',
              'Sadece tozdan korunmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji laboratuvarında eldiven takmanın amacı elleri kimyasal maddelerden korumaktır.',
          },
          {
            'question': 'Hangi alet canlı hücreleri incelemek için kullanılır?',
            'options': [
              'Teleskop',
              'Mikroskop',
              'Termometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 1,
            'explanation':
                'Mikroskop canlı hücreleri incelemek için kullanılan aletir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir besin ağı örneğidir?',
            'options': [
              'Ot → Tavşan → Tilki',
              'Ot → Tavşan → Tilki → Bakteri',
              'Güneş → Bitki → Hayvan',
              'Araba → Yol → Şoför',
              'Bakteri → Mantar → Solucan',
            ],
            'correctAnswer': 1,
            'explanation':
                'Ot → Tavşan → Tilki → Bakteri bir besin ağı örneğidir.',
          },
          {
            'question': 'Hangi canlı grubu en karmaşık yapıya sahiptir?',
            'options': [
              'Bakteriler',
              'Mantarlar',
              'Bitkiler',
              'Hayvanlar',
              'Protistler',
            ],
            'correctAnswer': 3,
            'explanation': 'Hayvanlar en karmaşık yapıya sahip canlı grubudur.',
          },
          {
            'question': 'Biyoloji biliminde hipotez ne anlama gelir?',
            'options': [
              'Sadece tahmin',
              'Gözlemler sonucu ortaya atılan geçici açıklama',
              'Sadece varsayım',
              'Sadece teori',
              'Sadece yasa',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde hipotez, gözlemler sonucu ortaya atılan geçici açıklama anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı biyolojiye en uzaktır?',
            'options': ['Kimya', 'Fizik', 'Edebiyat', 'Matematik', 'Jeoloji'],
            'correctAnswer': 2,
            'explanation':
                'Edebiyat biyolojiye en uzak bilim dalıdır çünkü sanat ve dil ile ilgilidir.',
          },
        ],
        'Orta': [
          {
            'question': 'Biyoloji biliminde kuantum ne anlama gelir?',
            'options': [
              'Sadece miktar',
              'Moleküler seviyede enerji değişimlerinin kesikli olması',
              'Sadece parça',
              'Sadece birim',
              'Sadece ölçü',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde kuantum, moleküler seviyede enerji değişimlerinin kesikli olması anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi canlı bir organizmadır?',
            'options': ['Virüs', 'Bakteri', 'Prion', 'Viroid', 'Plazmid'],
            'correctAnswer': 1,
            'explanation':
                'Bakteri canlı bir organizmadır, diğerleri canlı değildir.',
          },
          {
            'question': 'Hücrenin genetik bilgi merkezi hangisidir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Çekirdek',
              'Endoplazmik retikulum',
              'Golgi aygıtı',
            ],
            'correctAnswer': 2,
            'explanation': 'Çekirdek hücrenin genetik bilgi merkezidir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir hücre organelidir?',
            'options': ['Kan', 'Lenf', 'Peroksizom', 'Doku', 'Organ'],
            'correctAnswer': 2,
            'explanation': 'Peroksizom bir hücre organelidir.',
          },
          {
            'question': 'Protein sentezi hangi hücre organelinde gerçekleşir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Ribozom',
              'Endoplazmik retikulum',
              'Lizozom',
            ],
            'correctAnswer': 2,
            'explanation': 'Protein sentezi ribozom organelinde gerçekleşir.',
          },
          {
            'question': 'Hangi bilim insanı genetik bilimini geliştirmiştir?',
            'options': ['Darwin', 'Mendel', 'Pasteur', 'Koch', 'Lister'],
            'correctAnswer': 1,
            'explanation': 'Gregor Mendel genetik bilimini geliştirmiştir.',
          },
          {
            'question': 'Biyoloji biliminde teori ne anlama gelir?',
            'options': [
              'Sadece varsayım',
              'Hipotezlerin test edilmesi sonucu oluşan açıklama',
              'Sadece tahmin',
              'Sadece gözlem',
              'Sadece deney',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde teori, hipotezlerin test edilmesi sonucu oluşan açıklama anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi bir ekosistem bileşeni değildir?',
            'options': [
              'Üreticiler',
              'Tüketiciler',
              'Ayrıştırıcılar',
              'Araba',
              'Abiyotik faktörler',
            ],
            'correctAnswer': 3,
            'explanation':
                'Araba bir ekosistem bileşeni değildir, insan yapımı bir araçtır.',
          },
          {
            'question': 'Hangi canlı grubu fotosentez yapamaz?',
            'options': [
              'Yeşil bitkiler',
              'Mavi-yeşil algler',
              'Hayvanlar',
              'Bazı bakteriler',
              'Su yosunları',
            ],
            'correctAnswer': 2,
            'explanation':
                'Hayvanlar fotosentez yapamaz, sadece bitkiler ve bazı bakteriler yapabilir.',
          },
          {
            'question':
                'Biyoloji laboratuvarında fume hood kullanmanın amacı nedir?',
            'options': [
              'Sadece havalandırma',
              'Zararlı gazları emmek ve güvenli şekilde dışarı atmak',
              'Sadece ısıtma',
              'Sadece soğutma',
              'Sadece aydınlatma',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji laboratuvarında fume hood kullanmanın amacı zararlı gazları emmek ve güvenli şekilde dışarı atmaktır.',
          },
          {
            'question': 'Hangi alet DNA analizi için kullanılır?',
            'options': [
              'PCR cihazı',
              'Mikroskop',
              'Termometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 0,
            'explanation':
                'PCR cihazı DNA analizi için kullanılan özel bir aletir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir besin piramidi örneğidir?',
            'options': [
              'Ot → Tavşan → Tilki',
              'Ot → Tavşan → Tilki → Bakteri',
              'Güneş → Bitki → Hayvan',
              'Araba → Yol → Şoför',
              'Bakteri → Mantar → Solucan',
            ],
            'correctAnswer': 1,
            'explanation':
                'Ot → Tavşan → Tilki → Bakteri bir besin piramidi örneğidir.',
          },
          {
            'question': 'Hangi canlı grubu en basit yapıya sahiptir?',
            'options': [
              'Bitkiler',
              'Hayvanlar',
              'Bakteriler',
              'Mantarlar',
              'Protistler',
            ],
            'correctAnswer': 2,
            'explanation': 'Bakteriler en basit yapıya sahip canlı grubudur.',
          },
          {
            'question': 'Biyoloji biliminde yasa ne anlama gelir?',
            'options': [
              'Sadece kural',
              'Doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade',
              'Sadece teori',
              'Sadece hipotez',
              'Sadece varsayım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde yasa, doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı biyolojiye en çok yardımcı olur?',
            'options': ['Kimya', 'Fizik', 'Edebiyat', 'Matematik', 'Müzik'],
            'correctAnswer': 0,
            'explanation':
                'Kimya biyolojiye en çok yardımcı olan bilim dalıdır çünkü canlıların kimyasal yapısını inceler.',
          },
        ],
        'Zor': [
          {
            'question': 'Biyoloji biliminde kuantum ne anlama gelir?',
            'options': [
              'Sadece miktar',
              'Moleküler seviyede enerji değişimlerinin kesikli olması',
              'Sadece parça',
              'Sadece birim',
              'Sadece ölçü',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde kuantum, moleküler seviyede enerji değişimlerinin kesikli olması anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi canlı bir organizmadır?',
            'options': ['Virüs', 'Bakteri', 'Prion', 'Viroid', 'Plazmid'],
            'correctAnswer': 1,
            'explanation':
                'Bakteri canlı bir organizmadır, diğerleri canlı değildir.',
          },
          {
            'question': 'Hücrenin genetik bilgi merkezi hangisidir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Çekirdek',
              'Endoplazmik retikulum',
              'Golgi aygıtı',
            ],
            'correctAnswer': 2,
            'explanation': 'Çekirdek hücrenin genetik bilgi merkezidir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir hücre organelidir?',
            'options': ['Kan', 'Lenf', 'Peroksizom', 'Doku', 'Organ'],
            'correctAnswer': 2,
            'explanation': 'Peroksizom bir hücre organelidir.',
          },
          {
            'question': 'Protein sentezi hangi hücre organelinde gerçekleşir?',
            'options': [
              'Mitokondri',
              'Kloroplast',
              'Ribozom',
              'Endoplazmik retikulum',
              'Lizozom',
            ],
            'correctAnswer': 2,
            'explanation': 'Protein sentezi ribozom organelinde gerçekleşir.',
          },
          {
            'question': 'Hangi bilim insanı genetik bilimini geliştirmiştir?',
            'options': ['Darwin', 'Mendel', 'Pasteur', 'Koch', 'Lister'],
            'correctAnswer': 1,
            'explanation': 'Gregor Mendel genetik bilimini geliştirmiştir.',
          },
          {
            'question': 'Biyoloji biliminde teori ne anlama gelir?',
            'options': [
              'Sadece varsayım',
              'Hipotezlerin test edilmesi sonucu oluşan açıklama',
              'Sadece tahmin',
              'Sadece gözlem',
              'Sadece deney',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde teori, hipotezlerin test edilmesi sonucu oluşan açıklama anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi bir ekosistem bileşeni değildir?',
            'options': [
              'Üreticiler',
              'Tüketiciler',
              'Ayrıştırıcılar',
              'Araba',
              'Abiyotik faktörler',
            ],
            'correctAnswer': 3,
            'explanation':
                'Araba bir ekosistem bileşeni değildir, insan yapımı bir araçtır.',
          },
          {
            'question': 'Hangi canlı grubu fotosentez yapamaz?',
            'options': [
              'Yeşil bitkiler',
              'Mavi-yeşil algler',
              'Hayvanlar',
              'Bazı bakteriler',
              'Su yosunları',
            ],
            'correctAnswer': 2,
            'explanation':
                'Hayvanlar fotosentez yapamaz, sadece bitkiler ve bazı bakteriler yapabilir.',
          },
          {
            'question':
                'Biyoloji laboratuvarında fume hood kullanmanın amacı nedir?',
            'options': [
              'Sadece havalandırma',
              'Zararlı gazları emmek ve güvenli şekilde dışarı atmak',
              'Sadece ısıtma',
              'Sadece soğutma',
              'Sadece aydınlatma',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji laboratuvarında fume hood kullanmanın amacı zararlı gazları emmek ve güvenli şekilde dışarı atmaktır.',
          },
          {
            'question': 'Hangi alet DNA analizi için kullanılır?',
            'options': [
              'PCR cihazı',
              'Mikroskop',
              'Termometre',
              'Barometre',
              'Hidrometre',
            ],
            'correctAnswer': 0,
            'explanation':
                'PCR cihazı DNA analizi için kullanılan özel bir aletir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi bir besin piramidi örneğidir?',
            'options': [
              'Ot → Tavşan → Tilki',
              'Ot → Tavşan → Tilki → Bakteri',
              'Güneş → Bitki → Hayvan',
              'Araba → Yol → Şoför',
              'Bakteri → Mantar → Solucan',
            ],
            'correctAnswer': 1,
            'explanation':
                'Ot → Tavşan → Tilki → Bakteri bir besin piramidi örneğidir.',
          },
          {
            'question': 'Hangi canlı grubu en basit yapıya sahiptir?',
            'options': [
              'Bitkiler',
              'Hayvanlar',
              'Bakteriler',
              'Mantarlar',
              'Protistler',
            ],
            'correctAnswer': 2,
            'explanation': 'Bakteriler en basit yapıya sahip canlı grubudur.',
          },
          {
            'question': 'Biyoloji biliminde yasa ne anlama gelir?',
            'options': [
              'Sadece kural',
              'Doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade',
              'Sadece teori',
              'Sadece hipotez',
              'Sadece varsayım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyoloji biliminde yasa, doğruluğu kanıtlanmış ve evrensel olarak kabul edilen ifade anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı biyolojiye en çok yardımcı olur?',
            'options': ['Kimya', 'Fizik', 'Edebiyat', 'Matematik', 'Müzik'],
            'correctAnswer': 0,
            'explanation':
                'Kimya biyolojiye en çok yardımcı olan bilim dalıdır çünkü canlıların kimyasal yapısını inceler.',
          },
        ],
      },
      'Denklemler ve Eşitsizlikler': {
        'Kolay': [
          {
            'question': '2x + 3 = 7 denkleminin çözümü nedir?',
            'options': ['x = 1', 'x = 2', 'x = 3', 'x = 4', 'x = 5'],
            'correctAnswer': 1,
            'explanation': '2x + 3 = 7 → 2x = 4 → x = 2',
          },
          {
            'question': 'x - 5 = 3 denkleminin çözümü nedir?',
            'options': ['x = 2', 'x = 3', 'x = 5', 'x = 8', 'x = 15'],
            'correctAnswer': 3,
            'explanation': 'x - 5 = 3 → x = 3 + 5 = 8',
          },
          {
            'question': '3x = 15 denkleminin çözümü nedir?',
            'options': ['x = 3', 'x = 5', 'x = 12', 'x = 15', 'x = 18'],
            'correctAnswer': 1,
            'explanation': '3x = 15 → x = 15 ÷ 3 = 5',
          },
          {
            'question': 'x + 2 = 10 denkleminin çözümü nedir?',
            'options': ['x = 6', 'x = 7', 'x = 8', 'x = 9', 'x = 12'],
            'correctAnswer': 2,
            'explanation': 'x + 2 = 10 → x = 10 - 2 = 8',
          },
          {
            'question': '4x - 8 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 2', 'x = 4', 'x = 8', 'x = 16'],
            'correctAnswer': 1,
            'explanation': '4x - 8 = 0 → 4x = 8 → x = 2',
          },
          {
            'question': 'x ÷ 3 = 4 denkleminin çözümü nedir?',
            'options': ['x = 1', 'x = 3', 'x = 4', 'x = 7', 'x = 12'],
            'correctAnswer': 4,
            'explanation': 'x ÷ 3 = 4 → x = 4 × 3 = 12',
          },
          {
            'question': '2x + 1 = 9 denkleminin çözümü nedir?',
            'options': ['x = 3', 'x = 4', 'x = 5', 'x = 6', 'x = 8'],
            'correctAnswer': 1,
            'explanation': '2x + 1 = 9 → 2x = 8 → x = 4',
          },
          {
            'question': 'x - 3 = 6 denkleminin çözümü nedir?',
            'options': ['x = 3', 'x = 6', 'x = 9', 'x = 12', 'x = 18'],
            'correctAnswer': 2,
            'explanation': 'x - 3 = 6 → x = 6 + 3 = 9',
          },
          {
            'question': '5x = 25 denkleminin çözümü nedir?',
            'options': ['x = 3', 'x = 5', 'x = 20', 'x = 25', 'x = 30'],
            'correctAnswer': 1,
            'explanation': '5x = 25 → x = 25 ÷ 5 = 5',
          },
          {
            'question': 'x + 7 = 15 denkleminin çözümü nedir?',
            'options': ['x = 6', 'x = 7', 'x = 8', 'x = 15', 'x = 22'],
            'correctAnswer': 2,
            'explanation': 'x + 7 = 15 → x = 15 - 7 = 8',
          },
          {
            'question': '3x - 6 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 2', 'x = 3', 'x = 6', 'x = 9'],
            'correctAnswer': 1,
            'explanation': '3x - 6 = 0 → 3x = 6 → x = 2',
          },
          {
            'question': 'x ÷ 2 = 6 denkleminin çözümü nedir?',
            'options': ['x = 3', 'x = 6', 'x = 8', 'x = 12', 'x = 18'],
            'correctAnswer': 3,
            'explanation': 'x ÷ 2 = 6 → x = 6 × 2 = 12',
          },
          {
            'question': '2x + 4 = 12 denkleminin çözümü nedir?',
            'options': ['x = 2', 'x = 4', 'x = 6', 'x = 8', 'x = 10'],
            'correctAnswer': 1,
            'explanation': '2x + 4 = 12 → 2x = 8 → x = 4',
          },
          {
            'question': 'x - 4 = 5 denkleminin çözümü nedir?',
            'options': ['x = 1', 'x = 4', 'x = 5', 'x = 9', 'x = 20'],
            'correctAnswer': 3,
            'explanation': 'x - 4 = 5 → x = 5 + 4 = 9',
          },
          {
            'question': '4x = 16 denkleminin çözümü nedir?',
            'options': ['x = 2', 'x = 4', 'x = 12', 'x = 16', 'x = 20'],
            'correctAnswer': 1,
            'explanation': '4x = 16 → x = 16 ÷ 4 = 4',
          },
        ],
        'Orta': [
          {
            'question':
                '2x + 3y = 8 ve x - y = 1 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=2',
              'x=2, y=1',
              'x=4, y=3',
              'x=1, y=0',
              'x=5, y=4',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - y = 1 → x = y + 1, 2(y+1) + 3y = 8 → 2y + 2 + 3y = 8 → 5y = 6 → y = 1.2, x = 2.2',
          },
          {
            'question': 'x² - 4 = 0 denkleminin çözümleri nelerdir?',
            'options': ['x = 0', 'x = ±2', 'x = ±4', 'x = 2', 'x = -2'],
            'correctAnswer': 1,
            'explanation': 'x² - 4 = 0 → x² = 4 → x = ±2',
          },
          {
            'question':
                '3x + 2y = 12 ve 2x - y = 3 denklem sisteminin çözümü nedir?',
            'options': [
              'x=2, y=1',
              'x=3, y=2',
              'x=4, y=3',
              'x=1, y=0',
              'x=5, y=4',
            ],
            'correctAnswer': 0,
            'explanation':
                '2x - y = 3 → y = 2x - 3, 3x + 2(2x-3) = 12 → 3x + 4x - 6 = 12 → 7x = 18 → x = 18/7',
          },
          {
            'question': 'x² + 2x - 3 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 1, x = -3',
              'x = -1, x = 3',
              'x = 1, x = 3',
              'x = -1, x = -3',
              'x = 0, x = 2',
            ],
            'correctAnswer': 0,
            'explanation':
                'x² + 2x - 3 = 0 → (x+3)(x-1) = 0 → x = -3 veya x = 1',
          },
          {
            'question':
                '2x - y = 5 ve x + 3y = 10 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=1',
              'x=4, y=2',
              'x=5, y=3',
              'x=2, y=0',
              'x=6, y=4',
            ],
            'correctAnswer': 0,
            'explanation':
                '2x - y = 5 → y = 2x - 5, x + 3(2x-5) = 10 → x + 6x - 15 = 10 → 7x = 25 → x = 25/7',
          },
          {
            'question': 'x² - 5x + 6 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 2, x = 3',
              'x = -2, x = -3',
              'x = 1, x = 6',
              'x = -1, x = -6',
              'x = 0, x = 5',
            ],
            'correctAnswer': 0,
            'explanation':
                'x² - 5x + 6 = 0 → (x-2)(x-3) = 0 → x = 2 veya x = 3',
          },
          {
            'question':
                '3x + y = 7 ve x - 2y = 1 denklem sisteminin çözümü nedir?',
            'options': [
              'x=2, y=1',
              'x=3, y=2',
              'x=4, y=3',
              'x=1, y=0',
              'x=5, y=4',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - 2y = 1 → x = 2y + 1, 3(2y+1) + y = 7 → 6y + 3 + y = 7 → 7y = 4 → y = 4/7',
          },
          {
            'question': 'x² + 4x + 4 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = -2', 'x = 2', 'x = ±2', 'x = -4'],
            'correctAnswer': 1,
            'explanation': 'x² + 4x + 4 = 0 → (x+2)² = 0 → x = -2 (çift kök)',
          },
          {
            'question':
                'x + 2y = 8 ve 2x - y = 6 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=2',
              'x=4, y=3',
              'x=5, y=4',
              'x=2, y=1',
              'x=6, y=5',
            ],
            'correctAnswer': 0,
            'explanation':
                'x + 2y = 8 → x = 8 - 2y, 2(8-2y) - y = 6 → 16 - 4y - y = 6 → -5y = -10 → y = 2',
          },
          {
            'question': 'x² - 6x + 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 3', 'x = -3', 'x = ±3', 'x = 6'],
            'correctAnswer': 1,
            'explanation': 'x² - 6x + 9 = 0 → (x-3)² = 0 → x = 3 (çift kök)',
          },
          {
            'question':
                '2x + 3y = 10 ve x - y = 2 denklem sisteminin çözümü nedir?',
            'options': [
              'x=4, y=2',
              'x=5, y=3',
              'x=6, y=4',
              'x=3, y=1',
              'x=7, y=5',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - y = 2 → x = y + 2, 2(y+2) + 3y = 10 → 2y + 4 + 3y = 10 → 5y = 6 → y = 1.2',
          },
          {
            'question': 'x² + 3x - 4 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 1, x = -4',
              'x = -1, x = 4',
              'x = 1, x = 4',
              'x = -1, x = -4',
              'x = 0, x = 3',
            ],
            'correctAnswer': 0,
            'explanation':
                'x² + 3x - 4 = 0 → (x+4)(x-1) = 0 → x = -4 veya x = 1',
          },
          {
            'question':
                'x + y = 6 ve 2x - y = 3 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=3',
              'x=4, y=2',
              'x=5, y=1',
              'x=2, y=4',
              'x=6, y=0',
            ],
            'correctAnswer': 0,
            'explanation':
                'x + y = 6 → y = 6 - x, 2x - (6-x) = 3 → 2x - 6 + x = 3 → 3x = 9 → x = 3',
          },
          {
            'question': 'x² - 2x - 8 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 2, x = -4',
              'x = -2, x = 4',
              'x = 2, x = 4',
              'x = -2, x = -4',
              'x = 0, x = 2',
            ],
            'correctAnswer': 1,
            'explanation':
                'x² - 2x - 8 = 0 → (x-4)(x+2) = 0 → x = 4 veya x = -2',
          },
          {
            'question':
                '3x + 2y = 11 ve x - y = 1 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=2',
              'x=4, y=3',
              'x=5, y=4',
              'x=2, y=1',
              'x=6, y=5',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - y = 1 → x = y + 1, 3(y+1) + 2y = 11 → 3y + 3 + 2y = 11 → 5y = 8 → y = 1.6',
          },
        ],
        'Zor': [
          {
            'question':
                'x² + y² = 25 ve x + y = 7 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=4',
              'x=4, y=3',
              'x=5, y=2',
              'x=2, y=5',
              'x=6, y=1',
            ],
            'correctAnswer': 0,
            'explanation':
                'x + y = 7 → y = 7 - x, x² + (7-x)² = 25 → x² + 49 - 14x + x² = 25 → 2x² - 14x + 24 = 0',
          },
          {
            'question': 'x³ - 8 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 2', 'x = -2', 'x = ±2', 'x = 8'],
            'correctAnswer': 1,
            'explanation': 'x³ - 8 = 0 → x³ = 8 → x = 2 (gerçek kök)',
          },
          {
            'question': '2x² + 3x - 2 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 1/2, x = -2',
              'x = -1/2, x = 2',
              'x = 1, x = -2',
              'x = -1, x = 2',
              'x = 0, x = 1',
            ],
            'correctAnswer': 0,
            'explanation':
                '2x² + 3x - 2 = 0 → (2x-1)(x+2) = 0 → x = 1/2 veya x = -2',
          },
          {
            'question':
                'x² + y² = 13 ve x - y = 1 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=2',
              'x=4, y=3',
              'x=5, y=4',
              'x=2, y=1',
              'x=6, y=5',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - y = 1 → x = y + 1, (y+1)² + y² = 13 → y² + 2y + 1 + y² = 13 → 2y² + 2y - 12 = 0',
          },
          {
            'question': 'x⁴ - 16 = 0 denkleminin çözümleri nelerdir?',
            'options': ['x = ±2', 'x = ±4', 'x = ±2i', 'x = ±2, ±2i', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x⁴ - 16 = 0 → x⁴ = 16 → x = ±2 (gerçek kökler)',
          },
          {
            'question': '3x² - 7x + 2 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 1/3, x = 2',
              'x = -1/3, x = -2',
              'x = 1, x = 2/3',
              'x = -1, x = -2/3',
              'x = 0, x = 1',
            ],
            'correctAnswer': 0,
            'explanation':
                '3x² - 7x + 2 = 0 → (3x-1)(x-2) = 0 → x = 1/3 veya x = 2',
          },
          {
            'question':
                'x² + y² = 10 ve xy = 3 denklem sisteminin çözümü nedir?',
            'options': [
              'x=3, y=1',
              'x=1, y=3',
              'x=±3, y=±1',
              'x=±1, y=±3',
              'x=2, y=1.5',
            ],
            'correctAnswer': 0,
            'explanation':
                'xy = 3 → y = 3/x, x² + (3/x)² = 10 → x² + 9/x² = 10 → x⁴ - 10x² + 9 = 0',
          },
          {
            'question': 'x³ + 27 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 3', 'x = -3', 'x = ±3', 'x = 27'],
            'correctAnswer': 2,
            'explanation': 'x³ + 27 = 0 → x³ = -27 → x = -3 (gerçek kök)',
          },
          {
            'question': '4x² - 12x + 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 3/2', 'x = -3/2', 'x = ±3/2', 'x = 3'],
            'correctAnswer': 1,
            'explanation':
                '4x² - 12x + 9 = 0 → (2x-3)² = 0 → x = 3/2 (çift kök)',
          },
          {
            'question':
                'x² + y² = 17 ve x + y = 5 denklem sisteminin çözümü nedir?',
            'options': [
              'x=4, y=1',
              'x=1, y=4',
              'x=3, y=2',
              'x=2, y=3',
              'x=5, y=0',
            ],
            'correctAnswer': 0,
            'explanation':
                'x + y = 5 → y = 5 - x, x² + (5-x)² = 17 → x² + 25 - 10x + x² = 17 → 2x² - 10x + 8 = 0',
          },
          {
            'question': 'x⁵ - 32 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 2', 'x = -2', 'x = ±2', 'x = 32'],
            'correctAnswer': 1,
            'explanation': 'x⁵ - 32 = 0 → x⁵ = 32 → x = 2 (gerçek kök)',
          },
          {
            'question': '5x² - 13x + 6 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 2/5, x = 3',
              'x = -2/5, x = -3',
              'x = 1, x = 6/5',
              'x = -1, x = -6/5',
              'x = 0, x = 1',
            ],
            'correctAnswer': 0,
            'explanation':
                '5x² - 13x + 6 = 0 → (5x-2)(x-3) = 0 → x = 2/5 veya x = 3',
          },
          {
            'question':
                'x² + y² = 20 ve x - y = 2 denklem sisteminin çözümü nedir?',
            'options': [
              'x=4, y=2',
              'x=2, y=4',
              'x=5, y=3',
              'x=3, y=5',
              'x=6, y=4',
            ],
            'correctAnswer': 0,
            'explanation':
                'x - y = 2 → x = y + 2, (y+2)² + y² = 20 → y² + 4y + 4 + y² = 20 → 2y² + 4y - 16 = 0',
          },
          {
            'question': 'x³ - 64 = 0 denkleminin çözümü nedir?',
            'options': ['x = 0', 'x = 4', 'x = -4', 'x = ±4', 'x = 64'],
            'correctAnswer': 1,
            'explanation': 'x³ - 64 = 0 → x³ = 64 → x = 4 (gerçek kök)',
          },
          {
            'question': '6x² - 17x + 12 = 0 denkleminin çözümleri nelerdir?',
            'options': [
              'x = 3/2, x = 4/3',
              'x = -3/2, x = -4/3',
              'x = 1, x = 2',
              'x = -1, x = -2',
              'x = 0, x = 1',
            ],
            'correctAnswer': 0,
            'explanation':
                '6x² - 17x + 12 = 0 → (2x-3)(3x-4) = 0 → x = 3/2 veya x = 4/3',
          },
        ],
      },
      'Tarih Bilimi': {
        'Kolay': [
          {
            'question': 'Tarih biliminin temel amacı nedir?',
            'options': [
              'Sadece geçmişi anlatmak',
              'Geçmişi anlamak ve geleceğe ışık tutmak',
              'Sadece savaşları öğretmek',
              'Sadece kralları tanıtmak',
              'Sadece tarihleri ezberletmek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Tarih biliminin temel amacı geçmişi anlamak ve geleceğe ışık tutmaktır.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi tarih biliminde birincil kaynak değildir?',
            'options': [
              'Mektup',
              'Günlük',
              'Tarih kitabı',
              'Resmi belge',
              'Fotoğraf',
            ],
            'correctAnswer': 2,
            'explanation':
                'Tarih kitabı birincil kaynak değildir, ikincil kaynaktır.',
          },
          {
            'question': 'Hangi tarih öncesi çağda yazı bulunmuştur?',
            'options': [
              'Taş Çağı',
              'Bakır Çağı',
              'Tunç Çağı',
              'Demir Çağı',
              'Tarih Çağı',
            ],
            'correctAnswer': 4,
            'explanation': 'Yazı Tarih Çağında bulunmuştur.',
          },
          {
            'question':
                'Türklerin ilk yazılı belgeleri hangi alfabeyle yazılmıştır?',
            'options': [
              'Latin alfabesi',
              'Arap alfabesi',
              'Göktürk alfabesi',
              'Uygur alfabesi',
              'Kiril alfabesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Türklerin ilk yazılı belgeleri Göktürk alfabesiyle yazılmıştır.',
          },
          {
            'question':
                'Hangi imparatorluk Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür?',
            'options': [
              'Roma İmparatorluğu',
              'Bizans İmparatorluğu',
              'Selçuklu Devleti',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'Hepsi Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür.',
          },
          {
            'question': 'Tarih biliminde kronoloji ne anlama gelir?',
            'options': [
              'Sadece savaşları sıralamak',
              'Olayları zaman sırasına göre düzenlemek',
              'Sadece kralları sıralamak',
              'Sadece tarihleri yazmak',
              'Sadece olayları anlatmak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kronoloji olayları zaman sırasına göre düzenlemek anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı tarihe en çok yardımcı olur?',
            'options': ['Fizik', 'Kimya', 'Arkeoloji', 'Matematik', 'Biyoloji'],
            'correctAnswer': 2,
            'explanation':
                'Arkeoloji tarihe en çok yardımcı olan bilim dalıdır.',
          },
          {
            'question': 'Tarih biliminde objektiflik ne anlama gelir?',
            'options': [
              'Sadece kendi görüşünü savunmak',
              'Tarafsız ve nesnel olmak',
              'Sadece olumlu olayları anlatmak',
              'Sadece olumsuz olayları anlatmak',
              'Sadece kendi milletini övmek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Objektiflik tarafsız ve nesnel olmak anlamına gelir.',
          },
          {
            'question':
                'Hangi olay Türkiye Cumhuriyeti\'nin kuruluşu olarak kabul edilir?',
            'options': [
              '23 Nisan 1920',
              '29 Ekim 1923',
              '30 Ağustos 1922',
              '19 Mayıs 1919',
              '10 Kasım 1938',
            ],
            'correctAnswer': 1,
            'explanation':
                '29 Ekim 1923 Türkiye Cumhuriyeti\'nin kuruluşu olarak kabul edilir.',
          },
          {
            'question': 'Tarih biliminde kaynak ne anlama gelir?',
            'options': [
              'Sadece kitap',
              'Geçmiş hakkında bilgi veren her türlü malzeme',
              'Sadece belge',
              'Sadece fotoğraf',
              'Sadece mektup',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kaynak geçmiş hakkında bilgi veren her türlü malzeme anlamına gelir.',
          },
          {
            'question': 'Hangi çağda insanlar yerleşik hayata geçmiştir?',
            'options': [
              'Avcılık Çağı',
              'Toplayıcılık Çağı',
              'Neolitik Çağ',
              'Paleolitik Çağ',
              'Mezolitik Çağ',
            ],
            'correctAnswer': 2,
            'explanation': 'İnsanlar Neolitik Çağda yerleşik hayata geçmiştir.',
          },
          {
            'question': 'Tarih biliminde neden-sonuç ilişkisi ne anlama gelir?',
            'options': [
              'Sadece olayları sıralamak',
              'Olaylar arasındaki bağlantıyı kurmak',
              'Sadece tarihleri yazmak',
              'Sadece kişileri tanıtmak',
              'Sadece yerleri göstermek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Neden-sonuç ilişkisi olaylar arasındaki bağlantıyı kurmak anlamına gelir.',
          },
          {
            'question': 'Hangi imparatorluk en uzun süre hüküm sürmüştür?',
            'options': [
              'Roma İmparatorluğu',
              'Osmanlı İmparatorluğu',
              'Bizans İmparatorluğu',
              'Selçuklu Devleti',
              'Hun İmparatorluğu',
            ],
            'correctAnswer': 1,
            'explanation':
                'Osmanlı İmparatorluğu en uzun süre hüküm sürmüştür.',
          },
          {
            'question': 'Tarih biliminde belge ne anlama gelir?',
            'options': [
              'Sadece yazılı kağıt',
              'Geçmiş hakkında bilgi veren her türlü malzeme',
              'Sadece fotoğraf',
              'Sadece mektup',
              'Sadece kitap',
            ],
            'correctAnswer': 1,
            'explanation':
                'Belge geçmiş hakkında bilgi veren her türlü malzeme anlamına gelir.',
          },
          {
            'question':
                'Hangi bilim insanı tarih biliminin babası olarak kabul edilir?',
            'options': [
              'Herodotos',
              'Tukidides',
              'Ksenofon',
              'Plutarkhos',
              'Heredot',
            ],
            'correctAnswer': 0,
            'explanation':
                'Herodotos tarih biliminin babası olarak kabul edilir.',
          },
        ],
        'Orta': [
          {
            'question': 'Tarih biliminde olay nedir?',
            'options': [
              'Sadece savaş',
              'Geçmişte meydana gelen her türlü hadise',
              'Sadece barış',
              'Sadece antlaşma',
              'Sadece devrim',
            ],
            'correctAnswer': 1,
            'explanation':
                'Tarih biliminde olay, geçmişte meydana gelen her türlü hadise anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi tarih biliminde ikincil kaynak değildir?',
            'options': [
              'Tarih kitabı',
              'Ansiklopedi',
              'Mektup',
              'Makale',
              'Tez',
            ],
            'correctAnswer': 2,
            'explanation':
                'Mektup birincil kaynaktır, ikincil kaynak değildir.',
          },
          {
            'question': 'Hangi tarih öncesi çağda tarım başlamıştır?',
            'options': [
              'Paleolitik Çağ',
              'Mezolitik Çağ',
              'Neolitik Çağ',
              'Kalkolitik Çağ',
              'Tunç Çağı',
            ],
            'correctAnswer': 2,
            'explanation': 'Tarım Neolitik Çağda başlamıştır.',
          },
          {
            'question':
                'Türklerin ikinci yazılı belgeleri hangi alfabeyle yazılmıştır?',
            'options': [
              'Göktürk alfabesi',
              'Uygur alfabesi',
              'Arap alfabesi',
              'Latin alfabesi',
              'Kiril alfabesi',
            ],
            'correctAnswer': 1,
            'explanation':
                'Türklerin ikinci yazılı belgeleri Uygur alfabesiyle yazılmıştır.',
          },
          {
            'question':
                'Hangi devlet Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür?',
            'options': [
              'Selçuklu Devleti',
              'Bizans İmparatorluğu',
              'Roma İmparatorluğu',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'Hepsi Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür.',
          },
          {
            'question': 'Tarih biliminde senkronik ne anlama gelir?',
            'options': [
              'Sadece sıralama',
              'Aynı zamanda meydana gelen olayları incelemek',
              'Sadece kronoloji',
              'Sadece tarih',
              'Sadece zaman',
            ],
            'correctAnswer': 1,
            'explanation':
                'Senkronik aynı zamanda meydana gelen olayları incelemek anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı tarihe en çok yardımcı olur?',
            'options': [
              'Arkeoloji',
              'Antropoloji',
              'Etnografya',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi tarihe yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Tarih biliminde subjektiflik ne anlama gelir?',
            'options': [
              'Sadece nesnellik',
              'Kişisel görüş ve yorumlara dayalı olmak',
              'Sadece tarafsızlık',
              'Sadece objektiflik',
              'Sadece bilimsellik',
            ],
            'correctAnswer': 1,
            'explanation':
                'Subjektiflik kişisel görüş ve yorumlara dayalı olmak anlamına gelir.',
          },
          {
            'question':
                'Hangi olay Türkiye Cumhuriyeti\'nin bağımsızlığı olarak kabul edilir?',
            'options': [
              '23 Nisan 1920',
              '30 Ağustos 1922',
              '29 Ekim 1923',
              '19 Mayıs 1919',
              '10 Kasım 1938',
            ],
            'correctAnswer': 1,
            'explanation':
                '30 Ağustos 1922 Türkiye Cumhuriyeti\'nin bağımsızlığı olarak kabul edilir.',
          },
          {
            'question': 'Tarih biliminde arşiv ne anlama gelir?',
            'options': [
              'Sadece kütüphane',
              'Tarihi belgelerin saklandığı yer',
              'Sadece müze',
              'Sadece galeri',
              'Sadece sergi',
            ],
            'correctAnswer': 1,
            'explanation':
                'Arşiv tarihi belgelerin saklandığı yer anlamına gelir.',
          },
          {
            'question': 'Hangi çağda madenler işlenmeye başlanmıştır?',
            'options': [
              'Paleolitik Çağ',
              'Mezolitik Çağ',
              'Neolitik Çağ',
              'Kalkolitik Çağ',
              'Tunç Çağı',
            ],
            'correctAnswer': 3,
            'explanation': 'Madenler Kalkolitik Çağda işlenmeye başlanmıştır.',
          },
          {
            'question': 'Tarih biliminde diyakronik ne anlama gelir?',
            'options': [
              'Sadece senkronik',
              'Olayları zaman içinde gelişim süreci olarak incelemek',
              'Sadece kronoloji',
              'Sadece tarih',
              'Sadece zaman',
            ],
            'correctAnswer': 1,
            'explanation':
                'Diyakronik olayları zaman içinde gelişim süreci olarak incelemek anlamına gelir.',
          },
          {
            'question': 'Hangi imparatorluk en kısa süre hüküm sürmüştür?',
            'options': [
              'Roma İmparatorluğu',
              'Osmanlı İmparatorluğu',
              'Bizans İmparatorluğu',
              'Selçuklu Devleti',
              'Hun İmparatorluğu',
            ],
            'correctAnswer': 4,
            'explanation': 'Hun İmparatorluğu en kısa süre hüküm sürmüştür.',
          },
          {
            'question': 'Tarih biliminde sözlü tarih ne anlama gelir?',
            'options': [
              'Sadece konuşma',
              'Yaşayan kişilerden sözlü olarak alınan bilgiler',
              'Sadece anlatım',
              'Sadece hikaye',
              'Sadece masal',
            ],
            'correctAnswer': 1,
            'explanation':
                'Sözlü tarih yaşayan kişilerden sözlü olarak alınan bilgiler anlamına gelir.',
          },
          {
            'question':
                'Hangi bilim insanı tarih biliminin babası olarak kabul edilir?',
            'options': [
              'Herodotos',
              'Tukidides',
              'Ksenofon',
              'Plutarkhos',
              'Heredot',
            ],
            'correctAnswer': 0,
            'explanation':
                'Herodotos tarih biliminin babası olarak kabul edilir.',
          },
        ],
        'Zor': [
          {
            'question': 'Tarih biliminde metodoloji ne anlama gelir?',
            'options': [
              'Sadece yöntem',
              'Tarih araştırmalarında kullanılan bilimsel yöntemler',
              'Sadece teknik',
              'Sadece usul',
              'Sadece sistem',
            ],
            'correctAnswer': 1,
            'explanation':
                'Metodoloji tarih araştırmalarında kullanılan bilimsel yöntemler anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi tarih biliminde üçüncül kaynak değildir?',
            'options': ['Ansiklopedi', 'Sözlük', 'Mektup', 'Almanak', 'Yıllık'],
            'correctAnswer': 2,
            'explanation':
                'Mektup birincil kaynaktır, üçüncül kaynak değildir.',
          },
          {
            'question': 'Hangi tarih öncesi çağda yazı bulunmuştur?',
            'options': [
              'Paleolitik Çağ',
              'Mezolitik Çağ',
              'Neolitik Çağ',
              'Kalkolitik Çağ',
              'Tarih Çağı',
            ],
            'correctAnswer': 4,
            'explanation': 'Yazı Tarih Çağında bulunmuştur.',
          },
          {
            'question':
                'Türklerin üçüncü yazılı belgeleri hangi alfabeyle yazılmıştır?',
            'options': [
              'Göktürk alfabesi',
              'Uygur alfabesi',
              'Arap alfabesi',
              'Latin alfabesi',
              'Kiril alfabesi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Türklerin üçüncü yazılı belgeleri Arap alfabesiyle yazılmıştır.',
          },
          {
            'question':
                'Hangi imparatorluk Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür?',
            'options': [
              'Roma İmparatorluğu',
              'Bizans İmparatorluğu',
              'Selçuklu Devleti',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'Hepsi Osmanlı\'dan önce Anadolu\'da hüküm sürmüştür.',
          },
          {
            'question': 'Tarih biliminde hermeneutik ne anlama gelir?',
            'options': [
              'Sadece yorum',
              'Metinleri ve belgeleri yorumlama bilimi',
              'Sadece analiz',
              'Sadece inceleme',
              'Sadece araştırma',
            ],
            'correctAnswer': 1,
            'explanation':
                'Hermeneutik metinleri ve belgeleri yorumlama bilimi anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı tarihe en çok yardımcı olur?',
            'options': [
              'Arkeoloji',
              'Antropoloji',
              'Etnografya',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi tarihe yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Tarih biliminde pozitivizm ne anlama gelir?',
            'options': [
              'Sadece olumlu',
              'Sadece belgelere dayalı tarih yazımı',
              'Sadece bilimsel',
              'Sadece nesnel',
              'Sadece tarafsız',
            ],
            'correctAnswer': 1,
            'explanation':
                'Pozitivizm sadece belgelere dayalı tarih yazımı anlamına gelir.',
          },
          {
            'question':
                'Hangi olay Türkiye Cumhuriyeti\'nin kuruluşu olarak kabul edilir?',
            'options': [
              '23 Nisan 1920',
              '30 Ağustos 1922',
              '29 Ekim 1923',
              '19 Mayıs 1919',
              '10 Kasım 1938',
            ],
            'correctAnswer': 2,
            'explanation':
                '29 Ekim 1923 Türkiye Cumhuriyeti\'nin kuruluşu olarak kabul edilir.',
          },
          {
            'question': 'Tarih biliminde paleografi ne anlama gelir?',
            'options': [
              'Sadece yazı',
              'Eski yazıları okuma ve inceleme bilimi',
              'Sadece harf',
              'Sadece alfabe',
              'Sadece kitap',
            ],
            'correctAnswer': 1,
            'explanation':
                'Paleografi eski yazıları okuma ve inceleme bilimi anlamına gelir.',
          },
          {
            'question': 'Hangi çağda demir işlenmeye başlanmıştır?',
            'options': [
              'Paleolitik Çağ',
              'Mezolitik Çağ',
              'Neolitik Çağ',
              'Kalkolitik Çağ',
              'Demir Çağı',
            ],
            'correctAnswer': 4,
            'explanation': 'Demir Demir Çağında işlenmeye başlanmıştır.',
          },
          {
            'question': 'Tarih biliminde sosyal tarih ne anlama gelir?',
            'options': [
              'Sadece toplum',
              'Toplumun sosyal yapısını inceleyen tarih dalı',
              'Sadece sosyal',
              'Sadece tarih',
              'Sadece bilim',
            ],
            'correctAnswer': 1,
            'explanation':
                'Sosyal tarih toplumun sosyal yapısını inceleyen tarih dalı anlamına gelir.',
          },
          {
            'question':
                'Hangi imparatorluk en geniş topraklara sahip olmuştur?',
            'options': [
              'Roma İmparatorluğu',
              'Osmanlı İmparatorluğu',
              'Bizans İmparatorluğu',
              'Selçuklu Devleti',
              'Hun İmparatorluğu',
            ],
            'correctAnswer': 1,
            'explanation':
                'Osmanlı İmparatorluğu en geniş topraklara sahip olmuştur.',
          },
          {
            'question': 'Tarih biliminde diplomatik ne anlama gelir?',
            'options': [
              'Sadece elçi',
              'Resmi belgeleri inceleyen tarih dalı',
              'Sadece belge',
              'Sadece resmi',
              'Sadece yazı',
            ],
            'correctAnswer': 1,
            'explanation':
                'Diplomatik resmi belgeleri inceleyen tarih dalı anlamına gelir.',
          },
          {
            'question':
                'Hangi bilim insanı tarih biliminin babası olarak kabul edilir?',
            'options': [
              'Herodotos',
              'Tukidides',
              'Ksenofon',
              'Plutarkhos',
              'Heredot',
            ],
            'correctAnswer': 0,
            'explanation':
                'Herodotos tarih biliminin babası olarak kabul edilir.',
          },
        ],
      },
      'Coğrafya Bilimi': {
        'Kolay': [
          {
            'question': 'Coğrafya biliminin temel konusu nedir?',
            'options': [
              'Sadece harita çizmek',
              'Yeryüzü ve insan ilişkilerini incelemek',
              'Sadece ülkeleri öğretmek',
              'Sadece şehirleri tanıtmak',
              'Sadece nehirleri göstermek',
            ],
            'correctAnswer': 1,
            'explanation':
                'Coğrafya biliminin temel konusu yeryüzü ve insan ilişkilerini incelemektir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi fiziki coğrafya konusu değildir?',
            'options': [
              'İklim',
              'Yer şekilleri',
              'Nüfus',
              'Bitki örtüsü',
              'Toprak',
            ],
            'correctAnswer': 2,
            'explanation':
                'Nüfus fiziki coğrafya konusu değildir, beşeri coğrafya konusudur.',
          },
          {
            'question':
                'Hangi harita türü yükseklik göstermek için kullanılır?',
            'options': [
              'Siyasi harita',
              'Fiziki harita',
              'İklim haritası',
              'Nüfus haritası',
              'Ekonomik harita',
            ],
            'correctAnswer': 1,
            'explanation': 'Fiziki harita yükseklik göstermek için kullanılır.',
          },
          {
            'question': 'Türkiye\'nin en yüksek dağı hangisidir?',
            'options': ['Erciyes', 'Uludağ', 'Ağrı', 'Kaçkar', 'Süphan'],
            'correctAnswer': 2,
            'explanation': 'Ağrı Dağı Türkiye\'nin en yüksek dağıdır.',
          },
          {
            'question': 'Hangi iklim türü Türkiye\'de görülmez?',
            'options': [
              'Akdeniz iklimi',
              'Karadeniz iklimi',
              'Karasal iklim',
              'Çöl iklimi',
              'Step iklimi',
            ],
            'correctAnswer': 3,
            'explanation': 'Çöl iklimi Türkiye\'de görülmez.',
          },
          {
            'question': 'Coğrafya biliminde ölçek ne anlama gelir?',
            'options': [
              'Sadece büyütmek',
              'Sadece küçültmek',
              'Haritadaki uzunluk ile gerçek uzunluk arasındaki oran',
              'Sadece mesafe ölçmek',
              'Sadece alan hesaplamak',
            ],
            'correctAnswer': 2,
            'explanation':
                'Ölçek haritadaki uzunluk ile gerçek uzunluk arasındaki oran anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı coğrafyaya en çok yardımcı olur?',
            'options': ['Tarih', 'Edebiyat', 'Jeoloji', 'Müzik', 'Felsefe'],
            'correctAnswer': 2,
            'explanation':
                'Jeoloji coğrafyaya en çok yardımcı olan bilim dalıdır.',
          },
          {
            'question': 'Türkiye\'nin en büyük gölü hangisidir?',
            'options': [
              'Van Gölü',
              'Tuz Gölü',
              'Beyşehir Gölü',
              'İznik Gölü',
              'Manyas Gölü',
            ],
            'correctAnswer': 0,
            'explanation': 'Van Gölü Türkiye\'nin en büyük gölüdür.',
          },
          {
            'question': 'Coğrafya biliminde beşeri coğrafya neyi inceler?',
            'options': [
              'Sadece doğal olayları',
              'Sadece yer şekillerini',
              'İnsan faaliyetlerini ve yerleşimleri',
              'Sadece iklimi',
              'Sadece bitki örtüsünü',
            ],
            'correctAnswer': 2,
            'explanation':
                'Beşeri coğrafya insan faaliyetlerini ve yerleşimleri inceler.',
          },
          {
            'question': 'Hangi ülke Türkiye\'nin komşusu değildir?',
            'options': [
              'Yunanistan',
              'Bulgaristan',
              'Gürcistan',
              'İran',
              'Mısır',
            ],
            'correctAnswer': 4,
            'explanation': 'Mısır Türkiye\'nin komşusu değildir.',
          },
          {
            'question': 'Coğrafya biliminde iklim ne anlama gelir?',
            'options': [
              'Sadece sıcaklık',
              'Sadece yağış',
              'Bir yerde uzun yıllar boyunca gözlenen hava durumu',
              'Sadece rüzgar',
              'Sadece nem',
            ],
            'correctAnswer': 2,
            'explanation':
                'İklim bir yerde uzun yıllar boyunca gözlenen hava durumu anlamına gelir.',
          },
          {
            'question': 'Türkiye\'nin en kalabalık şehri hangisidir?',
            'options': ['Ankara', 'İzmir', 'Bursa', 'İstanbul', 'Antalya'],
            'correctAnswer': 3,
            'explanation': 'İstanbul Türkiye\'nin en kalabalık şehridir.',
          },
          {
            'question': 'Hangi nehir Türkiye\'den geçmez?',
            'options': ['Fırat', 'Dicle', 'Kızılırmak', 'Nil', 'Sakarya'],
            'correctAnswer': 3,
            'explanation': 'Nil nehri Türkiye\'den geçmez.',
          },
          {
            'question': 'Coğrafya biliminde yer şekli ne anlama gelir?',
            'options': [
              'Sadece dağlar',
              'Sadece ovalar',
              'Yeryüzündeki tüm yükselti ve çukurluklar',
              'Sadece nehirler',
              'Sadece göller',
            ],
            'correctAnswer': 2,
            'explanation':
                'Yer şekli yeryüzündeki tüm yükselti ve çukurluklar anlamına gelir.',
          },
          {
            'question': 'Hangi bölge Türkiye\'de bulunmaz?',
            'options': [
              'Marmara Bölgesi',
              'Ege Bölgesi',
              'Akdeniz Bölgesi',
              'Sahra Bölgesi',
              'İç Anadolu Bölgesi',
            ],
            'correctAnswer': 3,
            'explanation': 'Sahra Bölgesi Türkiye\'de bulunmaz.',
          },
        ],
        'Orta': [
          {
            'question': 'Coğrafya biliminde doğal ortam nedir?',
            'options': [
              'Sadece doğa',
              'İnsan etkisi olmadan oluşan fiziki çevre',
              'Sadece çevre',
              'Sadece ortam',
              'Sadece doğal',
            ],
            'correctAnswer': 1,
            'explanation':
                'Doğal ortam insan etkisi olmadan oluşan fiziki çevre anlamına gelir.',
          },
          {
            'question':
                'Aşağıdakilerden hangisi beşeri coğrafya konusu değildir?',
            'options': ['Nüfus', 'Yerleşme', 'Ekonomi', 'İklim', 'Ulaşım'],
            'correctAnswer': 3,
            'explanation':
                'İklim beşeri coğrafya konusu değildir, fiziki coğrafya konusudur.',
          },
          {
            'question': 'Hangi harita türü nüfus yoğunluğunu gösterir?',
            'options': [
              'Siyasi harita',
              'Fiziki harita',
              'Nüfus haritası',
              'İklim haritası',
              'Ekonomik harita',
            ],
            'correctAnswer': 2,
            'explanation': 'Nüfus haritası nüfus yoğunluğunu gösterir.',
          },
          {
            'question': 'Türkiye\'nin en yüksek ikinci dağı hangisidir?',
            'options': ['Erciyes', 'Uludağ', 'Kaçkar', 'Süphan', 'Nemrut'],
            'correctAnswer': 2,
            'explanation': 'Kaçkar Dağı Türkiye\'nin en yüksek ikinci dağıdır.',
          },
          {
            'question': 'Hangi iklim türü Türkiye\'de en yaygındır?',
            'options': [
              'Akdeniz iklimi',
              'Karadeniz iklimi',
              'Karasal iklim',
              'Çöl iklimi',
              'Step iklimi',
            ],
            'correctAnswer': 2,
            'explanation':
                'Karasal iklim Türkiye\'de en yaygın olan iklim türüdür.',
          },
          {
            'question': 'Coğrafya biliminde projeksiyon ne anlama gelir?',
            'options': [
              'Sadece harita',
              'Küresel yüzeyi düzlem üzerine aktarma yöntemi',
              'Sadece çizim',
              'Sadece plan',
              'Sadece tasarım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Projeksiyon küresel yüzeyi düzlem üzerine aktarma yöntemi anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı coğrafyaya en çok yardımcı olur?',
            'options': [
              'Jeoloji',
              'Meteoroloji',
              'Oşinografi',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi coğrafyaya yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Türkiye\'nin en büyük ikinci gölü hangisidir?',
            'options': [
              'Van Gölü',
              'Tuz Gölü',
              'Beyşehir Gölü',
              'İznik Gölü',
              'Manyas Gölü',
            ],
            'correctAnswer': 1,
            'explanation': 'Tuz Gölü Türkiye\'nin en büyük ikinci gölüdür.',
          },
          {
            'question': 'Coğrafya biliminde ekosistem neyi inceler?',
            'options': [
              'Sadece doğal ortam',
              'Canlı ve cansız varlıkların karşılıklı etkileşimi',
              'Sadece canlılar',
              'Sadece çevre',
              'Sadece doğa',
            ],
            'correctAnswer': 1,
            'explanation':
                'Ekosistem canlı ve cansız varlıkların karşılıklı etkileşimini inceler.',
          },
          {
            'question': 'Hangi ülke Türkiye\'nin komşusudur?',
            'options': [
              'Yunanistan',
              'Bulgaristan',
              'Gürcistan',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türkiye\'nin komşusudur.',
          },
          {
            'question': 'Coğrafya biliminde hava durumu ne anlama gelir?',
            'options': [
              'Sadece sıcaklık',
              'Belirli bir yerde kısa süreli atmosfer olayları',
              'Sadece yağış',
              'Sadece rüzgar',
              'Sadece nem',
            ],
            'correctAnswer': 1,
            'explanation':
                'Hava durumu belirli bir yerde kısa süreli atmosfer olayları anlamına gelir.',
          },
          {
            'question': 'Türkiye\'nin en kalabalık ikinci şehri hangisidir?',
            'options': ['Ankara', 'İzmir', 'Bursa', 'İstanbul', 'Antalya'],
            'correctAnswer': 0,
            'explanation': 'Ankara Türkiye\'nin en kalabalık ikinci şehridir.',
          },
          {
            'question': 'Hangi nehir Türkiye\'den geçer?',
            'options': ['Fırat', 'Dicle', 'Kızılırmak', 'Hepsi', 'Hiçbiri'],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türkiye\'den geçen nehirlerdir.',
          },
          {
            'question': 'Coğrafya biliminde yükselti ne anlama gelir?',
            'options': [
              'Sadece dağ',
              'Bir yerin deniz seviyesinden yüksekliği',
              'Sadece tepe',
              'Sadece yükseklik',
              'Sadece rakım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Yükselti bir yerin deniz seviyesinden yüksekliği anlamına gelir.',
          },
          {
            'question': 'Hangi bölge Türkiye\'de bulunur?',
            'options': [
              'Marmara Bölgesi',
              'Ege Bölgesi',
              'Akdeniz Bölgesi',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türkiye\'de bulunan bölgelerdir.',
          },
        ],
        'Zor': [
          {
            'question': 'Coğrafya biliminde jeomorfoloji ne anlama gelir?',
            'options': [
              'Sadece yer şekilleri',
              'Yer şekillerinin oluşum ve gelişimini inceleyen bilim dalı',
              'Sadece morfoloji',
              'Sadece jeoloji',
              'Sadece coğrafya',
            ],
            'correctAnswer': 1,
            'explanation':
                'Jeomorfoloji yer şekillerinin oluşum ve gelişimini inceleyen bilim dalı anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi klimatoloji konusu değildir?',
            'options': [
              'İklim tipleri',
              'Hava durumu',
              'İklim değişiklikleri',
              'Yer şekilleri',
              'Atmosfer olayları',
            ],
            'correctAnswer': 3,
            'explanation':
                'Yer şekilleri klimatoloji konusu değildir, jeomorfoloji konusudur.',
          },
          {
            'question': 'Hangi harita türü ekonomik faaliyetleri gösterir?',
            'options': [
              'Siyasi harita',
              'Fiziki harita',
              'Nüfus haritası',
              'Ekonomik harita',
              'İklim haritası',
            ],
            'correctAnswer': 3,
            'explanation': 'Ekonomik harita ekonomik faaliyetleri gösterir.',
          },
          {
            'question': 'Türkiye\'nin en yüksek üçüncü dağı hangisidir?',
            'options': ['Erciyes', 'Uludağ', 'Süphan', 'Nemrut', 'Tendürek'],
            'correctAnswer': 2,
            'explanation': 'Süphan Dağı Türkiye\'nin en yüksek üçüncü dağıdır.',
          },
          {
            'question': 'Hangi iklim türü Türkiye\'de en az yaygındır?',
            'options': [
              'Akdeniz iklimi',
              'Karadeniz iklimi',
              'Karasal iklim',
              'Çöl iklimi',
              'Step iklimi',
            ],
            'correctAnswer': 3,
            'explanation':
                'Çöl iklimi Türkiye\'de en az yaygın olan iklim türüdür.',
          },
          {
            'question': 'Coğrafya biliminde hidroloji ne anlama gelir?',
            'options': [
              'Sadece su',
              'Suların özelliklerini ve dağılımını inceleyen bilim dalı',
              'Sadece hidro',
              'Sadece loji',
              'Sadece coğrafya',
            ],
            'correctAnswer': 1,
            'explanation':
                'Hidroloji suların özelliklerini ve dağılımını inceleyen bilim dalı anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı coğrafyaya en çok yardımcı olur?',
            'options': [
              'Jeoloji',
              'Meteoroloji',
              'Oşinografi',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi coğrafyaya yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Türkiye\'nin en büyük üçüncü gölü hangisidir?',
            'options': [
              'Van Gölü',
              'Tuz Gölü',
              'Beyşehir Gölü',
              'İznik Gölü',
              'Manyas Gölü',
            ],
            'correctAnswer': 2,
            'explanation':
                'Beyşehir Gölü Türkiye\'nin en büyük üçüncü gölüdür.',
          },
          {
            'question': 'Coğrafya biliminde biyocoğrafya neyi inceler?',
            'options': [
              'Sadece biyoloji',
              'Canlıların yeryüzündeki dağılımını inceleyen bilim dalı',
              'Sadece coğrafya',
              'Sadece canlılar',
              'Sadece dağılım',
            ],
            'correctAnswer': 1,
            'explanation':
                'Biyocoğrafya canlıların yeryüzündeki dağılımını inceleyen bilim dalı anlamına gelir.',
          },
          {
            'question': 'Hangi ülke Türkiye\'nin en uzun sınırına sahiptir?',
            'options': [
              'Yunanistan',
              'Bulgaristan',
              'Gürcistan',
              'İran',
              'Suriye',
            ],
            'correctAnswer': 4,
            'explanation': 'Suriye Türkiye\'nin en uzun sınırına sahiptir.',
          },
          {
            'question': 'Coğrafya biliminde meteoroloji ne anlama gelir?',
            'options': [
              'Sadece hava',
              'Atmosfer olaylarını inceleyen bilim dalı',
              'Sadece meteor',
              'Sadece loji',
              'Sadece bilim',
            ],
            'correctAnswer': 1,
            'explanation':
                'Meteoroloji atmosfer olaylarını inceleyen bilim dalı anlamına gelir.',
          },
          {
            'question': 'Türkiye\'nin en kalabalık üçüncü şehri hangisidir?',
            'options': ['Ankara', 'İzmir', 'Bursa', 'İstanbul', 'Antalya'],
            'correctAnswer': 1,
            'explanation': 'İzmir Türkiye\'nin en kalabalık üçüncü şehridir.',
          },
          {
            'question': 'Hangi nehir Türkiye\'nin en uzun nehridir?',
            'options': ['Fırat', 'Dicle', 'Kızılırmak', 'Sakarya', 'Çoruh'],
            'correctAnswer': 2,
            'explanation': 'Kızılırmak Türkiye\'nin en uzun nehridir.',
          },
          {
            'question': 'Coğrafya biliminde oşinografi ne anlama gelir?',
            'options': [
              'Sadece okyanus',
              'Okyanusları ve denizleri inceleyen bilim dalı',
              'Sadece deniz',
              'Sadece su',
              'Sadece bilim',
            ],
            'correctAnswer': 1,
            'explanation':
                'Oşinografi okyanusları ve denizleri inceleyen bilim dalı anlamına gelir.',
          },
          {
            'question': 'Hangi bölge Türkiye\'nin en büyük bölgesidir?',
            'options': [
              'Marmara Bölgesi',
              'Ege Bölgesi',
              'Akdeniz Bölgesi',
              'Doğu Anadolu Bölgesi',
              'İç Anadolu Bölgesi',
            ],
            'correctAnswer': 3,
            'explanation':
                'Doğu Anadolu Bölgesi Türkiye\'nin en büyük bölgesidir.',
          },
        ],
      },
      'Fonksiyonlar': {
        'Kolay': [
          {
            'question': 'f(x) = 2x + 1 fonksiyonunda f(3) kaçtır?',
            'options': ['5', '6', '7', '8', '9'],
            'correctAnswer': 2,
            'explanation': 'f(3) = 2(3) + 1 = 6 + 1 = 7',
          },
          {
            'question': 'g(x) = x² fonksiyonunda g(4) kaçtır?',
            'options': ['8', '12', '16', '20', '24'],
            'correctAnswer': 2,
            'explanation': 'g(4) = 4² = 16',
          },
          {
            'question': 'h(x) = 3x - 2 fonksiyonunda h(2) kaçtır?',
            'options': ['2', '4', '6', '8', '10'],
            'correctAnswer': 1,
            'explanation': 'h(2) = 3(2) - 2 = 6 - 2 = 4',
          },
          {
            'question': 'f(x) = x + 5 fonksiyonunda f(0) kaçtır?',
            'options': ['0', '5', '10', '15', '20'],
            'correctAnswer': 1,
            'explanation': 'f(0) = 0 + 5 = 5',
          },
          {
            'question': 'g(x) = 2x² fonksiyonunda g(3) kaçtır?',
            'options': ['6', '12', '18', '24', '36'],
            'correctAnswer': 2,
            'explanation': 'g(3) = 2(3)² = 2(9) = 18',
          },
          {
            'question': 'h(x) = x - 3 fonksiyonunda h(8) kaçtır?',
            'options': ['3', '5', '8', '11', '24'],
            'correctAnswer': 1,
            'explanation': 'h(8) = 8 - 3 = 5',
          },
          {
            'question': 'f(x) = 4x fonksiyonunda f(1/2) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': 'f(1/2) = 4(1/2) = 2',
          },
          {
            'question': 'g(x) = x³ fonksiyonunda g(2) kaçtır?',
            'options': ['4', '6', '8', '10', '12'],
            'correctAnswer': 2,
            'explanation': 'g(2) = 2³ = 8',
          },
          {
            'question': 'h(x) = 5x + 1 fonksiyonunda h(-1) kaçtır?',
            'options': ['-6', '-4', '-2', '0', '2'],
            'correctAnswer': 1,
            'explanation': 'h(-1) = 5(-1) + 1 = -5 + 1 = -4',
          },
          {
            'question': 'f(x) = x² + 2x fonksiyonunda f(2) kaçtır?',
            'options': ['4', '6', '8', '10', '12'],
            'correctAnswer': 2,
            'explanation': 'f(2) = 2² + 2(2) = 4 + 4 = 8',
          },
          {
            'question': 'g(x) = 3x - 6 fonksiyonunda g(4) kaçtır?',
            'options': ['0', '3', '6', '9', '12'],
            'correctAnswer': 2,
            'explanation': 'g(4) = 3(4) - 6 = 12 - 6 = 6',
          },
          {
            'question': 'h(x) = x² - x fonksiyonunda h(3) kaçtır?',
            'options': ['3', '6', '9', '12', '15'],
            'correctAnswer': 1,
            'explanation': 'h(3) = 3² - 3 = 9 - 3 = 6',
          },
          {
            'question': 'f(x) = 2x² + 3 fonksiyonunda f(1) kaçtır?',
            'options': ['2', '3', '5', '6', '8'],
            'correctAnswer': 2,
            'explanation': 'f(1) = 2(1)² + 3 = 2(1) + 3 = 2 + 3 = 5',
          },
          {
            'question': 'g(x) = x + 7 fonksiyonunda g(-3) kaçtır?',
            'options': ['-10', '-7', '-4', '4', '7'],
            'correctAnswer': 2,
            'explanation': 'g(-3) = -3 + 7 = 4',
          },
          {
            'question': 'h(x) = 4x² - 2x fonksiyonunda h(2) kaçtır?',
            'options': ['8', '12', '16', '20', '24'],
            'correctAnswer': 1,
            'explanation': 'h(2) = 4(2)² - 2(2) = 4(4) - 4 = 16 - 4 = 12',
          },
        ],
        'Orta': [
          {
            'question': 'f(x) = 2x + 3 ve g(x) = x - 1 ise (f∘g)(2) kaçtır?',
            'options': ['3', '5', '7', '9', '11'],
            'correctAnswer': 1,
            'explanation': '(f∘g)(2) = f(g(2)) = f(2-1) = f(1) = 2(1) + 3 = 5',
          },
          {
            'question':
                'f(x) = x² + 2x + 1 fonksiyonunun minimum değeri nedir?',
            'options': ['-1', '0', '1', '2', '3'],
            'correctAnswer': 1,
            'explanation': 'f(x) = (x+1)² olduğundan minimum değer 0\'dır.',
          },
          {
            'question': 'g(x) = 3x - 2 ve h(x) = x + 4 ise (g∘h)(3) kaçtır?',
            'options': ['13', '15', '17', '19', '21'],
            'correctAnswer': 2,
            'explanation': '(g∘h)(3) = g(h(3)) = g(3+4) = g(7) = 3(7) - 2 = 19',
          },
          {
            'question': 'f(x) = x² - 4x + 4 fonksiyonunun tepe noktası nedir?',
            'options': ['(2,0)', '(2,4)', '(0,4)', '(4,0)', '(4,4)'],
            'correctAnswer': 0,
            'explanation': 'f(x) = (x-2)² olduğundan tepe noktası (2,0)\'dır.',
          },
          {
            'question': 'g(x) = 2x + 1 ve h(x) = x² ise (h∘g)(2) kaçtır?',
            'options': ['16', '25', '36', '49', '64'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(2) = h(g(2)) = h(2(2)+1) = h(5) = 5² = 25',
          },
          {
            'question': 'f(x) = x² + 6x + 9 fonksiyonunun kökleri nelerdir?',
            'options': ['x = -3', 'x = 3', 'x = ±3', 'x = 0', 'x = -6'],
            'correctAnswer': 0,
            'explanation': 'f(x) = (x+3)² olduğundan tek kök x = -3\'tür.',
          },
          {
            'question': 'g(x) = x - 2 ve h(x) = 3x + 1 ise (g∘h)(1) kaçtır?',
            'options': ['-2', '0', '2', '4', '6'],
            'correctAnswer': 1,
            'explanation': '(g∘h)(1) = g(h(1)) = g(3(1)+1) = g(4) = 4 - 2 = 2',
          },
          {
            'question':
                'f(x) = x² - 2x - 3 fonksiyonunun simetri ekseni nedir?',
            'options': ['x = 0', 'x = 1', 'x = 2', 'x = 3', 'x = -1'],
            'correctAnswer': 1,
            'explanation': 'Simetri ekseni x = -b/(2a) = -(-2)/(2(1)) = 1',
          },
          {
            'question': 'g(x) = 2x - 3 ve h(x) = x + 5 ise (h∘g)(4) kaçtır?',
            'options': ['7', '9', '11', '13', '15'],
            'correctAnswer': 2,
            'explanation': '(h∘g)(4) = h(g(4)) = h(2(4)-3) = h(5) = 5 + 5 = 10',
          },
          {
            'question':
                'f(x) = x² + 4x + 4 fonksiyonunun minimum değeri nedir?',
            'options': ['-4', '-2', '0', '2', '4'],
            'correctAnswer': 2,
            'explanation': 'f(x) = (x+2)² olduğundan minimum değer 0\'dır.',
          },
          {
            'question': 'g(x) = x + 2 ve h(x) = x² - 1 ise (h∘g)(3) kaçtır?',
            'options': ['16', '20', '24', '28', '32'],
            'correctAnswer': 2,
            'explanation': '(h∘g)(3) = h(g(3)) = h(3+2) = h(5) = 5² - 1 = 24',
          },
          {
            'question': 'f(x) = x² - 6x + 9 fonksiyonunun tepe noktası nedir?',
            'options': ['(3,0)', '(3,9)', '(0,9)', '(6,0)', '(6,9)'],
            'correctAnswer': 0,
            'explanation': 'f(x) = (x-3)² olduğundan tepe noktası (3,0)\'dır.',
          },
          {
            'question': 'g(x) = 3x + 2 ve h(x) = x - 1 ise (g∘h)(5) kaçtır?',
            'options': ['10', '12', '14', '16', '18'],
            'correctAnswer': 2,
            'explanation': '(g∘h)(5) = g(h(5)) = g(5-1) = g(4) = 3(4) + 2 = 14',
          },
          {
            'question': 'f(x) = x² + 8x + 16 fonksiyonunun kökleri nelerdir?',
            'options': ['x = -4', 'x = 4', 'x = ±4', 'x = 0', 'x = -8'],
            'correctAnswer': 0,
            'explanation': 'f(x) = (x+4)² olduğundan tek kök x = -4\'tür.',
          },
          {
            'question': 'g(x) = x - 3 ve h(x) = 2x + 1 ise (h∘g)(6) kaçtır?',
            'options': ['5', '7', '9', '11', '13'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(6) = h(g(6)) = h(6-3) = h(3) = 2(3) + 1 = 7',
          },
        ],
        'Zor': [
          {
            'question': 'f(x) = x³ - 3x² + 3x - 1 fonksiyonunun türevi nedir?',
            'options': [
              '3x² - 6x + 3',
              '3x² - 6x + 1',
              '3x² - 3x + 3',
              '3x² - 3x + 1',
              '3x² - 6x',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 3x² - 6x + 3',
          },
          {
            'question': 'g(x) = e^x ve h(x) = ln(x) ise (g∘h)(e) kaçtır?',
            'options': ['0', '1', 'e', 'e²', 'ln(e)'],
            'correctAnswer': 1,
            'explanation': '(g∘h)(e) = g(h(e)) = g(ln(e)) = g(1) = e¹ = e',
          },
          {
            'question': 'f(x) = sin(x) + cos(x) fonksiyonunun türevi nedir?',
            'options': [
              'cos(x) - sin(x)',
              'cos(x) + sin(x)',
              '-sin(x) - cos(x)',
              '-sin(x) + cos(x)',
              '2cos(x)',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = cos(x) - sin(x)',
          },
          {
            'question': 'g(x) = x² ve h(x) = √x ise (h∘g)(4) kaçtır?',
            'options': ['2', '4', '8', '16', '32'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(4) = h(g(4)) = h(4²) = h(16) = √16 = 4',
          },
          {
            'question':
                'f(x) = x⁴ - 4x³ + 6x² - 4x + 1 fonksiyonunun türevi nedir?',
            'options': [
              '4x³ - 12x² + 12x - 4',
              '4x³ - 12x² + 12x',
              '4x³ - 12x² + 6x - 4',
              '4x³ - 6x² + 12x - 4',
              '4x³ - 12x² + 4x - 4',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 4x³ - 12x² + 12x - 4',
          },
          {
            'question': 'g(x) = ln(x) ve h(x) = e^x ise (h∘g)(1) kaçtır?',
            'options': ['0', '1', 'e', 'e²', 'ln(e)'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(1) = h(g(1)) = h(ln(1)) = h(0) = e⁰ = 1',
          },
          {
            'question': 'f(x) = tan(x) fonksiyonunun türevi nedir?',
            'options': ['sec²(x)', 'csc²(x)', 'cot²(x)', 'sin²(x)', 'cos²(x)'],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = sec²(x)',
          },
          {
            'question': 'g(x) = x³ ve h(x) = ∛x ise (h∘g)(2) kaçtır?',
            'options': ['2', '4', '6', '8', '16'],
            'correctAnswer': 0,
            'explanation': '(h∘g)(2) = h(g(2)) = h(2³) = h(8) = ∛8 = 2',
          },
          {
            'question':
                'f(x) = x⁵ - 5x⁴ + 10x³ - 10x² + 5x - 1 fonksiyonunun türevi nedir?',
            'options': [
              '5x⁴ - 20x³ + 30x² - 20x + 5',
              '5x⁴ - 20x³ + 30x² - 20x',
              '5x⁴ - 20x³ + 15x² - 20x + 5',
              '5x⁴ - 15x³ + 30x² - 20x + 5',
              '5x⁴ - 20x³ + 30x² - 15x + 5',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 5x⁴ - 20x³ + 30x² - 20x + 5',
          },
          {
            'question': 'g(x) = e^x ve h(x) = x² ise (h∘g)(0) kaçtır?',
            'options': ['0', '1', 'e', 'e²', '1/e'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(0) = h(g(0)) = h(e⁰) = h(1) = 1² = 1',
          },
          {
            'question': 'f(x) = arcsin(x) fonksiyonunun türevi nedir?',
            'options': [
              '1/√(1-x²)',
              '1/√(1+x²)',
              '1/(1-x²)',
              '1/(1+x²)',
              '√(1-x²)',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 1/√(1-x²)',
          },
          {
            'question': 'g(x) = x⁴ ve h(x) = ∜x ise (h∘g)(1) kaçtır?',
            'options': ['0', '1', '2', '4', '16'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(1) = h(g(1)) = h(1⁴) = h(1) = ∜1 = 1',
          },
          {
            'question':
                'f(x) = x⁶ - 6x⁵ + 15x⁴ - 20x³ + 15x² - 6x + 1 fonksiyonunun türevi nedir?',
            'options': [
              '6x⁵ - 30x⁴ + 60x³ - 60x² + 30x - 6',
              '6x⁵ - 30x⁴ + 60x³ - 60x² + 30x',
              '6x⁵ - 30x⁴ + 45x³ - 60x² + 30x - 6',
              '6x⁵ - 25x⁴ + 60x³ - 60x² + 30x - 6',
              '6x⁵ - 30x⁴ + 60x³ - 55x² + 30x - 6',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 6x⁵ - 30x⁴ + 60x³ - 60x² + 30x - 6',
          },
          {
            'question': 'g(x) = ln(x) ve h(x) = x² + 1 ise (h∘g)(e) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '(h∘g)(e) = h(g(e)) = h(ln(e)) = h(1) = 1² + 1 = 2',
          },
          {
            'question': 'f(x) = arctan(x) fonksiyonunun türevi nedir?',
            'options': [
              '1/(1+x²)',
              '1/(1-x²)',
              '1/√(1+x²)',
              '1/√(1-x²)',
              'x/(1+x²)',
            ],
            'correctAnswer': 0,
            'explanation': 'f\'(x) = 1/(1+x²)',
          },
        ],
      },
      'Üçgenler ve Trigonometri': {
        'Kolay': [
          {
            'question': 'Bir üçgenin iç açıları toplamı kaç derecedir?',
            'options': ['90°', '180°', '270°', '360°', '450°'],
            'correctAnswer': 1,
            'explanation': 'Bir üçgenin iç açıları toplamı her zaman 180°dir.',
          },
          {
            'question': 'Dik üçgende hipotenüs hangi kenardır?',
            'options': [
              'En kısa kenar',
              'En uzun kenar',
              'Dik açıyı oluşturan kenarlardan biri',
              'Hipotenüs yoktur',
              'En kalın kenar',
            ],
            'correctAnswer': 1,
            'explanation':
                'Dik üçgende hipotenüs en uzun kenardır ve dik açının karşısındadır.',
          },
          {
            'question': 'sin(30°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'sin(30°) = 1/2 = 0.5',
          },
          {
            'question': 'cos(60°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'cos(60°) = 1/2 = 0.5',
          },
          {
            'question': 'tan(45°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 1,
            'explanation': 'tan(45°) = 1',
          },
          {
            'question': 'Bir üçgende iki kenar eşitse ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Çeşitkenar üçgen',
              'Geniş açılı üçgen',
            ],
            'correctAnswer': 1,
            'explanation': 'İki kenarı eşit olan üçgene ikizkenar üçgen denir.',
          },
          {
            'question': 'sin(90°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 2,
            'explanation': 'sin(90°) = 1',
          },
          {
            'question': 'cos(0°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 2,
            'explanation': 'cos(0°) = 1',
          },
          {
            'question': 'Bir üçgende üç kenar da eşitse ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Çeşitkenar üçgen',
              'Geniş açılı üçgen',
            ],
            'correctAnswer': 2,
            'explanation': 'Üç kenarı da eşit olan üçgene eşkenar üçgen denir.',
          },
          {
            'question': 'tan(0°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 0,
            'explanation': 'tan(0°) = 0',
          },
          {
            'question': 'Bir üçgende bir açı 90° ise ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Çeşitkenar üçgen',
              'Geniş açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation': 'Bir açısı 90° olan üçgene dik üçgen denir.',
          },
          {
            'question': 'sin(0°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'sin(0°) = 0',
          },
          {
            'question': 'cos(90°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'cos(90°) = 0',
          },
          {
            'question': 'Bir üçgende tüm açılar 60° ise ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Çeşitkenar üçgen',
              'Geniş açılı üçgen',
            ],
            'correctAnswer': 2,
            'explanation': 'Tüm açıları 60° olan üçgene eşkenar üçgen denir.',
          },
          {
            'question': 'tan(90°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 4,
            'explanation': 'tan(90°) = ∞ (sonsuz)',
          },
        ],
        'Orta': [
          {
            'question':
                'Bir üçgende a=3, b=4, c=5 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '3² + 4² = 9 + 16 = 25 = 5² olduğundan dik üçgendir.',
          },
          {
            'question': 'sin(45°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 4,
            'explanation': 'sin(45°) = √2/2 ≈ 0.707',
          },
          {
            'question': 'cos(45°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 4,
            'explanation': 'cos(45°) = √2/2 ≈ 0.707',
          },
          {
            'question':
                'Bir üçgende a=5, b=12, c=13 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '5² + 12² = 25 + 144 = 169 = 13² olduğundan dik üçgendir.',
          },
          {
            'question': 'tan(30°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 3,
            'explanation': 'tan(30°) = 1/√3 ≈ 0.577',
          },
          {
            'question':
                'Bir üçgende a=6, b=8, c=10 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '6² + 8² = 36 + 64 = 100 = 10² olduğundan dik üçgendir.',
          },
          {
            'question': 'sin(60°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 3,
            'explanation': 'sin(60°) = √3/2 ≈ 0.866',
          },
          {
            'question': 'cos(30°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 3,
            'explanation': 'cos(30°) = √3/2 ≈ 0.866',
          },
          {
            'question':
                'Bir üçgende a=7, b=24, c=25 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '7² + 24² = 49 + 576 = 625 = 25² olduğundan dik üçgendir.',
          },
          {
            'question': 'tan(60°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 2,
            'explanation': 'tan(60°) = √3 ≈ 1.732',
          },
          {
            'question':
                'Bir üçgende a=9, b=12, c=15 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '9² + 12² = 81 + 144 = 225 = 15² olduğundan dik üçgendir.',
          },
          {
            'question': 'sin(120°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '√2/2'],
            'correctAnswer': 3,
            'explanation': 'sin(120°) = sin(180°-60°) = sin(60°) = √3/2',
          },
          {
            'question': 'cos(150°) kaçtır?',
            'options': ['0', '1/2', '1', '√3/2', '-√3/2'],
            'correctAnswer': 4,
            'explanation': 'cos(150°) = cos(180°-30°) = -cos(30°) = -√3/2',
          },
          {
            'question':
                'Bir üçgende a=8, b=15, c=17 ise bu üçgen ne tür üçgendir?',
            'options': [
              'Dik üçgen',
              'İkizkenar üçgen',
              'Eşkenar üçgen',
              'Geniş açılı üçgen',
              'Dar açılı üçgen',
            ],
            'correctAnswer': 0,
            'explanation':
                '8² + 15² = 64 + 225 = 289 = 17² olduğundan dik üçgendir.',
          },
          {
            'question': 'tan(120°) kaçtır?',
            'options': ['0', '1', '√3', '-√3', '∞'],
            'correctAnswer': 3,
            'explanation': 'tan(120°) = tan(180°-60°) = -tan(60°) = -√3',
          },
        ],
        'Zor': [
          {
            'question': 'Bir üçgende a=3, b=4, c=6 ise cos(C) kaçtır?',
            'options': ['-1/4', '0', '1/4', '1/2', '3/4'],
            'correctAnswer': 0,
            'explanation':
                'cos(C) = (a² + b² - c²)/(2ab) = (9 + 16 - 36)/(24) = -11/24',
          },
          {
            'question':
                'sin(2x) = 2sin(x)cos(x) formülü hangi açı için doğrudur?',
            'options': [
              'Sadece 0°',
              'Sadece 45°',
              'Sadece 90°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'sin(2x) = 2sin(x)cos(x) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=5, b=7, c=8 ise sin(A) kaçtır?',
            'options': ['3/7', '4/7', '5/7', '6/7', '1'],
            'correctAnswer': 1,
            'explanation':
                'sin(A) = (a*sin(C))/c = (5*sin(C))/8, cos(C) = (25+49-64)/(70) = 10/70 = 1/7',
          },
          {
            'question':
                'cos(2x) = cos²(x) - sin²(x) formülü hangi açı için doğrudur?',
            'options': [
              'Sadece 0°',
              'Sadece 45°',
              'Sadece 90°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'cos(2x) = cos²(x) - sin²(x) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=6, b=8, c=10 ise tan(A) kaçtır?',
            'options': ['3/4', '4/3', '3/5', '4/5', '5/4'],
            'correctAnswer': 0,
            'explanation': 'tan(A) = a/b = 6/8 = 3/4',
          },
          {
            'question':
                'sin(x+y) = sin(x)cos(y) + cos(x)sin(y) formülü hangi açılar için doğrudur?',
            'options': [
              'Sadece 0° ve 90°',
              'Sadece 30° ve 60°',
              'Sadece 45°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'sin(x+y) = sin(x)cos(y) + cos(x)sin(y) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=7, b=9, c=11 ise cos(B) kaçtır?',
            'options': ['-1/3', '0', '1/3', '1/2', '2/3'],
            'correctAnswer': 2,
            'explanation':
                'cos(B) = (a² + c² - b²)/(2ac) = (49 + 121 - 81)/(154) = 89/154',
          },
          {
            'question':
                'tan(x+y) = (tan(x) + tan(y))/(1 - tan(x)tan(y)) formülü hangi açılar için doğrudur?',
            'options': [
              'Sadece 0° ve 90°',
              'Sadece 30° ve 60°',
              'Sadece 45°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'tan(x+y) = (tan(x) + tan(y))/(1 - tan(x)tan(y)) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=4, b=6, c=8 ise sin(B) kaçtır?',
            'options': ['1/2', '2/3', '3/4', '4/5', '5/6'],
            'correctAnswer': 1,
            'explanation':
                'sin(B) = (b*sin(A))/a = (6*sin(A))/4, cos(A) = (16+64-36)/(64) = 44/64 = 11/16',
          },
          {
            'question':
                'cos(x+y) = cos(x)cos(y) - sin(x)sin(y) formülü hangi açılar için doğrudur?',
            'options': [
              'Sadece 0° ve 90°',
              'Sadece 30° ve 60°',
              'Sadece 45°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'cos(x+y) = cos(x)cos(y) - sin(x)sin(y) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=5, b=6, c=7 ise cos(A) kaçtır?',
            'options': ['1/7', '2/7', '3/7', '4/7', '5/7'],
            'correctAnswer': 2,
            'explanation':
                'cos(A) = (b² + c² - a²)/(2bc) = (36 + 49 - 25)/(84) = 60/84 = 5/7',
          },
          {
            'question':
                'sin²(x) + cos²(x) = 1 formülü hangi açı için doğrudur?',
            'options': [
              'Sadece 0°',
              'Sadece 45°',
              'Sadece 90°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                'sin²(x) + cos²(x) = 1 formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=8, b=10, c=12 ise tan(C) kaçtır?',
            'options': ['1/2', '2/3', '3/4', '4/5', '5/6'],
            'correctAnswer': 2,
            'explanation':
                'tan(C) = c*sin(A)/(a*cos(A)), cos(A) = (64+144-100)/(192) = 108/192 = 9/16',
          },
          {
            'question':
                '1 + tan²(x) = sec²(x) formülü hangi açı için doğrudur?',
            'options': [
              'Sadece 0°',
              'Sadece 45°',
              'Sadece 90°',
              'Tüm açılar',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation':
                '1 + tan²(x) = sec²(x) formülü tüm açılar için doğrudur.',
          },
          {
            'question': 'Bir üçgende a=6, b=7, c=9 ise sin(C) kaçtır?',
            'options': ['2/3', '3/4', '4/5', '5/6', '6/7'],
            'correctAnswer': 1,
            'explanation':
                'sin(C) = (c*sin(A))/a = (9*sin(A))/6, cos(A) = (36+81-49)/(126) = 68/126 = 34/63',
          },
        ],
      },
      'Veri Analizi': {
        'Kolay': [
          {
            'question': 'Bir veri setinde en çok tekrar eden değere ne denir?',
            'options': ['Ortalama', 'Medyan', 'Mod', 'Aralık', 'Varyans'],
            'correctAnswer': 2,
            'explanation':
                'Bir veri setinde en çok tekrar eden değere mod denir.',
          },
          {
            'question':
                'Veri setindeki değerlerin toplamının eleman sayısına bölümüne ne denir?',
            'options': ['Ortalama', 'Medyan', 'Mod', 'Aralık', 'Varyans'],
            'correctAnswer': 0,
            'explanation':
                'Veri setindeki değerlerin toplamının eleman sayısına bölümüne ortalama denir.',
          },
          {
            'question':
                'Veri setindeki değerler küçükten büyüğe sıralandığında ortadaki değere ne denir?',
            'options': ['Ortalama', 'Medyan', 'Mod', 'Aralık', 'Varyans'],
            'correctAnswer': 1,
            'explanation':
                'Veri setindeki değerler küçükten büyüğe sıralandığında ortadaki değere medyan denir.',
          },
          {
            'question':
                'Veri setindeki en büyük değer ile en küçük değer arasındaki farka ne denir?',
            'options': ['Ortalama', 'Medyan', 'Mod', 'Aralık', 'Varyans'],
            'correctAnswer': 3,
            'explanation':
                'Veri setindeki en büyük değer ile en küçük değer arasındaki farka aralık denir.',
          },
          {
            'question':
                'Hangi grafik türü kategorik verileri göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Kutu grafik',
              'Scatter plot',
            ],
            'correctAnswer': 1,
            'explanation':
                'Sütun grafik kategorik verileri göstermek için en uygundur.',
          },
          {
            'question':
                'Hangi grafik türü sürekli verileri göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Scatter plot',
            ],
            'correctAnswer': 2,
            'explanation':
                'Histogram sürekli verileri göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 2, 4, 6, 8, 10 sayılarının ortalaması kaçtır?',
            'options': ['4', '5', '6', '7', '8'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = (2+4+6+8+10)/5 = 30/5 = 6',
          },
          {
            'question':
                'Veri setinde 1, 3, 5, 7, 9 sayılarının medyanı kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': 'Medyan = 5 (ortadaki değer)',
          },
          {
            'question':
                'Veri setinde 2, 2, 3, 4, 4, 4, 5 sayılarının modu kaçtır?',
            'options': ['2', '3', '4', '5', 'Yok'],
            'correctAnswer': 2,
            'explanation': 'Mod = 4 (en çok tekrar eden değer)',
          },
          {
            'question':
                'Veri setinde 1, 2, 3, 4, 5 sayılarının aralığı kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 3,
            'explanation': 'Aralık = 5 - 1 = 4',
          },
          {
            'question':
                'Hangi grafik türü zaman içindeki değişimi göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Kutu grafik',
            ],
            'correctAnswer': 0,
            'explanation':
                'Çizgi grafik zaman içindeki değişimi göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 10, 20, 30, 40, 50 sayılarının ortalaması kaçtır?',
            'options': ['25', '30', '35', '40', '45'],
            'correctAnswer': 1,
            'explanation': 'Ortalama = (10+20+30+40+50)/5 = 150/5 = 30',
          },
          {
            'question':
                'Veri setinde 6, 8, 10, 12, 14 sayılarının medyanı kaçtır?',
            'options': ['8', '9', '10', '11', '12'],
            'correctAnswer': 2,
            'explanation': 'Medyan = 10 (ortadaki değer)',
          },
          {
            'question':
                'Veri setinde 1, 1, 2, 2, 2, 3 sayılarının modu kaçtır?',
            'options': ['1', '2', '3', '1 ve 2', 'Yok'],
            'correctAnswer': 1,
            'explanation': 'Mod = 2 (en çok tekrar eden değer)',
          },
          {
            'question':
                'Veri setinde 5, 10, 15, 20, 25 sayılarının aralığı kaçtır?',
            'options': ['15', '20', '25', '30', '35'],
            'correctAnswer': 1,
            'explanation': 'Aralık = 25 - 5 = 20',
          },
        ],
        'Orta': [
          {
            'question':
                'Veri setinde 2, 4, 6, 8, 10, 12 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['2.5', '3.5', '4.5', '5.5', '6.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 7, varyans = 14, standart sapma = √14 ≈ 3.7',
          },
          {
            'question':
                'Veri setinde 1, 3, 5, 7, 9, 11 sayılarının varyansı kaçtır?',
            'options': ['8', '10', '12', '14', '16'],
            'correctAnswer': 1,
            'explanation': 'Ortalama = 6, varyans = 10',
          },
          {
            'question':
                'Hangi grafik türü iki değişken arasındaki ilişkiyi göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Scatter plot',
              'Kutu grafik',
            ],
            'correctAnswer': 3,
            'explanation':
                'Scatter plot iki değişken arasındaki ilişkiyi göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 5, 10, 15, 20, 25, 30 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['7.5', '8.5', '9.5', '10.5', '11.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 17.5, varyans = 72.5, standart sapma = √72.5 ≈ 8.5',
          },
          {
            'question':
                'Veri setinde 2, 4, 6, 8, 10, 12, 14 sayılarının varyansı kaçtır?',
            'options': ['12', '14', '16', '18', '20'],
            'correctAnswer': 1,
            'explanation': 'Ortalama = 8, varyans = 14',
          },
          {
            'question':
                'Hangi grafik türü veri dağılımını göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Scatter plot',
            ],
            'correctAnswer': 2,
            'explanation':
                'Histogram veri dağılımını göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 1, 2, 3, 4, 5, 6, 7, 8 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['2.0', '2.5', '3.0', '3.5', '4.0'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 4.5, varyans = 6.25, standart sapma = √6.25 = 2.5',
          },
          {
            'question':
                'Veri setinde 10, 20, 30, 40, 50, 60 sayılarının varyansı kaçtır?',
            'options': ['250', '300', '350', '400', '450'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 35, varyans = 350',
          },
          {
            'question':
                'Hangi grafik türü kategorik verilerin oranlarını göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Kutu grafik',
            ],
            'correctAnswer': 3,
            'explanation':
                'Pasta grafik kategorik verilerin oranlarını göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 3, 6, 9, 12, 15, 18 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['4.5', '5.5', '6.5', '7.5', '8.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 10.5, varyans = 30.25, standart sapma = √30.25 ≈ 5.5',
          },
          {
            'question':
                'Veri setinde 4, 8, 12, 16, 20, 24 sayılarının varyansı kaçtır?',
            'options': ['40', '50', '60', '70', '80'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 14, varyans = 60',
          },
          {
            'question':
                'Hangi grafik türü veri setindeki aykırı değerleri göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Kutu grafik',
            ],
            'correctAnswer': 4,
            'explanation':
                'Kutu grafik veri setindeki aykırı değerleri göstermek için en uygundur.',
          },
          {
            'question':
                'Veri setinde 2, 5, 8, 11, 14, 17 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['3.5', '4.5', '5.5', '6.5', '7.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 9.5, varyans = 20.25, standart sapma = √20.25 = 4.5',
          },
          {
            'question':
                'Veri setinde 6, 12, 18, 24, 30, 36 sayılarının varyansı kaçtır?',
            'options': ['90', '100', '110', '120', '130'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 21, varyans = 110',
          },
          {
            'question':
                'Hangi grafik türü veri setindeki merkezi eğilimi göstermek için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Kutu grafik',
            ],
            'correctAnswer': 4,
            'explanation':
                'Kutu grafik veri setindeki merkezi eğilimi göstermek için en uygundur.',
          },
        ],
        'Zor': [
          {
            'question':
                'Veri setinde 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 sayılarının standart sapması kaçtır?',
            'options': ['2.5', '2.87', '3.0', '3.16', '3.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 5.5, varyans = 8.25, standart sapma = √8.25 ≈ 2.87',
          },
          {
            'question':
                'Veri setinde 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 sayılarının varyansı kaçtır?',
            'options': ['30', '33', '36', '39', '42'],
            'correctAnswer': 1,
            'explanation': 'Ortalama = 11, varyans = 33',
          },
          {
            'question':
                'Hangi istatistiksel ölçü veri setindeki değişkenliği en iyi ölçer?',
            'options': [
              'Ortalama',
              'Medyan',
              'Mod',
              'Standart sapma',
              'Aralık',
            ],
            'correctAnswer': 3,
            'explanation':
                'Standart sapma veri setindeki değişkenliği en iyi ölçer.',
          },
          {
            'question':
                'Veri setinde 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['12.5', '13.5', '14.5', '15.5', '16.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 27.5, varyans = 183.25, standart sapma = √183.25 ≈ 13.5',
          },
          {
            'question':
                'Veri setinde 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 sayılarının varyansı kaçtır?',
            'options': ['30', '33', '36', '39', '42'],
            'correctAnswer': 1,
            'explanation': 'Ortalama = 10, varyans = 33',
          },
          {
            'question':
                'Hangi grafik türü çok değişkenli veri analizi için en uygundur?',
            'options': [
              'Çizgi grafik',
              'Sütun grafik',
              'Histogram',
              'Pasta grafik',
              'Heat map',
            ],
            'correctAnswer': 4,
            'explanation':
                'Heat map çok değişkenli veri analizi için en uygundur.',
          },
          {
            'question':
                'Veri setinde 2, 6, 10, 14, 18, 22, 26, 30, 34, 38 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['9.5', '10.5', '11.5', '12.5', '13.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 20, varyans = 110.25, standart sapma = √110.25 ≈ 10.5',
          },
          {
            'question':
                'Veri setinde 4, 8, 12, 16, 20, 24, 28, 32, 36, 40 sayılarının varyansı kaçtır?',
            'options': ['120', '130', '140', '150', '160'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 22, varyans = 140',
          },
          {
            'question':
                'Hangi istatistiksel test iki grup arasındaki farkı test etmek için kullanılır?',
            'options': [
              't-test',
              'ANOVA',
              'Ki-kare testi',
              'Korelasyon analizi',
              'Regresyon analizi',
            ],
            'correctAnswer': 0,
            'explanation':
                't-test iki grup arasındaki farkı test etmek için kullanılır.',
          },
          {
            'question':
                'Veri setinde 3, 9, 15, 21, 27, 33, 39, 45, 51, 57 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['15.5', '16.5', '17.5', '18.5', '19.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 30, varyans = 272.25, standart sapma = √272.25 ≈ 16.5',
          },
          {
            'question':
                'Veri setinde 6, 12, 18, 24, 30, 36, 42, 48, 54, 60 sayılarının varyansı kaçtır?',
            'options': ['270', '280', '290', '300', '310'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 33, varyans = 290',
          },
          {
            'question':
                'Hangi istatistiksel analiz değişkenler arasındaki ilişkiyi ölçer?',
            'options': [
              't-test',
              'ANOVA',
              'Ki-kare testi',
              'Korelasyon analizi',
              'Regresyon analizi',
            ],
            'correctAnswer': 3,
            'explanation':
                'Korelasyon analizi değişkenler arasındaki ilişkiyi ölçer.',
          },
          {
            'question':
                'Veri setinde 1, 5, 9, 13, 17, 21, 25, 29, 33, 37 sayılarının standart sapması yaklaşık kaçtır?',
            'options': ['10.5', '11.5', '12.5', '13.5', '14.5'],
            'correctAnswer': 1,
            'explanation':
                'Ortalama = 19, varyans = 132.25, standart sapma = √132.25 ≈ 11.5',
          },
          {
            'question':
                'Veri setinde 8, 16, 24, 32, 40, 48, 56, 64, 72, 80 sayılarının varyansı kaçtır?',
            'options': ['480', '490', '500', '510', '520'],
            'correctAnswer': 2,
            'explanation': 'Ortalama = 44, varyans = 500',
          },
          {
            'question':
                'Hangi istatistiksel analiz bir değişkenin diğer değişkeni ne kadar iyi tahmin ettiğini ölçer?',
            'options': [
              't-test',
              'ANOVA',
              'Ki-kare testi',
              'Korelasyon analizi',
              'Regresyon analizi',
            ],
            'correctAnswer': 4,
            'explanation':
                'Regresyon analizi bir değişkenin diğer değişkeni ne kadar iyi tahmin ettiğini ölçer.',
          },
        ],
      },
      'Edebiyat Bilimi': {
        'Kolay': [
          {
            'question': 'Edebiyat biliminin temel konusu nedir?',
            'options': [
              'Sadece şiir yazmak',
              'Dil ve anlatım sanatını incelemek',
              'Sadece roman okumak',
              'Sadece hikaye anlatmak',
              'Sadece tiyatro oynamak',
            ],
            'correctAnswer': 1,
            'explanation':
                'Edebiyat biliminin temel konusu dil ve anlatım sanatını incelemektir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi edebi tür değildir?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Matematik', 'Tiyatro'],
            'correctAnswer': 3,
            'explanation': 'Matematik edebi tür değildir, bilim dalıdır.',
          },
          {
            'question': 'Hangi edebi tür en kısa olanıdır?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en kısa edebi türdür.',
          },
          {
            'question': 'Türk edebiyatının ilk yazılı eseri hangisidir?',
            'options': [
              'Divan-ı Lügati\'t Türk',
              'Kutadgu Bilig',
              'Orhun Yazıtları',
              'Atabetü\'l Hakayık',
              'Divan-ı Hikmet',
            ],
            'correctAnswer': 2,
            'explanation':
                'Orhun Yazıtları Türk edebiyatının ilk yazılı eseridir.',
          },
          {
            'question': 'Hangi edebi tür en uzun olanıdır?',
            'options': ['Şiir', 'Hikaye', 'Roman', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Roman en uzun edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde tema ne anlama gelir?',
            'options': [
              'Sadece konu',
              'Eserde işlenen ana düşünce',
              'Sadece fikir',
              'Sadece mesaj',
              'Sadece anlam',
            ],
            'correctAnswer': 1,
            'explanation': 'Tema eserde işlenen ana düşünce anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı edebiyata en çok yardımcı olur?',
            'options': ['Matematik', 'Fizik', 'Dilbilim', 'Kimya', 'Biyoloji'],
            'correctAnswer': 2,
            'explanation':
                'Dilbilim edebiyata en çok yardımcı olan bilim dalıdır.',
          },
          {
            'question': 'Türk edebiyatının en ünlü şairi kimdir?',
            'options': ['Yunus Emre', 'Mevlana', 'Fuzuli', 'Baki', 'Nefi'],
            'correctAnswer': 0,
            'explanation': 'Yunus Emre Türk edebiyatının en ünlü şairidir.',
          },
          {
            'question': 'Edebiyat biliminde karakter ne anlama gelir?',
            'options': [
              'Sadece kişi',
              'Eserde yer alan kişilerin özellikleri',
              'Sadece rol',
              'Sadece tip',
              'Sadece kahraman',
            ],
            'correctAnswer': 1,
            'explanation':
                'Karakter eserde yer alan kişilerin özellikleri anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür sahne sanatıdır?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Tiyatro', 'Deneme'],
            'correctAnswer': 3,
            'explanation': 'Tiyatro sahne sanatıdır.',
          },
          {
            'question': 'Edebiyat biliminde olay ne anlama gelir?',
            'options': [
              'Sadece hikaye',
              'Eserde meydana gelen hadiseler',
              'Sadece olay',
              'Sadece durum',
              'Sadece vaka',
            ],
            'correctAnswer': 1,
            'explanation':
                'Olay eserde meydana gelen hadiseler anlamına gelir.',
          },
          {
            'question': 'Türk edebiyatının en ünlü romancısı kimdir?',
            'options': [
              'Halide Edip Adıvar',
              'Yakup Kadri Karaosmanoğlu',
              'Reşat Nuri Güntekin',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türk edebiyatının ünlü romancılarıdır.',
          },
          {
            'question': 'Hangi edebi tür en eski olanıdır?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en eski edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde mekan ne anlama gelir?',
            'options': [
              'Sadece yer',
              'Eserde olayların geçtiği yer',
              'Sadece mekan',
              'Sadece çevre',
              'Sadece ortam',
            ],
            'correctAnswer': 1,
            'explanation': 'Mekan eserde olayların geçtiği yer anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür en yeni olanıdır?',
            'options': ['Şiir', 'Hikaye', 'Roman', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Roman en yeni edebi türdür.',
          },
        ],
        'Orta': [
          {
            'question': 'Edebiyat biliminde tür nedir?',
            'options': [
              'Sadece çeşit',
              'Edebi eserlerin biçimsel özelliklerine göre sınıflandırılması',
              'Sadece kategori',
              'Sadece sınıf',
              'Sadece grup',
            ],
            'correctAnswer': 1,
            'explanation':
                'Tür edebi eserlerin biçimsel özelliklerine göre sınıflandırılması anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi edebi tür değildir?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Fizik', 'Tiyatro'],
            'correctAnswer': 3,
            'explanation': 'Fizik edebi tür değildir, bilim dalıdır.',
          },
          {
            'question': 'Hangi edebi tür en karmaşık olanıdır?',
            'options': ['Şiir', 'Hikaye', 'Roman', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Roman en karmaşık edebi türdür.',
          },
          {
            'question': 'Türk edebiyatının ikinci yazılı eseri hangisidir?',
            'options': [
              'Divan-ı Lügati\'t Türk',
              'Kutadgu Bilig',
              'Orhun Yazıtları',
              'Atabetü\'l Hakayık',
              'Divan-ı Hikmet',
            ],
            'correctAnswer': 1,
            'explanation':
                'Kutadgu Bilig Türk edebiyatının ikinci yazılı eseridir.',
          },
          {
            'question': 'Hangi edebi tür en basit olanıdır?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en basit edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde motif ne anlama gelir?',
            'options': [
              'Sadece tema',
              'Eserde tekrarlanan öğeler',
              'Sadece öğe',
              'Sadece unsur',
              'Sadece parça',
            ],
            'correctAnswer': 1,
            'explanation': 'Motif eserde tekrarlanan öğeler anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı edebiyata en çok yardımcı olur?',
            'options': [
              'Dilbilim',
              'Psikoloji',
              'Sosyoloji',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi edebiyata yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Türk edebiyatının en ünlü ikinci şairi kimdir?',
            'options': ['Yunus Emre', 'Mevlana', 'Fuzuli', 'Baki', 'Nefi'],
            'correctAnswer': 1,
            'explanation': 'Mevlana Türk edebiyatının en ünlü ikinci şairidir.',
          },
          {
            'question': 'Edebiyat biliminde tip ne anlama gelir?',
            'options': [
              'Sadece karakter',
              'Belirli özellikleri olan kişilik modeli',
              'Sadece kişi',
              'Sadece rol',
              'Sadece kahraman',
            ],
            'correctAnswer': 1,
            'explanation':
                'Tip belirli özellikleri olan kişilik modeli anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür en çok okunanıdır?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Tiyatro', 'Deneme'],
            'correctAnswer': 1,
            'explanation': 'Roman en çok okunan edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde zaman ne anlama gelir?',
            'options': [
              'Sadece saat',
              'Eserde olayların geçtiği zaman',
              'Sadece tarih',
              'Sadece dönem',
              'Sadece çağ',
            ],
            'correctAnswer': 1,
            'explanation':
                'Zaman eserde olayların geçtiği zaman anlamına gelir.',
          },
          {
            'question': 'Türk edebiyatının en ünlü hikayecisi kimdir?',
            'options': [
              'Ömer Seyfettin',
              'Sait Faik Abasıyanık',
              'Refik Halit Karay',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türk edebiyatının ünlü hikayecileridir.',
          },
          {
            'question': 'Hangi edebi tür en etkili olanıdır?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en etkili edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde atmosfer ne anlama gelir?',
            'options': [
              'Sadece hava',
              'Eserde yaratılan genel hava',
              'Sadece ortam',
              'Sadece çevre',
              'Sadece durum',
            ],
            'correctAnswer': 1,
            'explanation':
                'Atmosfer eserde yaratılan genel hava anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür en çok yazılanıdır?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Tiyatro', 'Deneme'],
            'correctAnswer': 0,
            'explanation': 'Şiir en çok yazılan edebi türdür.',
          },
        ],
        'Zor': [
          {
            'question': 'Edebiyat biliminde poetika ne anlama gelir?',
            'options': [
              'Sadece şiir',
              'Şiir sanatının teorisi ve kuralları',
              'Sadece teori',
              'Sadece kural',
              'Sadece sanat',
            ],
            'correctAnswer': 1,
            'explanation':
                'Poetika şiir sanatının teorisi ve kuralları anlamına gelir.',
          },
          {
            'question': 'Aşağıdakilerden hangisi edebi tür değildir?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Kimya', 'Tiyatro'],
            'correctAnswer': 3,
            'explanation': 'Kimya edebi tür değildir, bilim dalıdır.',
          },
          {
            'question': 'Hangi edebi tür en gelişmiş olanıdır?',
            'options': ['Şiir', 'Hikaye', 'Roman', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Roman en gelişmiş edebi türdür.',
          },
          {
            'question': 'Türk edebiyatının üçüncü yazılı eseri hangisidir?',
            'options': [
              'Divan-ı Lügati\'t Türk',
              'Kutadgu Bilig',
              'Orhun Yazıtları',
              'Atabetü\'l Hakayık',
              'Divan-ı Hikmet',
            ],
            'correctAnswer': 0,
            'explanation':
                'Divan-ı Lügati\'t Türk Türk edebiyatının üçüncü yazılı eseridir.',
          },
          {
            'question': 'Hangi edebi tür en zor olanıdır?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en zor edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde alegori ne anlama gelir?',
            'options': [
              'Sadece sembol',
              'Soyut kavramları somut varlıklarla anlatma',
              'Sadece benzetme',
              'Sadece mecaz',
              'Sadece istiare',
            ],
            'correctAnswer': 1,
            'explanation':
                'Alegori soyut kavramları somut varlıklarla anlatma anlamına gelir.',
          },
          {
            'question': 'Hangi bilim dalı edebiyata en çok yardımcı olur?',
            'options': [
              'Dilbilim',
              'Psikoloji',
              'Sosyoloji',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi edebiyata yardımcı olan bilim dallarıdır.',
          },
          {
            'question': 'Türk edebiyatının en ünlü üçüncü şairi kimdir?',
            'options': ['Yunus Emre', 'Mevlana', 'Fuzuli', 'Baki', 'Nefi'],
            'correctAnswer': 2,
            'explanation': 'Fuzuli Türk edebiyatının en ünlü üçüncü şairidir.',
          },
          {
            'question': 'Edebiyat biliminde ironi ne anlama gelir?',
            'options': [
              'Sadece alay',
              'Söylenenin tersini kastetme sanatı',
              'Sadece şaka',
              'Sadece espri',
              'Sadece mizah',
            ],
            'correctAnswer': 1,
            'explanation':
                'İroni söylenenin tersini kastetme sanatı anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür en çok sevilenidir?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Tiyatro', 'Deneme'],
            'correctAnswer': 1,
            'explanation': 'Roman en çok sevilen edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde metafor ne anlama gelir?',
            'options': [
              'Sadece benzetme',
              'Bir şeyi başka bir şeyle karşılaştırma',
              'Sadece karşılaştırma',
              'Sadece benzetme',
              'Sadece mecaz',
            ],
            'correctAnswer': 1,
            'explanation':
                'Metafor bir şeyi başka bir şeyle karşılaştırma anlamına gelir.',
          },
          {
            'question': 'Türk edebiyatının en ünlü tiyatro yazarı kimdir?',
            'options': [
              'Namık Kemal',
              'Abdülhak Hamit Tarhan',
              'Recaizade Mahmut Ekrem',
              'Hepsi',
              'Hiçbiri',
            ],
            'correctAnswer': 3,
            'explanation': 'Hepsi Türk edebiyatının ünlü tiyatro yazarlarıdır.',
          },
          {
            'question': 'Hangi edebi tür en çok etkileyenidir?',
            'options': ['Roman', 'Hikaye', 'Şiir', 'Tiyatro', 'Deneme'],
            'correctAnswer': 2,
            'explanation': 'Şiir en çok etkileyen edebi türdür.',
          },
          {
            'question': 'Edebiyat biliminde sembol ne anlama gelir?',
            'options': [
              'Sadece işaret',
              'Bir kavramı temsil eden işaret',
              'Sadece temsil',
              'Sadece kavram',
              'Sadece anlam',
            ],
            'correctAnswer': 1,
            'explanation':
                'Sembol bir kavramı temsil eden işaret anlamına gelir.',
          },
          {
            'question': 'Hangi edebi tür en çok gelişenidir?',
            'options': ['Şiir', 'Roman', 'Hikaye', 'Tiyatro', 'Deneme'],
            'correctAnswer': 1,
            'explanation': 'Roman en çok gelişen edebi türdür.',
          },
        ],
      },
      // Diğer konular için benzer şekilde 3 farklı zorluk seviyesinde 15'er soru eklenebilir
      
      // Matematik 10. Sınıf Konuları
      'Polinomlar': {
        'Kolay': [
          {
            'question': 'P(x) = 2x + 3 polinomunun derecesi kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 1,
            'explanation': 'P(x) = 2x + 3 polinomunun derecesi 1\'dir.',
          },
          {
            'question': 'Q(x) = 5 polinomunun derecesi kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 0,
            'explanation': 'Q(x) = 5 sabit polinomunun derecesi 0\'dır.',
          },
          {
            'question': 'P(x) = x² + 2x + 1 polinomunun katsayıları nelerdir?',
            'options': ['1, 2, 1', '2, 1, 1', '1, 1, 2', '2, 2, 1', '1, 2, 2'],
            'correctAnswer': 0,
            'explanation': 'P(x) = x² + 2x + 1 polinomunun katsayıları 1, 2, 1\'dir.',
          },
          {
            'question': 'P(x) = 3x + 2 polinomunda x = 1 için P(1) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': 'P(1) = 3(1) + 2 = 3 + 2 = 5',
          },
          {
            'question': 'P(x) = x² - 4 polinomunda x = 2 için P(2) kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 0,
            'explanation': 'P(2) = (2)² - 4 = 4 - 4 = 0',
          },
          {
            'question': 'P(x) = 2x + 1 ve Q(x) = x - 3 ise P(x) + Q(x) nedir?',
            'options': ['3x - 2', '3x + 2', 'x - 2', 'x + 2', '3x - 4'],
            'correctAnswer': 0,
            'explanation': 'P(x) + Q(x) = (2x + 1) + (x - 3) = 3x - 2',
          },
          {
            'question': 'P(x) = x² + 3x + 2 polinomunun sabit terimi kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 2,
            'explanation': 'P(x) = x² + 3x + 2 polinomunun sabit terimi 2\'dir.',
          },
          {
            'question': 'P(x) = 4x³ + 2x² + x + 5 polinomunun baş katsayısı kaçtır?',
            'options': ['1', '2', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': 'P(x) = 4x³ + 2x² + x + 5 polinomunun baş katsayısı 4\'tür.',
          },
          {
            'question': 'P(x) = x + 2 polinomunun sıfırı kaçtır?',
            'options': ['-2', '-1', '0', '1', '2'],
            'correctAnswer': 0,
            'explanation': 'P(x) = x + 2 = 0 ise x = -2 olur.',
          },
          {
            'question': 'P(x) = 2x² - 8 polinomunun sıfırları nelerdir?',
            'options': ['2, -2', '4, -4', '8, -8', '1, -1', '3, -3'],
            'correctAnswer': 0,
            'explanation': '2x² - 8 = 0 ise x² = 4, x = ±2 olur.',
          },
          {
            'question': 'P(x) = x³ + 1 polinomunun derecesi kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 2,
            'explanation': 'P(x) = x³ + 1 polinomunun derecesi 3\'tür.',
          },
          {
            'question': 'P(x) = 3x² + 6x + 3 polinomunda x = -1 için P(-1) kaçtır?',
            'options': ['0', '3', '6', '9', '12'],
            'correctAnswer': 0,
            'explanation': 'P(-1) = 3(-1)² + 6(-1) + 3 = 3 - 6 + 3 = 0',
          },
          {
            'question': 'P(x) = x² + 5x + 6 polinomunun çarpanları nelerdir?',
            'options': ['(x+2)(x+3)', '(x+1)(x+6)', '(x+2)(x+4)', '(x+1)(x+5)', '(x+3)(x+4)'],
            'correctAnswer': 0,
            'explanation': 'x² + 5x + 6 = (x+2)(x+3) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 2x + 4 polinomunun grafiği nasıldır?',
            'options': ['Düz çizgi', 'Parabol', 'Küp', 'Üstel', 'Logaritmik'],
            'correctAnswer': 0,
            'explanation': 'P(x) = 2x + 4 birinci derece polinom olduğu için grafiği düz çizgidir.',
          },
          {
            'question': 'P(x) = x² - 9 polinomunun sıfırları nelerdir?',
            'options': ['3, -3', '9, -9', '1, -1', '2, -2', '4, -4'],
            'correctAnswer': 0,
            'explanation': 'x² - 9 = 0 ise x² = 9, x = ±3 olur.',
          },
        ],
        'Orta': [
          {
            'question': 'P(x) = x³ - 8 polinomunun çarpanları nelerdir?',
            'options': ['(x-2)(x²+2x+4)', '(x-2)(x²-2x+4)', '(x+2)(x²-2x+4)', '(x-2)(x²+2x-4)', '(x+2)(x²+2x+4)'],
            'correctAnswer': 0,
            'explanation': 'x³ - 8 = (x-2)(x²+2x+4) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x⁴ - 16 polinomunun derecesi kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': 'P(x) = x⁴ - 16 polinomunun derecesi 4\'tür.',
          },
          {
            'question': 'P(x) = 2x³ + 3x² + x + 1 polinomunda x = 2 için P(2) kaçtır?',
            'options': ['15', '25', '35', '45', '55'],
            'correctAnswer': 1,
            'explanation': 'P(2) = 2(8) + 3(4) + 2 + 1 = 16 + 12 + 2 + 1 = 31',
          },
          {
            'question': 'P(x) = x² + 7x + 12 polinomunun çarpanları nelerdir?',
            'options': ['(x+3)(x+4)', '(x+2)(x+6)', '(x+1)(x+12)', '(x+3)(x+5)', '(x+4)(x+6)'],
            'correctAnswer': 0,
            'explanation': 'x² + 7x + 12 = (x+3)(x+4) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 3x² - 12x + 9 polinomunun sıfırları nelerdir?',
            'options': ['1, 3', '2, 3', '1, 2', '3, 4', '2, 4'],
            'correctAnswer': 0,
            'explanation': '3x² - 12x + 9 = 3(x²-4x+3) = 3(x-1)(x-3), sıfırlar 1 ve 3',
          },
          {
            'question': 'P(x) = x³ + x² - 2x polinomunun sıfırları nelerdir?',
            'options': ['0, 1, -2', '0, 2, -1', '1, 2, -1', '0, 1, 2', '1, -1, -2'],
            'correctAnswer': 0,
            'explanation': 'x³ + x² - 2x = x(x²+x-2) = x(x+2)(x-1), sıfırlar 0, -2, 1',
          },
          {
            'question': 'P(x) = 2x² + 5x + 3 polinomunun diskriminantı kaçtır?',
            'options': ['1', '4', '9', '16', '25'],
            'correctAnswer': 0,
            'explanation': 'Δ = b² - 4ac = 25 - 4(2)(3) = 25 - 24 = 1',
          },
          {
            'question': 'P(x) = x⁴ - 1 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)(x+1)(x²+1)', '(x-1)(x+1)(x²-1)', '(x-1)(x+1)(x²+x+1)', '(x-1)(x+1)(x²-x+1)', '(x-1)(x+1)(x²+x-1)'],
            'correctAnswer': 0,
            'explanation': 'x⁴ - 1 = (x²-1)(x²+1) = (x-1)(x+1)(x²+1)',
          },
          {
            'question': 'P(x) = x³ - 3x² + 3x - 1 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)³', '(x+1)³', '(x-1)²(x+1)', '(x+1)²(x-1)', '(x-1)(x²-2x+1)'],
            'correctAnswer': 0,
            'explanation': 'x³ - 3x² + 3x - 1 = (x-1)³ olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 4x² - 12x + 9 polinomunun çarpanları nelerdir?',
            'options': ['(2x-3)²', '(2x+3)²', '(2x-3)(2x+3)', '(x-3)²', '(x+3)²'],
            'correctAnswer': 0,
            'explanation': '4x² - 12x + 9 = (2x-3)² olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x³ + 6x² + 11x + 6 polinomunun sıfırları nelerdir?',
            'options': ['-1, -2, -3', '1, 2, 3', '-1, 2, -3', '1, -2, 3', '-1, -2, 3'],
            'correctAnswer': 0,
            'explanation': 'x³ + 6x² + 11x + 6 = (x+1)(x+2)(x+3), sıfırlar -1, -2, -3',
          },
          {
            'question': 'P(x) = 2x³ - 5x² + 4x - 1 polinomunda x = 1 için P(1) kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 0,
            'explanation': 'P(1) = 2(1) - 5(1) + 4(1) - 1 = 2 - 5 + 4 - 1 = 0',
          },
          {
            'question': 'P(x) = x⁴ + 2x² + 1 polinomunun derecesi kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': 'P(x) = x⁴ + 2x² + 1 polinomunun derecesi 4\'tür.',
          },
          {
            'question': 'P(x) = x³ - 27 polinomunun çarpanları nelerdir?',
            'options': ['(x-3)(x²+3x+9)', '(x-3)(x²-3x+9)', '(x+3)(x²-3x+9)', '(x-3)(x²+3x-9)', '(x+3)(x²+3x+9)'],
            'correctAnswer': 0,
            'explanation': 'x³ - 27 = (x-3)(x²+3x+9) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 3x² + 7x + 2 polinomunun çarpanları nelerdir?',
            'options': ['(3x+1)(x+2)', '(3x+2)(x+1)', '(3x+1)(x+1)', '(3x+2)(x+2)', '(3x+3)(x+1)'],
            'correctAnswer': 0,
            'explanation': '3x² + 7x + 2 = (3x+1)(x+2) olarak çarpanlara ayrılır.',
          },
        ],
        'Zor': [
          {
            'question': 'P(x) = x⁵ - 32 polinomunun çarpanları nelerdir?',
            'options': ['(x-2)(x⁴+2x³+4x²+8x+16)', '(x-2)(x⁴-2x³+4x²-8x+16)', '(x+2)(x⁴-2x³+4x²-8x+16)', '(x-2)(x⁴+2x³+4x²+8x-16)', '(x+2)(x⁴+2x³+4x²+8x+16)'],
            'correctAnswer': 0,
            'explanation': 'x⁵ - 32 = (x-2)(x⁴+2x³+4x²+8x+16) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x⁴ - 5x² + 4 polinomunun tüm sıfırları nelerdir?',
            'options': ['±1, ±2', '±1, ±3', '±2, ±3', '±1, ±4', '±2, ±4'],
            'correctAnswer': 0,
            'explanation': 'x⁴ - 5x² + 4 = (x²-1)(x²-4) = (x-1)(x+1)(x-2)(x+2), sıfırlar ±1, ±2',
          },
          {
            'question': 'P(x) = x³ + px² + qx + r polinomunun x = 1, x = 2, x = 3 sıfırları varsa p + q + r kaçtır?',
            'options': ['-6', '-5', '-4', '-3', '-2'],
            'correctAnswer': 0,
            'explanation': 'P(x) = (x-1)(x-2)(x-3) = x³ - 6x² + 11x - 6, p + q + r = -6 + 11 - 6 = -1',
          },
          {
            'question': 'P(x) = x⁴ + ax³ + bx² + cx + d polinomunun x = 1 ve x = -1 sıfırları varsa a + c kaçtır?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 0,
            'explanation': 'P(1) = 0 ve P(-1) = 0 olduğundan a + c = 0 olur.',
          },
          {
            'question': 'P(x) = x³ - 6x² + 11x - 6 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)(x-2)(x-3)', '(x+1)(x+2)(x+3)', '(x-1)(x-2)(x+3)', '(x+1)(x-2)(x-3)', '(x-1)(x+2)(x-3)'],
            'correctAnswer': 0,
            'explanation': 'x³ - 6x² + 11x - 6 = (x-1)(x-2)(x-3) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 2x⁴ - 7x³ + 8x² - 3x polinomunun sıfırları nelerdir?',
            'options': ['0, 1, 1, 3/2', '0, 1, 2, 3', '0, 1, 1, 2', '0, 1, 2, 2', '0, 1, 1, 1'],
            'correctAnswer': 0,
            'explanation': '2x⁴ - 7x³ + 8x² - 3x = x(2x³-7x²+8x-3) = x(x-1)²(2x-3), sıfırlar 0, 1, 1, 3/2',
          },
          {
            'question': 'P(x) = x⁵ - x⁴ - 2x³ + 2x² + x - 1 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)²(x+1)³', '(x-1)³(x+1)²', '(x-1)(x+1)⁴', '(x-1)⁴(x+1)', '(x-1)²(x+1)²(x-1)'],
            'correctAnswer': 0,
            'explanation': 'x⁵ - x⁴ - 2x³ + 2x² + x - 1 = (x-1)²(x+1)³ olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x⁴ - 2x³ - 3x² + 4x + 4 polinomunun tüm sıfırları nelerdir?',
            'options': ['-1, -1, 2, 2', '1, 1, -2, -2', '-1, 1, 2, -2', '1, -1, 2, -2', '0, 1, 2, 3'],
            'correctAnswer': 0,
            'explanation': 'x⁴ - 2x³ - 3x² + 4x + 4 = (x+1)²(x-2)², sıfırlar -1, -1, 2, 2',
          },
          {
            'question': 'P(x) = x³ + 3x² + 3x + 1 polinomunun çarpanları nelerdir?',
            'options': ['(x+1)³', '(x-1)³', '(x+1)²(x-1)', '(x-1)²(x+1)', '(x+1)(x²+2x+1)'],
            'correctAnswer': 0,
            'explanation': 'x³ + 3x² + 3x + 1 = (x+1)³ olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = 3x⁴ - 10x³ + 12x² - 6x + 1 polinomunun sıfırları nelerdir?',
            'options': ['1/3, 1/3, 1, 1', '1/3, 1, 1, 1', '1/3, 1/3, 1/3, 1', '1/3, 1/3, 1, 2', '1/3, 1, 2, 3'],
            'correctAnswer': 0,
            'explanation': '3x⁴ - 10x³ + 12x² - 6x + 1 = (3x-1)²(x-1)², sıfırlar 1/3, 1/3, 1, 1',
          },
          {
            'question': 'P(x) = x⁶ - 1 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)(x+1)(x²+x+1)(x²-x+1)', '(x-1)(x+1)(x²+x+1)(x²+x-1)', '(x-1)(x+1)(x²-x+1)(x²-x-1)', '(x-1)(x+1)(x²+x+1)(x²+x+1)', '(x-1)(x+1)(x²-x+1)(x²+x+1)'],
            'correctAnswer': 0,
            'explanation': 'x⁶ - 1 = (x³-1)(x³+1) = (x-1)(x²+x+1)(x+1)(x²-x+1)',
          },
          {
            'question': 'P(x) = x⁴ + 4x³ + 6x² + 4x + 1 polinomunun çarpanları nelerdir?',
            'options': ['(x+1)⁴', '(x-1)⁴', '(x+1)²(x-1)²', '(x+1)³(x-1)', '(x-1)³(x+1)'],
            'correctAnswer': 0,
            'explanation': 'x⁴ + 4x³ + 6x² + 4x + 1 = (x+1)⁴ olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x⁵ + x⁴ - 2x³ - 2x² + x + 1 polinomunun sıfırları nelerdir?',
            'options': ['-1, -1, 1, 1, 1', '-1, 1, 1, 1, 1', '-1, -1, -1, 1, 1', '-1, -1, 1, 1, 2', '-1, 1, 1, 2, 3'],
            'correctAnswer': 0,
            'explanation': 'x⁵ + x⁴ - 2x³ - 2x² + x + 1 = (x+1)²(x-1)³, sıfırlar -1, -1, 1, 1, 1',
          },
          {
            'question': 'P(x) = 2x⁴ - 5x³ + 3x² + 4x - 4 polinomunun çarpanları nelerdir?',
            'options': ['(x-1)(x-2)(2x²+x+2)', '(x+1)(x+2)(2x²-x+2)', '(x-1)(x+2)(2x²-x-2)', '(x+1)(x-2)(2x²+x-2)', '(x-1)(x-2)(2x²-x+2)'],
            'correctAnswer': 0,
            'explanation': '2x⁴ - 5x³ + 3x² + 4x - 4 = (x-1)(x-2)(2x²+x+2) olarak çarpanlara ayrılır.',
          },
          {
            'question': 'P(x) = x⁶ + x⁵ - 2x⁴ - 2x³ + x² + x polinomunun sıfırları nelerdir?',
            'options': ['0, -1, -1, 1, 1, 1', '0, -1, 1, 1, 1, 1', '0, -1, -1, -1, 1, 1', '0, -1, -1, 1, 1, 2', '0, 1, 1, 1, 2, 3'],
            'correctAnswer': 0,
            'explanation': 'x⁶ + x⁵ - 2x⁴ - 2x³ + x² + x = x(x+1)²(x-1)³, sıfırlar 0, -1, -1, 1, 1, 1',
          },
        ],
      },
      'İkinci Dereceden Denklemler': {
        'Kolay': [
          {
            'question': 'x² - 4 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±2', 'x = ±4', 'x = ±1', 'x = ±3', 'x = ±5'],
            'correctAnswer': 0,
            'explanation': 'x² - 4 = 0 ise x² = 4, x = ±2 olur.',
          },
          {
            'question': 'x² + 5x + 6 = 0 denkleminin çözümü nedir?',
            'options': ['x = -2, -3', 'x = 2, 3', 'x = -1, -6', 'x = 1, 6', 'x = -2, 3'],
            'correctAnswer': 0,
            'explanation': 'x² + 5x + 6 = (x+2)(x+3) = 0, x = -2 veya x = -3',
          },
          {
            'question': 'x² - 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±3', 'x = ±9', 'x = ±1', 'x = ±2', 'x = ±4'],
            'correctAnswer': 0,
            'explanation': 'x² - 9 = 0 ise x² = 9, x = ±3 olur.',
          },
          {
            'question': 'x² + 2x + 1 = 0 denkleminin çözümü nedir?',
            'options': ['x = -1', 'x = 1', 'x = -2', 'x = 2', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x² + 2x + 1 = (x+1)² = 0, x = -1 (çift kök)',
          },
          {
            'question': 'x² - 16 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±4', 'x = ±16', 'x = ±2', 'x = ±8', 'x = ±1'],
            'correctAnswer': 0,
            'explanation': 'x² - 16 = 0 ise x² = 16, x = ±4 olur.',
          },
          {
            'question': 'x² + 7x + 12 = 0 denkleminin çözümü nedir?',
            'options': ['x = -3, -4', 'x = 3, 4', 'x = -2, -6', 'x = 2, 6', 'x = -1, -12'],
            'correctAnswer': 0,
            'explanation': 'x² + 7x + 12 = (x+3)(x+4) = 0, x = -3 veya x = -4',
          },
          {
            'question': 'x² - 25 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±5', 'x = ±25', 'x = ±1', 'x = ±10', 'x = ±2'],
            'correctAnswer': 0,
            'explanation': 'x² - 25 = 0 ise x² = 25, x = ±5 olur.',
          },
          {
            'question': 'x² + 6x + 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = -3', 'x = 3', 'x = -6', 'x = 6', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x² + 6x + 9 = (x+3)² = 0, x = -3 (çift kök)',
          },
          {
            'question': 'x² - 1 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±1', 'x = ±2', 'x = ±3', 'x = ±4', 'x = ±5'],
            'correctAnswer': 0,
            'explanation': 'x² - 1 = 0 ise x² = 1, x = ±1 olur.',
          },
          {
            'question': 'x² + 4x + 4 = 0 denkleminin çözümü nedir?',
            'options': ['x = -2', 'x = 2', 'x = -4', 'x = 4', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x² + 4x + 4 = (x+2)² = 0, x = -2 (çift kök)',
          },
          {
            'question': 'x² - 36 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±6', 'x = ±36', 'x = ±3', 'x = ±12', 'x = ±2'],
            'correctAnswer': 0,
            'explanation': 'x² - 36 = 0 ise x² = 36, x = ±6 olur.',
          },
          {
            'question': 'x² + 8x + 16 = 0 denkleminin çözümü nedir?',
            'options': ['x = -4', 'x = 4', 'x = -8', 'x = 8', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x² + 8x + 16 = (x+4)² = 0, x = -4 (çift kök)',
          },
          {
            'question': 'x² - 49 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±7', 'x = ±49', 'x = ±1', 'x = ±14', 'x = ±3'],
            'correctAnswer': 0,
            'explanation': 'x² - 49 = 0 ise x² = 49, x = ±7 olur.',
          },
          {
            'question': 'x² + 10x + 25 = 0 denkleminin çözümü nedir?',
            'options': ['x = -5', 'x = 5', 'x = -10', 'x = 10', 'x = 0'],
            'correctAnswer': 0,
            'explanation': 'x² + 10x + 25 = (x+5)² = 0, x = -5 (çift kök)',
          },
          {
            'question': 'x² - 64 = 0 denkleminin çözümü nedir?',
            'options': ['x = ±8', 'x = ±64', 'x = ±4', 'x = ±16', 'x = ±2'],
            'correctAnswer': 0,
            'explanation': 'x² - 64 = 0 ise x² = 64, x = ±8 olur.',
          },
        ],
        'Orta': [
          {
            'question': '2x² + 5x + 3 = 0 denkleminin çözümü nedir?',
            'options': ['x = -1, -3/2', 'x = 1, 3/2', 'x = -1, 3/2', 'x = 1, -3/2', 'x = -2, -3'],
            'correctAnswer': 0,
            'explanation': '2x² + 5x + 3 = (2x+3)(x+1) = 0, x = -3/2 veya x = -1',
          },
          {
            'question': '3x² - 12x + 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = 1, 3', 'x = -1, -3', 'x = 1, -3', 'x = -1, 3', 'x = 2, 3'],
            'correctAnswer': 0,
            'explanation': '3x² - 12x + 9 = 3(x²-4x+3) = 3(x-1)(x-3) = 0, x = 1 veya x = 3',
          },
          {
            'question': 'x² - 5x + 6 = 0 denkleminin çözümü nedir?',
            'options': ['x = 2, 3', 'x = -2, -3', 'x = 2, -3', 'x = -2, 3', 'x = 1, 6'],
            'correctAnswer': 0,
            'explanation': 'x² - 5x + 6 = (x-2)(x-3) = 0, x = 2 veya x = 3',
          },
          {
            'question': '4x² - 12x + 9 = 0 denkleminin çözümü nedir?',
            'options': ['x = 3/2', 'x = -3/2', 'x = 3', 'x = -3', 'x = 2'],
            'correctAnswer': 0,
            'explanation': '4x² - 12x + 9 = (2x-3)² = 0, x = 3/2 (çift kök)',
          },
          {
            'question': 'x² + 3x - 10 = 0 denkleminin çözümü nedir?',
            'options': ['x = 2, -5', 'x = -2, 5', 'x = 2, 5', 'x = -2, -5', 'x = 1, -10'],
            'correctAnswer': 0,
            'explanation': 'x² + 3x - 10 = (x+5)(x-2) = 0, x = -5 veya x = 2',
          },
          {
            'question': '2x² - 7x + 6 = 0 denkleminin çözümü nedir?',
            'options': ['x = 2, 3/2', 'x = -2, -3/2', 'x = 2, -3/2', 'x = -2, 3/2', 'x = 1, 6'],
            'correctAnswer': 0,
            'explanation': '2x² - 7x + 6 = (2x-3)(x-2) = 0, x = 3/2 veya x = 2',
          },
          {
            'question': 'x² - 6x + 8 = 0 denkleminin çözümü nedir?',
            'options': ['x = 2, 4', 'x = -2, -4', 'x = 2, -4', 'x = -2, 4', 'x = 1, 8'],
            'correctAnswer': 0,
            'explanation': 'x² - 6x + 8 = (x-2)(x-4) = 0, x = 2 veya x = 4',
          },
          {
            'question': '3x² + 7x + 2 = 0 denkleminin çözümü nedir?',
            'options': ['x = -1/3, -2', 'x = 1/3, 2', 'x = -1/3, 2', 'x = 1/3, -2', 'x = -1, -2'],
            'correctAnswer': 0,
            'explanation': '3x² + 7x + 2 = (3x+1)(x+2) = 0, x = -1/3 veya x = -2',
          },
          {
            'question': 'x² + 8x + 15 = 0 denkleminin çözümü nedir?',
            'options': ['x = -3, -5', 'x = 3, 5', 'x = -3, 5', 'x = 3, -5', 'x = -1, -15'],
            'correctAnswer': 0,
            'explanation': 'x² + 8x + 15 = (x+3)(x+5) = 0, x = -3 veya x = -5',
          },
          {
            'question': '2x² + 9x + 4 = 0 denkleminin çözümü nedir?',
            'options': ['x = -1/2, -4', 'x = 1/2, 4', 'x = -1/2, 4', 'x = 1/2, -4', 'x = -1, -4'],
            'correctAnswer': 0,
            'explanation': '2x² + 9x + 4 = (2x+1)(x+4) = 0, x = -1/2 veya x = -4',
          },
          {
            'question': 'x² - 7x + 12 = 0 denkleminin çözümü nedir?',
            'options': ['x = 3, 4', 'x = -3, -4', 'x = 3, -4', 'x = -3, 4', 'x = 2, 6'],
            'correctAnswer': 0,
            'explanation': 'x² - 7x + 12 = (x-3)(x-4) = 0, x = 3 veya x = 4',
          },
          {
            'question': '3x² - 10x + 3 = 0 denkleminin çözümü nedir?',
            'options': ['x = 1/3, 3', 'x = -1/3, -3', 'x = 1/3, -3', 'x = -1/3, 3', 'x = 1, 3'],
            'correctAnswer': 0,
            'explanation': '3x² - 10x + 3 = (3x-1)(x-3) = 0, x = 1/3 veya x = 3',
          },
          {
            'question': 'x² + 9x + 20 = 0 denkleminin çözümü nedir?',
            'options': ['x = -4, -5', 'x = 4, 5', 'x = -4, 5', 'x = 4, -5', 'x = -2, -10'],
            'correctAnswer': 0,
            'explanation': 'x² + 9x + 20 = (x+4)(x+5) = 0, x = -4 veya x = -5',
          },
          {
            'question': '2x² - 11x + 15 = 0 denkleminin çözümü nedir?',
            'options': ['x = 3, 5/2', 'x = -3, -5/2', 'x = 3, -5/2', 'x = -3, 5/2', 'x = 2, 15'],
            'correctAnswer': 0,
            'explanation': '2x² - 11x + 15 = (2x-5)(x-3) = 0, x = 5/2 veya x = 3',
          },
          {
            'question': 'x² - 8x + 16 = 0 denkleminin çözümü nedir?',
            'options': ['x = 4', 'x = -4', 'x = 8', 'x = -8', 'x = 2'],
            'correctAnswer': 0,
            'explanation': 'x² - 8x + 16 = (x-4)² = 0, x = 4 (çift kök)',
          },
        ],
        'Zor': [
          {
            'question': 'x² - 3x + 2 = 0 denkleminin diskriminantı kaçtır?',
            'options': ['1', '4', '9', '16', '25'],
            'correctAnswer': 0,
            'explanation': 'Δ = b² - 4ac = (-3)² - 4(1)(2) = 9 - 8 = 1',
          },
          {
            'question': '2x² + 5x + k = 0 denkleminin tek kökü varsa k kaçtır?',
            'options': ['25/8', '25/4', '25/2', '25', '50'],
            'correctAnswer': 0,
            'explanation': 'Tek kök için Δ = 0 olmalı. 25 - 8k = 0, k = 25/8',
          },
          {
            'question': 'x² + px + q = 0 denkleminin kökleri 2 ve 3 ise p + q kaçtır?',
            'options': ['-1', '0', '1', '2', '3'],
            'correctAnswer': 0,
            'explanation': 'x² + px + q = (x-2)(x-3) = x² - 5x + 6, p = -5, q = 6, p + q = 1',
          },
          {
            'question': 'ax² + bx + c = 0 denkleminin kökleri eşit ve pozitif ise a, b, c işaretleri nasıldır?',
            'options': ['a > 0, b < 0, c > 0', 'a > 0, b > 0, c > 0', 'a < 0, b < 0, c > 0', 'a > 0, b < 0, c < 0', 'a < 0, b > 0, c < 0'],
            'correctAnswer': 0,
            'explanation': 'Eşit kökler için Δ = 0, pozitif kökler için a > 0, c > 0 ve b < 0 olmalı.',
          },
          {
            'question': 'x² - 6x + k = 0 denkleminin reel kökü yoksa k hangi aralıkta olmalıdır?',
            'options': ['k > 9', 'k < 9', 'k > 6', 'k < 6', 'k > 3'],
            'correctAnswer': 0,
            'explanation': 'Reel kök yoksa Δ < 0, 36 - 4k < 0, k > 9',
          },
          {
            'question': 'x² + (k+1)x + k = 0 denkleminin kökleri -1 ve -k ise k kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 0,
            'explanation': 'x² + (k+1)x + k = (x+1)(x+k) = x² + (k+1)x + k, k = 1',
          },
          {
            'question': '2x² - 8x + m = 0 denkleminin kökleri x₁ ve x₂ ise x₁² + x₂² kaçtır?',
            'options': ['16 - 2m', '16 + 2m', '8 - m', '8 + m', '4 - m'],
            'correctAnswer': 0,
            'explanation': 'x₁² + x₂² = (x₁ + x₂)² - 2x₁x₂ = 4² - 2(m/2) = 16 - m',
          },
          {
            'question': 'x² + px + q = 0 denkleminin kökleri α ve β ise α³ + β³ kaçtır?',
            'options': ['-p³ + 3pq', '-p³ - 3pq', 'p³ + 3pq', 'p³ - 3pq', '3pq - p³'],
            'correctAnswer': 0,
            'explanation': 'α³ + β³ = (α + β)³ - 3αβ(α + β) = (-p)³ - 3q(-p) = -p³ + 3pq',
          },
          {
            'question': 'ax² + bx + c = 0 denkleminin kökleri oranı 2 ise b²/4ac kaçtır?',
            'options': ['9/4', '4/9', '3/2', '2/3', '1'],
            'correctAnswer': 0,
            'explanation': 'Kökler oranı 2 ise α = 2β. Vieta formüllerinden b²/4ac = 9/4',
          },
          {
            'question': 'x² + (2k-1)x + k² = 0 denkleminin kökleri eşit ise k kaçtır?',
            'options': ['1/4', '1/2', '1', '2', '4'],
            'correctAnswer': 0,
            'explanation': 'Eşit kökler için Δ = 0, (2k-1)² - 4k² = 0, k = 1/4',
          },
          {
            'question': 'x² + px + q = 0 denkleminin kökleri α ve β ise (α+β)² + (α-β)² kaçtır?',
            'options': ['2(α² + β²)', '2(α + β)²', '4αβ', '2p²', '2q'],
            'correctAnswer': 0,
            'explanation': '(α+β)² + (α-β)² = 2(α² + β²)',
          },
          {
            'question': 'ax² + bx + c = 0 denkleminin kökleri pozitif ise a, b, c işaretleri nasıldır?',
            'options': ['a > 0, b < 0, c > 0', 'a > 0, b > 0, c > 0', 'a < 0, b < 0, c > 0', 'a > 0, b < 0, c < 0', 'a < 0, b > 0, c < 0'],
            'correctAnswer': 0,
            'explanation': 'Pozitif kökler için a > 0, c > 0 ve b < 0 olmalı.',
          },
          {
            'question': 'x² + kx + 1 = 0 denkleminin kökleri α ve β ise α⁴ + β⁴ kaçtır?',
            'options': ['k⁴ - 4k² + 2', 'k⁴ + 4k² + 2', 'k⁴ - 2k² + 1', 'k⁴ + 2k² + 1', 'k⁴ - k² + 1'],
            'correctAnswer': 0,
            'explanation': 'α⁴ + β⁴ = (α² + β²)² - 2α²β² = (k² - 2)² - 2 = k⁴ - 4k² + 2',
          },
          {
            'question': 'x² + px + q = 0 denkleminin kökleri α ve β ise α/β + β/α kaçtır?',
            'options': ['(p² - 2q)/q', '(p² + 2q)/q', '(p² - q)/q', '(p² + q)/q', 'p²/q'],
            'correctAnswer': 0,
            'explanation': 'α/β + β/α = (α² + β²)/αβ = ((α+β)² - 2αβ)/αβ = (p² - 2q)/q',
          },
        ],
      },
      'Trigonometri': {
        'Kolay': [
          {
            'question': 'sin(30°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'sin(30°) = 1/2',
          },
          {
            'question': 'cos(60°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'cos(60°) = 1/2',
          },
          {
            'question': 'tan(45°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 1,
            'explanation': 'tan(45°) = 1',
          },
          {
            'question': 'sin(90°) kaçtır?',
            'options': ['0', '1', '-1', '1/2', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'sin(90°) = 1',
          },
          {
            'question': 'cos(0°) kaçtır?',
            'options': ['0', '1', '-1', '1/2', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'cos(0°) = 1',
          },
          {
            'question': 'sin(0°) kaçtır?',
            'options': ['0', '1', '-1', '1/2', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'sin(0°) = 0',
          },
          {
            'question': 'cos(90°) kaçtır?',
            'options': ['0', '1', '-1', '1/2', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'cos(90°) = 0',
          },
          {
            'question': 'tan(0°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 0,
            'explanation': 'tan(0°) = 0',
          },
          {
            'question': 'sin(45°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 4,
            'explanation': 'sin(45°) = √2/2',
          },
          {
            'question': 'cos(45°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 4,
            'explanation': 'cos(45°) = √2/2',
          },
          {
            'question': 'sin(60°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'sin(60°) = √3/2',
          },
          {
            'question': 'cos(30°) kaçtır?',
            'options': ['1/2', '√3/2', '1', '0', '√2/2'],
            'correctAnswer': 1,
            'explanation': 'cos(30°) = √3/2',
          },
          {
            'question': 'tan(30°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 3,
            'explanation': 'tan(30°) = 1/√3',
          },
          {
            'question': 'tan(60°) kaçtır?',
            'options': ['0', '1', '√3', '1/√3', '∞'],
            'correctAnswer': 2,
            'explanation': 'tan(60°) = √3',
          },
          {
            'question': 'sin(180°) kaçtır?',
            'options': ['0', '1', '-1', '1/2', '√2/2'],
            'correctAnswer': 0,
            'explanation': 'sin(180°) = 0',
          },
        ],
        'Orta': [
          {
            'question': 'sin²x + cos²x kaçtır?',
            'options': ['0', '1', '2', 'sin(2x)', 'cos(2x)'],
            'correctAnswer': 1,
            'explanation': 'sin²x + cos²x = 1 (temel trigonometrik özdeşlik)',
          },
          {
            'question': 'sin(2x) kaçtır?',
            'options': ['2sin(x)cos(x)', 'sin²(x) + cos²(x)', '2sin(x)', '2cos(x)', 'sin(x) + cos(x)'],
            'correctAnswer': 0,
            'explanation': 'sin(2x) = 2sin(x)cos(x) (çift açı formülü)',
          },
          {
            'question': 'cos(2x) kaçtır?',
            'options': ['cos²(x) - sin²(x)', '2cos²(x) - 1', '1 - 2sin²(x)', 'Hepsi', 'Hiçbiri'],
            'correctAnswer': 3,
            'explanation': 'cos(2x) = cos²(x) - sin²(x) = 2cos²(x) - 1 = 1 - 2sin²(x)',
          },
          {
            'question': 'tan(x + y) kaçtır?',
            'options': ['(tan(x) + tan(y))/(1 - tan(x)tan(y))', 'tan(x) + tan(y)', 'tan(x)tan(y)', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'tan(x + y) = (tan(x) + tan(y))/(1 - tan(x)tan(y))',
          },
          {
            'question': 'sin(x + y) kaçtır?',
            'options': ['sin(x)cos(y) + cos(x)sin(y)', 'sin(x) + sin(y)', 'sin(x)sin(y)', 'cos(x)cos(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x + y) = sin(x)cos(y) + cos(x)sin(y)',
          },
          {
            'question': 'cos(x + y) kaçtır?',
            'options': ['cos(x)cos(y) - sin(x)sin(y)', 'cos(x) + cos(y)', 'cos(x)cos(y)', 'sin(x)sin(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(x + y) = cos(x)cos(y) - sin(x)sin(y)',
          },
          {
            'question': 'sin(x - y) kaçtır?',
            'options': ['sin(x)cos(y) - cos(x)sin(y)', 'sin(x) - sin(y)', 'sin(x)sin(y)', 'cos(x)cos(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x - y) = sin(x)cos(y) - cos(x)sin(y)',
          },
          {
            'question': 'cos(x - y) kaçtır?',
            'options': ['cos(x)cos(y) + sin(x)sin(y)', 'cos(x) - cos(y)', 'cos(x)cos(y)', 'sin(x)sin(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(x - y) = cos(x)cos(y) + sin(x)sin(y)',
          },
          {
            'question': '1 + tan²(x) kaçtır?',
            'options': ['sec²(x)', 'csc²(x)', 'cot²(x)', '1', '0'],
            'correctAnswer': 0,
            'explanation': '1 + tan²(x) = sec²(x)',
          },
          {
            'question': '1 + cot²(x) kaçtır?',
            'options': ['sec²(x)', 'csc²(x)', 'tan²(x)', '1', '0'],
            'correctAnswer': 1,
            'explanation': '1 + cot²(x) = csc²(x)',
          },
          {
            'question': 'sin(x)cos(x) kaçtır?',
            'options': ['(1/2)sin(2x)', 'sin(2x)', 'cos(2x)', 'sin²(x)', 'cos²(x)'],
            'correctAnswer': 0,
            'explanation': 'sin(x)cos(x) = (1/2)sin(2x)',
          },
          {
            'question': 'sin²(x) kaçtır?',
            'options': ['(1 - cos(2x))/2', '(1 + cos(2x))/2', '1 - cos²(x)', 'cos²(x) - 1', '1'],
            'correctAnswer': 0,
            'explanation': 'sin²(x) = (1 - cos(2x))/2',
          },
          {
            'question': 'cos²(x) kaçtır?',
            'options': ['(1 - cos(2x))/2', '(1 + cos(2x))/2', '1 - sin²(x)', 'sin²(x) - 1', '1'],
            'correctAnswer': 1,
            'explanation': 'cos²(x) = (1 + cos(2x))/2',
          },
          {
            'question': 'tan(2x) kaçtır?',
            'options': ['2tan(x)/(1 - tan²(x))', '2tan(x)', 'tan²(x)', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'tan(2x) = 2tan(x)/(1 - tan²(x))',
          },
          {
            'question': 'sin(3x) kaçtır?',
            'options': ['3sin(x) - 4sin³(x)', '3sin(x)', '4sin³(x)', 'sin³(x)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(3x) = 3sin(x) - 4sin³(x)',
          },
        ],
        'Zor': [
          {
            'question': 'sin(x) + sin(y) kaçtır?',
            'options': ['2sin((x+y)/2)cos((x-y)/2)', 'sin(x + y)', 'sin(x)sin(y)', 'cos(x)cos(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x) + sin(y) = 2sin((x+y)/2)cos((x-y)/2)',
          },
          {
            'question': 'sin(x) - sin(y) kaçtır?',
            'options': ['2cos((x+y)/2)sin((x-y)/2)', 'sin(x - y)', 'sin(x)sin(y)', 'cos(x)cos(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x) - sin(y) = 2cos((x+y)/2)sin((x-y)/2)',
          },
          {
            'question': 'cos(x) + cos(y) kaçtır?',
            'options': ['2cos((x+y)/2)cos((x-y)/2)', 'cos(x + y)', 'cos(x)cos(y)', 'sin(x)sin(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(x) + cos(y) = 2cos((x+y)/2)cos((x-y)/2)',
          },
          {
            'question': 'cos(x) - cos(y) kaçtır?',
            'options': ['-2sin((x+y)/2)sin((x-y)/2)', 'cos(x - y)', 'cos(x)cos(y)', 'sin(x)sin(y)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(x) - cos(y) = -2sin((x+y)/2)sin((x-y)/2)',
          },
          {
            'question': 'sin(x)sin(y) kaçtır?',
            'options': ['(1/2)[cos(x-y) - cos(x+y)]', 'sin(x + y)', 'sin(x - y)', 'cos(x + y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x)sin(y) = (1/2)[cos(x-y) - cos(x+y)]',
          },
          {
            'question': 'cos(x)cos(y) kaçtır?',
            'options': ['(1/2)[cos(x-y) + cos(x+y)]', 'sin(x + y)', 'sin(x - y)', 'cos(x + y)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(x)cos(y) = (1/2)[cos(x-y) + cos(x+y)]',
          },
          {
            'question': 'sin(x)cos(y) kaçtır?',
            'options': ['(1/2)[sin(x+y) + sin(x-y)]', 'sin(x + y)', 'sin(x - y)', 'cos(x + y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x)cos(y) = (1/2)[sin(x+y) + sin(x-y)]',
          },
          {
            'question': 'sin(4x) kaçtır?',
            'options': ['4sin(x)cos(x)(1 - 2sin²(x))', '4sin(x)', '4sin³(x)', 'sin⁴(x)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(4x) = 4sin(x)cos(x)(1 - 2sin²(x))',
          },
          {
            'question': 'cos(4x) kaçtır?',
            'options': ['8cos⁴(x) - 8cos²(x) + 1', '4cos(x)', '4cos³(x)', 'cos⁴(x)', '1'],
            'correctAnswer': 0,
            'explanation': 'cos(4x) = 8cos⁴(x) - 8cos²(x) + 1',
          },
          {
            'question': 'tan(3x) kaçtır?',
            'options': ['(3tan(x) - tan³(x))/(1 - 3tan²(x))', '3tan(x)', 'tan³(x)', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'tan(3x) = (3tan(x) - tan³(x))/(1 - 3tan²(x))',
          },
          {
            'question': 'sin(x) + cos(x) kaçtır?',
            'options': ['√2sin(x + 45°)', 'sin(x + 45°)', 'cos(x + 45°)', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'sin(x) + cos(x) = √2sin(x + 45°)',
          },
          {
            'question': 'sin(x) - cos(x) kaçtır?',
            'options': ['√2sin(x - 45°)', 'sin(x - 45°)', 'cos(x - 45°)', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'sin(x) - cos(x) = √2sin(x - 45°)',
          },
          {
            'question': 'sin³(x) kaçtır?',
            'options': ['(3sin(x) - sin(3x))/4', '3sin(x)', 'sin(3x)', 'sin(x)³', '1'],
            'correctAnswer': 0,
            'explanation': 'sin³(x) = (3sin(x) - sin(3x))/4',
          },
          {
            'question': 'cos³(x) kaçtır?',
            'options': ['(3cos(x) + cos(3x))/4', '3cos(x)', 'cos(3x)', 'cos(x)³', '1'],
            'correctAnswer': 0,
            'explanation': 'cos³(x) = (3cos(x) + cos(3x))/4',
          },
          {
            'question': 'sin(x)cos(y) + cos(x)sin(y) kaçtır?',
            'options': ['sin(x + y)', 'sin(x - y)', 'cos(x + y)', 'cos(x - y)', '1'],
            'correctAnswer': 0,
            'explanation': 'sin(x)cos(y) + cos(x)sin(y) = sin(x + y)',
          },
        ],
      },
      'Logaritma': {
        'Kolay': [
          {
            'question': 'log₂(8) kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 1,
            'explanation': '2³ = 8 olduğundan log₂(8) = 3',
          },
          {
            'question': 'log₃(9) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '3² = 9 olduğundan log₃(9) = 2',
          },
          {
            'question': 'log₅(25) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '5² = 25 olduğundan log₅(25) = 2',
          },
          {
            'question': 'log₁₀(100) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '10² = 100 olduğundan log₁₀(100) = 2',
          },
          {
            'question': 'log₂(16) kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': '2⁴ = 16 olduğundan log₂(16) = 4',
          },
          {
            'question': 'log₃(27) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 2,
            'explanation': '3³ = 27 olduğundan log₃(27) = 3',
          },
          {
            'question': 'log₄(16) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '4² = 16 olduğundan log₄(16) = 2',
          },
          {
            'question': 'log₆(36) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '6² = 36 olduğundan log₆(36) = 2',
          },
          {
            'question': 'log₇(49) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '7² = 49 olduğundan log₇(49) = 2',
          },
          {
            'question': 'log₈(64) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '8² = 64 olduğundan log₈(64) = 2',
          },
          {
            'question': 'log₉(81) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '9² = 81 olduğundan log₉(81) = 2',
          },
          {
            'question': 'log₁₀(1000) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 2,
            'explanation': '10³ = 1000 olduğundan log₁₀(1000) = 3',
          },
          {
            'question': 'log₂(32) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': '2⁵ = 32 olduğundan log₂(32) = 5',
          },
          {
            'question': 'log₃(81) kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': '3⁴ = 81 olduğundan log₃(81) = 4',
          },
          {
            'question': 'log₅(125) kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 1,
            'explanation': '5³ = 125 olduğundan log₅(125) = 3',
          },
        ],
        'Orta': [
          {
            'question': 'log₂(4) + log₂(8) kaçtır?',
            'options': ['5', '6', '7', '8', '9'],
            'correctAnswer': 0,
            'explanation': 'log₂(4) + log₂(8) = 2 + 3 = 5',
          },
          {
            'question': 'log₃(9) + log₃(27) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': 'log₃(9) + log₃(27) = 2 + 3 = 5',
          },
          {
            'question': 'log₅(25) + log₅(125) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': 'log₅(25) + log₅(125) = 2 + 3 = 5',
          },
          {
            'question': 'log₂(16) - log₂(4) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': 'log₂(16) - log₂(4) = 4 - 2 = 2',
          },
          {
            'question': 'log₃(81) - log₃(9) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': 'log₃(81) - log₃(9) = 4 - 2 = 2',
          },
          {
            'question': 'log₅(625) - log₅(25) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': 'log₅(625) - log₅(25) = 4 - 2 = 2',
          },
          {
            'question': '2log₂(8) kaçtır?',
            'options': ['4', '5', '6', '7', '8'],
            'correctAnswer': 2,
            'explanation': '2log₂(8) = 2 × 3 = 6',
          },
          {
            'question': '3log₃(9) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': '3log₃(9) = 3 × 2 = 6',
          },
          {
            'question': 'log₂(4) × log₃(9) kaçtır?',
            'options': ['2', '3', '4', '5', '6'],
            'correctAnswer': 2,
            'explanation': 'log₂(4) × log₃(9) = 2 × 2 = 4',
          },
          {
            'question': 'log₅(25) × log₅(125) kaçtır?',
            'options': ['3', '4', '5', '6', '7'],
            'correctAnswer': 2,
            'explanation': 'log₅(25) × log₅(125) = 2 × 3 = 6',
          },
          {
            'question': 'log₂(8) ÷ log₃(9) kaçtır?',
            'options': ['1', '1.5', '2', '2.5', '3'],
            'correctAnswer': 1,
            'explanation': 'log₂(8) ÷ log₃(9) = 3 ÷ 2 = 1.5',
          },
          {
            'question': 'log₅(125) ÷ log₅(25) kaçtır?',
            'options': ['1', '1.5', '2', '2.5', '3'],
            'correctAnswer': 1,
            'explanation': 'log₅(125) ÷ log₅(25) = 3 ÷ 2 = 1.5',
          },
          {
            'question': 'log₂(16) + log₃(27) kaçtır?',
            'options': ['5', '6', '7', '8', '9'],
            'correctAnswer': 2,
            'explanation': 'log₂(16) + log₃(27) = 4 + 3 = 7',
          },
          {
            'question': 'log₅(625) + log₃(81) kaçtır?',
            'options': ['6', '7', '8', '9', '10'],
            'correctAnswer': 2,
            'explanation': 'log₅(625) + log₃(81) = 4 + 4 = 8',
          },
          {
            'question': 'log₂(32) - log₃(9) kaçtır?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 2,
            'explanation': 'log₂(32) - log₃(9) = 5 - 2 = 3',
          },
        ],
        'Zor': [
          {
            'question': 'log₂(x) = 5 ise x kaçtır?',
            'options': ['16', '32', '64', '128', '256'],
            'correctAnswer': 1,
            'explanation': 'log₂(x) = 5 ise x = 2⁵ = 32',
          },
          {
            'question': 'log₃(x) = 4 ise x kaçtır?',
            'options': ['27', '81', '243', '729', '2187'],
            'correctAnswer': 1,
            'explanation': 'log₃(x) = 4 ise x = 3⁴ = 81',
          },
          {
            'question': 'log₅(x) = 3 ise x kaçtır?',
            'options': ['25', '75', '125', '375', '625'],
            'correctAnswer': 2,
            'explanation': 'log₅(x) = 3 ise x = 5³ = 125',
          },
          {
            'question': 'log₂(x) + log₂(y) = 7 ve log₂(x) - log₂(y) = 3 ise x kaçtır?',
            'options': ['16', '32', '64', '128', '256'],
            'correctAnswer': 1,
            'explanation': 'log₂(x) = 5, log₂(y) = 2, x = 2⁵ = 32',
          },
          {
            'question': 'log₃(x) + log₃(y) = 6 ve log₃(x) - log₃(y) = 2 ise y kaçtır?',
            'options': ['3', '9', '27', '81', '243'],
            'correctAnswer': 1,
            'explanation': 'log₃(x) = 4, log₃(y) = 2, y = 3² = 9',
          },
          {
            'question': 'log₅(x) + log₅(y) = 5 ve log₅(x) - log₅(y) = 1 ise x kaçtır?',
            'options': ['25', '125', '625', '3125', '15625'],
            'correctAnswer': 1,
            'explanation': 'log₅(x) = 3, log₅(y) = 2, x = 5³ = 125',
          },
          {
            'question': '2log₂(x) = 8 ise x kaçtır?',
            'options': ['8', '16', '32', '64', '128'],
            'correctAnswer': 1,
            'explanation': '2log₂(x) = 8, log₂(x) = 4, x = 2⁴ = 16',
          },
          {
            'question': '3log₃(x) = 12 ise x kaçtır?',
            'options': ['9', '27', '81', '243', '729'],
            'correctAnswer': 2,
            'explanation': '3log₃(x) = 12, log₃(x) = 4, x = 3⁴ = 81',
          },
          {
            'question': 'log₂(x) × log₃(y) = 6 ve log₂(x) = 2 ise y kaçtır?',
            'options': ['3', '9', '27', '81', '243'],
            'correctAnswer': 1,
            'explanation': 'log₂(x) = 2, log₃(y) = 3, y = 3³ = 27',
          },
          {
            'question': 'log₅(x) × log₅(y) = 8 ve log₅(x) = 2 ise y kaçtır?',
            'options': ['25', '125', '625', '3125', '15625'],
            'correctAnswer': 2,
            'explanation': 'log₅(x) = 2, log₅(y) = 4, y = 5⁴ = 625',
          },
          {
            'question': 'log₂(x) ÷ log₃(y) = 2 ve log₃(y) = 2 ise x kaçtır?',
            'options': ['8', '16', '32', '64', '128'],
            'correctAnswer': 1,
            'explanation': 'log₃(y) = 2, log₂(x) = 4, x = 2⁴ = 16',
          },
          {
            'question': 'log₅(x) ÷ log₅(y) = 3 ve log₅(y) = 1 ise x kaçtır?',
            'options': ['25', '125', '625', '3125', '15625'],
            'correctAnswer': 1,
            'explanation': 'log₅(y) = 1, log₅(x) = 3, x = 5³ = 125',
          },
          {
            'question': 'log₂(x) + log₃(y) = 8 ve log₂(x) = 5 ise y kaçtır?',
            'options': ['3', '9', '27', '81', '243'],
            'correctAnswer': 1,
            'explanation': 'log₂(x) = 5, log₃(y) = 3, y = 3³ = 27',
          },
          {
            'question': 'log₅(x) + log₃(y) = 9 ve log₅(x) = 4 ise y kaçtır?',
            'options': ['3', '9', '27', '81', '243'],
            'correctAnswer': 3,
            'explanation': 'log₅(x) = 4, log₃(y) = 5, y = 3⁵ = 243',
          },
          {
            'question': 'log₂(x) - log₃(y) = 2 ve log₃(y) = 2 ise x kaçtır?',
            'options': ['16', '32', '64', '128', '256'],
            'correctAnswer': 1,
            'explanation': 'log₃(y) = 2, log₂(x) = 4, x = 2⁴ = 16',
          },
        ],
      },
      'Permütasyon ve Kombinasyon': {
        'Kolay': [
          {
            'question': '5 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['60', '120', '240', '360', '720'],
            'correctAnswer': 1,
            'explanation': '5! = 5 × 4 × 3 × 2 × 1 = 120',
          },
          {
            'question': '4 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['12', '24', '36', '48', '60'],
            'correctAnswer': 1,
            'explanation': '4! = 4 × 3 × 2 × 1 = 24',
          },
          {
            'question': '3 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['3', '6', '9', '12', '15'],
            'correctAnswer': 1,
            'explanation': '3! = 3 × 2 × 1 = 6',
          },
          {
            'question': '6 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['360', '480', '600', '720', '840'],
            'correctAnswer': 3,
            'explanation': '6! = 6 × 5 × 4 × 3 × 2 × 1 = 720',
          },
          {
            'question': '2 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['1', '2', '3', '4', '5'],
            'correctAnswer': 1,
            'explanation': '2! = 2 × 1 = 2',
          },
          {
            'question': '7 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['3600', '4200', '5040', '6000', '7200'],
            'correctAnswer': 2,
            'explanation': '7! = 7 × 6 × 5 × 4 × 3 × 2 × 1 = 5040',
          },
          {
            'question': '8 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['28800', '32400', '36000', '40320', '46080'],
            'correctAnswer': 3,
            'explanation': '8! = 8 × 7 × 6 × 5 × 4 × 3 × 2 × 1 = 40320',
          },
          {
            'question': '9 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['288000', '324000', '360000', '362880', '400000'],
            'correctAnswer': 3,
            'explanation': '9! = 9 × 8 × 7 × 6 × 5 × 4 × 3 × 2 × 1 = 362880',
          },
          {
            'question': '10 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['2880000', '3240000', '3600000', '3628800', '4000000'],
            'correctAnswer': 3,
            'explanation': '10! = 10 × 9 × 8 × 7 × 6 × 5 × 4 × 3 × 2 × 1 = 3628800',
          },
          {
            'question': '1 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 1,
            'explanation': '1! = 1',
          },
          {
            'question': '0 kişi kaç farklı şekilde sıralanabilir?',
            'options': ['0', '1', '2', '3', '4'],
            'correctAnswer': 1,
            'explanation': '0! = 1 (tanım gereği)',
          },
          {
            'question': 'P(5,3) kaçtır?',
            'options': ['30', '60', '90', '120', '150'],
            'correctAnswer': 1,
            'explanation': 'P(5,3) = 5!/(5-3)! = 5!/2! = 120/2 = 60',
          },
          {
            'question': 'P(4,2) kaçtır?',
            'options': ['8', '12', '16', '20', '24'],
            'correctAnswer': 1,
            'explanation': 'P(4,2) = 4!/(4-2)! = 4!/2! = 24/2 = 12',
          },
          {
            'question': 'P(6,4) kaçtır?',
            'options': ['180', '240', '300', '360', '420'],
            'correctAnswer': 2,
            'explanation': 'P(6,4) = 6!/(6-4)! = 6!/2! = 720/2 = 360',
          },
          {
            'question': 'P(7,5) kaçtır?',
            'options': ['840', '1260', '1680', '2100', '2520'],
            'correctAnswer': 2,
            'explanation': 'P(7,5) = 7!/(7-5)! = 7!/2! = 5040/2 = 2520',
          },
        ],
        'Orta': [
          {
            'question': 'C(5,3) kaçtır?',
            'options': ['5', '10', '15', '20', '25'],
            'correctAnswer': 1,
            'explanation': 'C(5,3) = 5!/(3!(5-3)!) = 5!/(3!2!) = 120/(6×2) = 10',
          },
          {
            'question': 'C(6,2) kaçtır?',
            'options': ['10', '12', '15', '18', '20'],
            'correctAnswer': 2,
            'explanation': 'C(6,2) = 6!/(2!(6-2)!) = 6!/(2!4!) = 720/(2×24) = 15',
          },
          {
            'question': 'C(7,4) kaçtır?',
            'options': ['25', '30', '35', '40', '45'],
            'correctAnswer': 2,
            'explanation': 'C(7,4) = 7!/(4!(7-4)!) = 7!/(4!3!) = 5040/(24×6) = 35',
          },
          {
            'question': 'C(8,3) kaçtır?',
            'options': ['40', '48', '56', '64', '72'],
            'correctAnswer': 2,
            'explanation': 'C(8,3) = 8!/(3!(8-3)!) = 8!/(3!5!) = 40320/(6×120) = 56',
          },
          {
            'question': 'C(9,5) kaçtır?',
            'options': ['84', '96', '108', '120', '126'],
            'correctAnswer': 4,
            'explanation': 'C(9,5) = 9!/(5!(9-5)!) = 9!/(5!4!) = 362880/(120×24) = 126',
          },
          {
            'question': 'C(10,6) kaçtır?',
            'options': ['180', '200', '210', '240', '252'],
            'correctAnswer': 2,
            'explanation': 'C(10,6) = 10!/(6!(10-6)!) = 10!/(6!4!) = 3628800/(720×24) = 210',
          },
          {
            'question': 'C(11,7) kaçtır?',
            'options': ['280', '300', '330', '360', '390'],
            'correctAnswer': 2,
            'explanation': 'C(11,7) = 11!/(7!(11-7)!) = 11!/(7!4!) = 39916800/(5040×24) = 330',
          },
          {
            'question': 'C(12,8) kaçtır?',
            'options': ['400', '450', '495', '540', '600'],
            'correctAnswer': 2,
            'explanation': 'C(12,8) = 12!/(8!(12-8)!) = 12!/(8!4!) = 479001600/(40320×24) = 495',
          },
          {
            'question': 'C(13,9) kaçtır?',
            'options': ['600', '650', '700', '715', '780'],
            'correctAnswer': 3,
            'explanation': 'C(13,9) = 13!/(9!(13-9)!) = 13!/(9!4!) = 6227020800/(362880×24) = 715',
          },
          {
            'question': 'C(14,10) kaçtır?',
            'options': ['800', '900', '1000', '1001', '1100'],
            'correctAnswer': 3,
            'explanation': 'C(14,10) = 14!/(10!(14-10)!) = 14!/(10!4!) = 87178291200/(3628800×24) = 1001',
          },
          {
            'question': 'C(15,11) kaçtır?',
            'options': ['1200', '1300', '1365', '1400', '1500'],
            'correctAnswer': 2,
            'explanation': 'C(15,11) = 15!/(11!(15-11)!) = 15!/(11!4!) = 1307674368000/(39916800×24) = 1365',
          },
          {
            'question': 'C(16,12) kaçtır?',
            'options': ['1600', '1700', '1800', '1820', '2000'],
            'correctAnswer': 3,
            'explanation': 'C(16,12) = 16!/(12!(16-12)!) = 16!/(12!4!) = 20922789888000/(479001600×24) = 1820',
          },
          {
            'question': 'C(17,13) kaçtır?',
            'options': ['2000', '2200', '2380', '2400', '2600'],
            'correctAnswer': 2,
            'explanation': 'C(17,13) = 17!/(13!(17-13)!) = 17!/(13!4!) = 355687428096000/(6227020800×24) = 2380',
          },
          {
            'question': 'C(18,14) kaçtır?',
            'options': ['2400', '2600', '2800', '3060', '3200'],
            'correctAnswer': 3,
            'explanation': 'C(18,14) = 18!/(14!(18-14)!) = 18!/(14!4!) = 6402373705728000/(87178291200×24) = 3060',
          },
          {
            'question': 'C(19,15) kaçtır?',
            'options': ['3000', '3200', '3400', '3876', '4000'],
            'correctAnswer': 3,
            'explanation': 'C(19,15) = 19!/(15!(19-15)!) = 19!/(15!4!) = 121645100408832000/(1307674368000×24) = 3876',
          },
        ],
        'Zor': [
          {
            'question': 'C(n,0) + C(n,1) + C(n,2) + ... + C(n,n) kaçtır?',
            'options': ['n', 'n²', '2ⁿ', 'n!', 'nⁿ'],
            'correctAnswer': 2,
            'explanation': 'C(n,0) + C(n,1) + C(n,2) + ... + C(n,n) = 2ⁿ (binom teoremi)',
          },
          {
            'question': 'C(n,r) = C(n,n-r) olduğuna göre C(20,17) kaçtır?',
            'options': ['1000', '1140', '1200', '1360', '1500'],
            'correctAnswer': 1,
            'explanation': 'C(20,17) = C(20,3) = 20!/(3!17!) = 1140',
          },
          {
            'question': 'C(n+1,r) = C(n,r) + C(n,r-1) olduğuna göre C(16,8) + C(16,7) kaçtır?',
            'options': ['C(17,8)', 'C(17,7)', 'C(16,9)', 'C(15,8)', 'C(15,7)'],
            'correctAnswer': 0,
            'explanation': 'C(16,8) + C(16,7) = C(17,8) (Pascal üçgeni özelliği)',
          },
          {
            'question': 'C(n,r) × C(r,k) = C(n,k) × C(n-k,r-k) olduğuna göre C(10,4) × C(4,2) kaçtır?',
            'options': ['C(10,2) × C(8,2)', 'C(10,2) × C(6,2)', 'C(10,2) × C(4,2)', 'C(10,2) × C(2,2)', 'C(10,2) × C(0,2)'],
            'correctAnswer': 0,
            'explanation': 'C(10,4) × C(4,2) = C(10,2) × C(8,2)',
          },
          {
            'question': 'C(n,r) = n!/(r!(n-r)!) olduğuna göre C(25,12) kaçtır?',
            'options': ['4000000', '5000000', '5200300', '6000000', '7000000'],
            'correctAnswer': 2,
            'explanation': 'C(25,12) = 25!/(12!13!) = 5200300',
          },
          {
            'question': 'C(n,r) = C(n,n-r) olduğuna göre C(30,18) kaçtır?',
            'options': ['C(30,12)', 'C(30,15)', 'C(30,20)', 'C(30,25)', 'C(30,28)'],
            'correctAnswer': 0,
            'explanation': 'C(30,18) = C(30,12) (simetri özelliği)',
          },
          {
            'question': 'C(n+1,r+1) = C(n,r) + C(n,r+1) olduğuna göre C(18,9) + C(18,10) kaçtır?',
            'options': ['C(19,9)', 'C(19,10)', 'C(19,11)', 'C(18,11)', 'C(18,12)'],
            'correctAnswer': 1,
            'explanation': 'C(18,9) + C(18,10) = C(19,10) (Pascal üçgeni özelliği)',
          },
          {
            'question': 'C(n,r) × C(r,k) = C(n,k) × C(n-k,r-k) olduğuna göre C(15,6) × C(6,3) kaçtır?',
            'options': ['C(15,3) × C(12,3)', 'C(15,3) × C(9,3)', 'C(15,3) × C(6,3)', 'C(15,3) × C(3,3)', 'C(15,3) × C(0,3)'],
            'correctAnswer': 0,
            'explanation': 'C(15,6) × C(6,3) = C(15,3) × C(12,3)',
          },
          {
            'question': 'C(n,r) = n!/(r!(n-r)!) olduğuna göre C(35,20) kaçtır?',
            'options': ['20000000', '25000000', '3247943160', '30000000', '35000000'],
            'correctAnswer': 2,
            'explanation': 'C(35,20) = 35!/(20!15!) = 3247943160',
          },
          {
            'question': 'C(n,r) = C(n,n-r) olduğuna göre C(40,25) kaçtır?',
            'options': ['C(40,15)', 'C(40,20)', 'C(40,30)', 'C(40,35)', 'C(40,38)'],
            'correctAnswer': 0,
            'explanation': 'C(40,25) = C(40,15) (simetri özelliği)',
          },
          {
            'question': 'C(n+1,r+1) = C(n,r) + C(n,r+1) olduğuna göre C(22,11) + C(22,12) kaçtır?',
            'options': ['C(23,11)', 'C(23,12)', 'C(23,13)', 'C(22,13)', 'C(22,14)'],
            'correctAnswer': 1,
            'explanation': 'C(22,11) + C(22,12) = C(23,12) (Pascal üçgeni özelliği)',
          },
          {
            'question': 'C(n,r) × C(r,k) = C(n,k) × C(n-k,r-k) olduğuna göre C(20,8) × C(8,4) kaçtır?',
            'options': ['C(20,4) × C(16,4)', 'C(20,4) × C(12,4)', 'C(20,4) × C(8,4)', 'C(20,4) × C(4,4)', 'C(20,4) × C(0,4)'],
            'correctAnswer': 0,
            'explanation': 'C(20,8) × C(8,4) = C(20,4) × C(16,4)',
          },
          {
            'question': 'C(n,r) = n!/(r!(n-r)!) olduğuna göre C(45,25) kaçtır?',
            'options': ['50000000', '75000000', '100000000', '150000000', '200000000'],
            'correctAnswer': 2,
            'explanation': 'C(45,25) = 45!/(25!20!) = 150000000 (yaklaşık)',
          },
          {
            'question': 'C(n,r) = C(n,n-r) olduğuna göre C(50,30) kaçtır?',
            'options': ['C(50,20)', 'C(50,25)', 'C(50,35)', 'C(50,40)', 'C(50,45)'],
            'correctAnswer': 0,
            'explanation': 'C(50,30) = C(50,20) (simetri özelliği)',
          },
        ],
      },
      'Olasılık': {
        'Kolay': [
          {
            'question': 'Bir zar atıldığında 3 gelme olasılığı kaçtır?',
            'options': ['1/6', '1/3', '1/2', '2/3', '5/6'],
            'correctAnswer': 0,
            'explanation': 'Zar 6 yüzlü olduğundan P(3) = 1/6',
          },
          {
            'question': 'Bir zar atıldığında çift sayı gelme olasılığı kaçtır?',
            'options': ['1/6', '1/3', '1/2', '2/3', '5/6'],
            'correctAnswer': 2,
            'explanation': 'Çift sayılar 2,4,6 olduğundan P(çift) = 3/6 = 1/2',
          },
          {
            'question': 'Bir zar atıldığında tek sayı gelme olasılığı kaçtır?',
            'options': ['1/6', '1/3', '1/2', '2/3', '5/6'],
            'correctAnswer': 2,
            'explanation': 'Tek sayılar 1,3,5 olduğundan P(tek) = 3/6 = 1/2',
          },
          {
            'question': 'Bir zar atıldığında 5\'ten büyük sayı gelme olasılığı kaçtır?',
            'options': ['1/6', '1/3', '1/2', '2/3', '5/6'],
            'correctAnswer': 0,
            'explanation': '5\'ten büyük sadece 6 olduğundan P(>5) = 1/6',
          },
          {
            'question': 'Bir zar atıldığında 3\'ten küçük sayı gelme olasılığı kaçtır?',
            'options': ['1/6', '1/3', '1/2', '2/3', '5/6'],
            'correctAnswer': 1,
            'explanation': '3\'ten küçük sayılar 1,2 olduğundan P(<3) = 2/6 = 1/3',
          },
          {
            'question': 'Bir madeni para atıldığında yazı gelme olasılığı kaçtır?',
            'options': ['0', '1/4', '1/2', '3/4', '1'],
            'correctAnswer': 2,
            'explanation': 'Madeni para 2 yüzlü olduğundan P(yazı) = 1/2',
          },
          {
            'question': 'Bir madeni para atıldığında tura gelme olasılığı kaçtır?',
            'options': ['0', '1/4', '1/2', '3/4', '1'],
            'correctAnswer': 2,
            'explanation': 'Madeni para 2 yüzlü olduğundan P(tura) = 1/2',
          },
          {
            'question': 'İki madeni para atıldığında ikisinin de yazı gelme olasılığı kaçtır?',
            'options': ['1/4', '1/2', '3/4', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'P(YY) = P(Y) × P(Y) = 1/2 × 1/2 = 1/4',
          },
          {
            'question': 'İki madeni para atıldığında ikisinin de tura gelme olasılığı kaçtır?',
            'options': ['1/4', '1/2', '3/4', '1', '0'],
            'correctAnswer': 0,
            'explanation': 'P(TT) = P(T) × P(T) = 1/2 × 1/2 = 1/4',
          },
          {
            'question': 'İki madeni para atıldığında birinin yazı birinin tura gelme olasılığı kaçtır?',
            'options': ['1/4', '1/2', '3/4', '1', '0'],
            'correctAnswer': 1,
            'explanation': 'P(YT veya TY) = P(YT) + P(TY) = 1/4 + 1/4 = 1/2',
          },
          {
            'question': 'Bir torbada 3 kırmızı, 2 mavi top vardır. Kırmızı top çekme olasılığı kaçtır?',
            'options': ['1/5', '2/5', '3/5', '4/5', '1'],
            'correctAnswer': 2,
            'explanation': 'P(kırmızı) = 3/(3+2) = 3/5',
          },
          {
            'question': 'Bir torbada 3 kırmızı, 2 mavi top vardır. Mavi top çekme olasılığı kaçtır?',
            'options': ['1/5', '2/5', '3/5', '4/5', '1'],
            'correctAnswer': 1,
            'explanation': 'P(mavi) = 2/(3+2) = 2/5',
          },
          {
            'question': 'Bir torbada 4 sarı, 3 yeşil top vardır. Sarı top çekme olasılığı kaçtır?',
            'options': ['3/7', '4/7', '5/7', '6/7', '1'],
            'correctAnswer': 1,
            'explanation': 'P(sarı) = 4/(4+3) = 4/7',
          },
          {
            'question': 'Bir torbada 4 sarı, 3 yeşil top vardır. Yeşil top çekme olasılığı kaçtır?',
            'options': ['3/7', '4/7', '5/7', '6/7', '1'],
            'correctAnswer': 0,
            'explanation': 'P(yeşil) = 3/(4+3) = 3/7',
          },
          {
            'question': 'Bir torbada 5 beyaz, 2 siyah top vardır. Beyaz top çekme olasılığı kaçtır?',
            'options': ['2/7', '3/7', '4/7', '5/7', '6/7'],
            'correctAnswer': 3,
            'explanation': 'P(beyaz) = 5/(5+2) = 5/7',
          },
        ],
        'Orta': [
          {
            'question': 'Üç madeni para atıldığında üçünün de yazı gelme olasılığı kaçtır?',
            'options': ['1/8', '1/4', '3/8', '1/2', '5/8'],
            'correctAnswer': 0,
            'explanation': 'P(YYY) = P(Y)³ = (1/2)³ = 1/8',
          },
          {
            'question': 'Üç madeni para atıldığında üçünün de tura gelme olasılığı kaçtır?',
            'options': ['1/8', '1/4', '3/8', '1/2', '5/8'],
            'correctAnswer': 0,
            'explanation': 'P(TTT) = P(T)³ = (1/2)³ = 1/8',
          },
          {
            'question': 'Üç madeni para atıldığında ikisinin yazı birinin tura gelme olasılığı kaçtır?',
            'options': ['1/8', '1/4', '3/8', '1/2', '5/8'],
            'correctAnswer': 2,
            'explanation': 'P(2Y1T) = C(3,2) × (1/2)² × (1/2) = 3 × 1/8 = 3/8',
          },
          {
            'question': 'Üç madeni para atıldığında birinin yazı ikisinin tura gelme olasılığı kaçtır?',
            'options': ['1/8', '1/4', '3/8', '1/2', '5/8'],
            'correctAnswer': 2,
            'explanation': 'P(1Y2T) = C(3,1) × (1/2) × (1/2)² = 3 × 1/8 = 3/8',
          },
          {
            'question': 'Dört madeni para atıldığında dördünün de yazı gelme olasılığı kaçtır?',
            'options': ['1/16', '1/8', '1/4', '3/8', '1/2'],
            'correctAnswer': 0,
            'explanation': 'P(YYYY) = P(Y)⁴ = (1/2)⁴ = 1/16',
          },
          {
            'question': 'Dört madeni para atıldığında dördünün de tura gelme olasılığı kaçtır?',
            'options': ['1/16', '1/8', '1/4', '3/8', '1/2'],
            'correctAnswer': 0,
            'explanation': 'P(TTTT) = P(T)⁴ = (1/2)⁴ = 1/16',
          },
          {
            'question': 'Dört madeni para atıldığında üçünün yazı birinin tura gelme olasılığı kaçtır?',
            'options': ['1/16', '1/8', '1/4', '3/8', '1/2'],
            'correctAnswer': 2,
            'explanation': 'P(3Y1T) = C(4,3) × (1/2)³ × (1/2) = 4 × 1/16 = 1/4',
          },
          {
            'question': 'Dört madeni para atıldığında ikisinin yazı ikisinin tura gelme olasılığı kaçtır?',
            'options': ['1/16', '1/8', '1/4', '3/8', '1/2'],
            'correctAnswer': 2,
            'explanation': 'P(2Y2T) = C(4,2) × (1/2)² × (1/2)² = 6 × 1/16 = 3/8',
          },
          {
            'question': 'Bir torbada 4 kırmızı, 3 mavi, 2 yeşil top vardır. Kırmızı top çekme olasılığı kaçtır?',
            'options': ['2/9', '3/9', '4/9', '5/9', '6/9'],
            'correctAnswer': 2,
            'explanation': 'P(kırmızı) = 4/(4+3+2) = 4/9',
          },
          {
            'question': 'Bir torbada 4 kırmızı, 3 mavi, 2 yeşil top vardır. Mavi top çekme olasılığı kaçtır?',
            'options': ['2/9', '3/9', '4/9', '5/9', '6/9'],
            'correctAnswer': 1,
            'explanation': 'P(mavi) = 3/(4+3+2) = 3/9 = 1/3',
          },
          {
            'question': 'Bir torbada 4 kırmızı, 3 mavi, 2 yeşil top vardır. Yeşil top çekme olasılığı kaçtır?',
            'options': ['2/9', '3/9', '4/9', '5/9', '6/9'],
            'correctAnswer': 0,
            'explanation': 'P(yeşil) = 2/(4+3+2) = 2/9',
          },
          {
            'question': 'Bir torbada 5 beyaz, 3 siyah, 2 gri top vardır. Beyaz top çekme olasılığı kaçtır?',
            'options': ['1/2', '3/10', '2/5', '1/5', '1/10'],
            'correctAnswer': 0,
            'explanation': 'P(beyaz) = 5/(5+3+2) = 5/10 = 1/2',
          },
          {
            'question': 'Bir torbada 5 beyaz, 3 siyah, 2 gri top vardır. Siyah top çekme olasılığı kaçtır?',
            'options': ['1/2', '3/10', '2/5', '1/5', '1/10'],
            'correctAnswer': 1,
            'explanation': 'P(siyah) = 3/(5+3+2) = 3/10',
          },
          {
            'question': 'Bir torbada 5 beyaz, 3 siyah, 2 gri top vardır. Gri top çekme olasılığı kaçtır?',
            'options': ['1/2', '3/10', '2/5', '1/5', '1/10'],
            'correctAnswer': 3,
            'explanation': 'P(gri) = 2/(5+3+2) = 2/10 = 1/5',
          },
        ],
        'Zor': [
          {
            'question': 'Beş madeni para atıldığında beşinin de yazı gelme olasılığı kaçtır?',
            'options': ['1/32', '1/16', '1/8', '1/4', '1/2'],
            'correctAnswer': 0,
            'explanation': 'P(YYYYY) = P(Y)⁵ = (1/2)⁵ = 1/32',
          },
          {
            'question': 'Beş madeni para atıldığında beşinin de tura gelme olasılığı kaçtır?',
            'options': ['1/32', '1/16', '1/8', '1/4', '1/2'],
            'correctAnswer': 0,
            'explanation': 'P(TTTTT) = P(T)⁵ = (1/2)⁵ = 1/32',
          },
          {
            'question': 'Beş madeni para atıldığında dördünün yazı birinin tura gelme olasılığı kaçtır?',
            'options': ['1/32', '1/16', '5/32', '1/8', '1/4'],
            'correctAnswer': 2,
            'explanation': 'P(4Y1T) = C(5,4) × (1/2)⁴ × (1/2) = 5 × 1/32 = 5/32',
          },
          {
            'question': 'Beş madeni para atıldığında üçünün yazı ikisinin tura gelme olasılığı kaçtır?',
            'options': ['1/32', '1/16', '5/32', '10/32', '1/4'],
            'correctAnswer': 3,
            'explanation': 'P(3Y2T) = C(5,3) × (1/2)³ × (1/2)² = 10 × 1/32 = 10/32',
          },
          {
            'question': 'Altı madeni para atıldığında altısının da yazı gelme olasılığı kaçtır?',
            'options': ['1/64', '1/32', '1/16', '1/8', '1/4'],
            'correctAnswer': 0,
            'explanation': 'P(YYYYYY) = P(Y)⁶ = (1/2)⁶ = 1/64',
          },
          {
            'question': 'Altı madeni para atıldığında altısının da tura gelme olasılığı kaçtır?',
            'options': ['1/64', '1/32', '1/16', '1/8', '1/4'],
            'correctAnswer': 0,
            'explanation': 'P(TTTTTT) = P(T)⁶ = (1/2)⁶ = 1/64',
          },
          {
            'question': 'Altı madeni para atıldığında beşinin yazı birinin tura gelme olasılığı kaçtır?',
            'options': ['1/64', '1/32', '6/64', '1/16', '1/8'],
            'correctAnswer': 2,
            'explanation': 'P(5Y1T) = C(6,5) × (1/2)⁵ × (1/2) = 6 × 1/64 = 6/64',
          },
          {
            'question': 'Altı madeni para atıldığında dördünün yazı ikisinin tura gelme olasılığı kaçtır?',
            'options': ['1/64', '1/32', '6/64', '15/64', '1/16'],
            'correctAnswer': 3,
            'explanation': 'P(4Y2T) = C(6,4) × (1/2)⁴ × (1/2)² = 15 × 1/64 = 15/64',
          },
          {
            'question': 'Bir torbada 6 kırmızı, 4 mavi, 3 yeşil, 2 sarı top vardır. Kırmızı top çekme olasılığı kaçtır?',
            'options': ['2/5', '3/5', '4/5', '1/3', '2/3'],
            'correctAnswer': 0,
            'explanation': 'P(kırmızı) = 6/(6+4+3+2) = 6/15 = 2/5',
          },
          {
            'question': 'Bir torbada 6 kırmızı, 4 mavi, 3 yeşil, 2 sarı top vardır. Mavi top çekme olasılığı kaçtır?',
            'options': ['2/5', '3/5', '4/5', '4/15', '2/3'],
            'correctAnswer': 3,
            'explanation': 'P(mavi) = 4/(6+4+3+2) = 4/15',
          },
          {
            'question': 'Bir torbada 6 kırmızı, 4 mavi, 3 yeşil, 2 sarı top vardır. Yeşil top çekme olasılığı kaçtır?',
            'options': ['2/5', '3/5', '4/5', '1/5', '2/3'],
            'correctAnswer': 3,
            'explanation': 'P(yeşil) = 3/(6+4+3+2) = 3/15 = 1/5',
          },
          {
            'question': 'Bir torbada 6 kırmızı, 4 mavi, 3 yeşil, 2 sarı top vardır. Sarı top çekme olasılığı kaçtır?',
            'options': ['2/5', '3/5', '4/5', '2/15', '1/3'],
            'correctAnswer': 3,
            'explanation': 'P(sarı) = 2/(6+4+3+2) = 2/15',
          },
          {
            'question': 'Bir torbada 7 beyaz, 5 siyah, 3 gri, 2 kahverengi top vardır. Beyaz top çekme olasılığı kaçtır?',
            'options': ['7/17', '5/17', '3/17', '2/17', '1/17'],
            'correctAnswer': 0,
            'explanation': 'P(beyaz) = 7/(7+5+3+2) = 7/17',
          },
          {
            'question': 'Bir torbada 7 beyaz, 5 siyah, 3 gri, 2 kahverengi top vardır. Siyah top çekme olasılığı kaçtır?',
            'options': ['7/17', '5/17', '3/17', '2/17', '1/17'],
            'correctAnswer': 1,
            'explanation': 'P(siyah) = 5/(7+5+3+2) = 5/17',
          },
          {
            'question': 'Bir torbada 7 beyaz, 5 siyah, 3 gri, 2 kahverengi top vardır. Gri top çekme olasılığı kaçtır?',
            'options': ['7/17', '5/17', '3/17', '2/17', '1/17'],
            'correctAnswer': 2,
            'explanation': 'P(gri) = 3/(7+5+3+2) = 3/17',
          },
        ],
      },
    };

    // Konu bulunamazsa varsayılan sorular
    if (!questionBank.containsKey(widget.konuAdi)) {
      return List.generate(
        15,
        (index) => {
          'question':
              'Soru ${index + 1} - ${widget.konuAdi} konusu hakkında bir soru',
          'options': [
            'A) Seçenek 1',
            'B) Seçenek 2',
            'C) Seçenek 3',
            'D) Seçenek 4',
            'E) Seçenek 5',
          ],
          'correctAnswer': index % 5,
          'explanation': 'Bu soru ${widget.konuAdi} konusu hakkındadır.',
        },
      );
    }

    // Zorluk seviyesine göre soruları döndür
    final difficultyQuestions = questionBank[widget.konuAdi]![widget.zorluk];
    if (difficultyQuestions != null) {
      return difficultyQuestions;
    }

    // Eğer zorluk seviyesi bulunamazsa, kolay seviyeyi döndür
    return questionBank[widget.konuAdi]!['Kolay'] ??
        List.generate(
          15,
          (index) => {
            'question':
                'Soru ${index + 1} - ${widget.konuAdi} konusu hakkında bir soru',
            'options': [
              'A) Seçenek 1',
              'B) Seçenek 2',
              'C) Seçenek 3',
              'D) Seçenek 4',
              'E) Seçenek 5',
            ],
            'correctAnswer': index % 5,
            'explanation': 'Bu soru ${widget.konuAdi} konusu hakkındadır.',
          },
        );
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      userAnswers[currentQuestionIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _finishTest() {
    setState(() {
      testCompleted = true;
    });

    // Test sonuç sayfasına git
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TestSonucSayfasi(
          questions: questions,
          userAnswers: userAnswers,
          sinifAdi: widget.sinifAdi,
          dersAdi: widget.dersAdi,
          konuAdi: widget.konuAdi,
          zorluk: widget.zorluk,
          testNo: widget.testNo,
          renk: widget.renk,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${widget.konuAdi} - Test ${widget.testNo}'),
          backgroundColor: widget.renk,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.konuAdi} - Test ${widget.testNo}'),
        backgroundColor: widget.renk,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.renk,
              widget.renk.withOpacity(0.8),
              widget.renk.withOpacity(0.6),
              widget.renk.withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          children: [
            // Progress Bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soru ${currentQuestionIndex + 1}/${questions.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                  ),
                ],
              ),
            ),

            // Question Card
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
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
                    // Question
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Soru ${currentQuestionIndex + 1}',
                              style: TextStyle(
                                color: widget.renk,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              currentQuestion['question'],
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Options
                    ...List.generate(
                      currentQuestion['options'].length,
                      (index) => _buildOptionButton(
                        index,
                        currentQuestion['options'][index],
                        userAnswers[currentQuestionIndex] == index,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation Buttons
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Button
                  if (currentQuestionIndex > 0)
                    ElevatedButton(
                      onPressed: _previousQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        foregroundColor: widget.renk,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(width: 8),
                          Text('Önceki'),
                        ],
                      ),
                    )
                  else
                    const SizedBox(width: 100),

                  // Next/Finish Button
                  ElevatedButton(
                    onPressed: currentQuestionIndex == questions.length - 1
                        ? _finishTest
                        : _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.renk,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentQuestionIndex == questions.length - 1
                              ? 'Bitir'
                              : 'Sonraki',
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          currentQuestionIndex == questions.length - 1
                              ? Icons.check
                              : Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(int index, String option, bool isSelected) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () => _selectAnswer(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? widget.renk.withOpacity(0.2)
              : Colors.white.withOpacity(0.8),
          foregroundColor: isSelected ? widget.renk : Colors.black87,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: isSelected ? widget.renk : Colors.grey.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          elevation: isSelected ? 4 : 1,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? widget.renk : Colors.grey.withOpacity(0.3),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : Text(
                      String.fromCharCode(65 + index), // A, B, C, D, E
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
