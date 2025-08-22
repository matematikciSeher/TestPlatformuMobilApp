class User {
  final String id;
  final String username;
  final String email;
  final Map<String, Map<String, double>> dersPerformanslari;
  final double genelKullanimYuzdesi;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.dersPerformanslari,
    required this.genelKullanimYuzdesi,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      dersPerformanslari: Map<String, Map<String, double>>.from(
        json['dersPerformanslari'] ?? {},
      ),
      genelKullanimYuzdesi: json['genelKullanimYuzdesi']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'dersPerformanslari': dersPerformanslari,
      'genelKullanimYuzdesi': genelKullanimYuzdesi,
    };
  }

  User copyWith({
    String? id,
    String? username,
    String? email,
    Map<String, Map<String, double>>? dersPerformanslari,
    double? genelKullanimYuzdesi,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      dersPerformanslari: dersPerformanslari ?? this.dersPerformanslari,
      genelKullanimYuzdesi: genelKullanimYuzdesi ?? this.genelKullanimYuzdesi,
    );
  }
}

class UserProvider {
  static User? _currentUser;

  static User? get currentUser => _currentUser;

  static void setUser(User user) {
    _currentUser = user;
  }

  static void clearUser() {
    _currentUser = null;
  }

  static bool get isLoggedIn => _currentUser != null;
}
