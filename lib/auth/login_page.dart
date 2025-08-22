import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../anasayfa/anasayfa.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Simüle edilmiş giriş işlemi
      await Future.delayed(const Duration(seconds: 1));

      // Demo kullanıcı verisi
      final user = User(
        id: '1',
        username: _usernameController.text,
        email: '${_usernameController.text}@example.com',
        dersPerformanslari: {
          'Matematik': {
            '9.sınıf': 75.0,
            '10.sınıf': 68.0,
            '11.sınıf': 82.0,
            '12.sınıf': 70.0,
            'TYT': 78.0,
            'AYT': 85.0,
          },
          'Fizik': {
            '9.sınıf': 65.0,
            '10.sınıf': 72.0,
            '11.sınıf': 78.0,
            '12.sınıf': 80.0,
            'TYT': 75.0,
            'AYT': 82.0,
          },
          'Kimya': {
            '9.sınıf': 70.0,
            '10.sınıf': 75.0,
            '11.sınıf': 68.0,
            '12.sınıf': 73.0,
            'TYT': 70.0,
            'AYT': 78.0,
          },
          'Biyoloji': {
            '9.sınıf': 80.0,
            '10.sınıf': 85.0,
            '11.sınıf': 78.0,
            '12.sınıf': 82.0,
            'TYT': 85.0,
            'AYT': 88.0,
          },
          'Tarih': {
            '9.sınıf': 75.0,
            '10.sınıf': 70.0,
            '11.sınıf': 82.0,
            '12.sınıf': 78.0,
            'TYT': 80.0,
            'AYT': 85.0,
          },
          'Coğrafya': {
            '9.sınıf': 78.0,
            '10.sınıf': 82.0,
            '11.sınıf': 75.0,
            '12.sınıf': 80.0,
            'TYT': 78.0,
            'AYT': 82.0,
          },
        },
        genelKullanimYuzdesi: 78.5,
      );

      // Kullanıcıyı kaydet
      UserProvider.setUser(user);

      // SharedPreferences'a kaydet
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', user.toJson().toString());

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Anasayfa()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Giriş hatası: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6C63FF), Color(0xFF8B7CF6)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo ve başlık
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.school,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    '🎓 Test Platformu',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    'Hesabınıza giriş yapın',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 40),

                  // Giriş formu
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Kullanıcı adı
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Kullanıcı Adı',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kullanıcı adı gerekli';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Şifre
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Şifre',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Şifre gerekli';
                              }
                              if (value.length < 6) {
                                return 'Şifre en az 6 karakter olmalı';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Giriş butonu
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6C63FF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : const Text(
                                      'Giriş Yap',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Demo bilgisi
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.blue[200]!),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.info, color: Colors.blue, size: 20),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Demo giriş için herhangi bir kullanıcı adı ve şifre kullanabilirsiniz.',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
