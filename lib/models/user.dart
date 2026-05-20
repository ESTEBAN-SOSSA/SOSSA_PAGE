import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;

  const User({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
      };

  factory User.fromMap(Map<String, dynamic> map) => User(
        name: map['name'] as String? ?? '',
        email: map['email'] as String? ?? '',
        password: map['password'] as String? ?? '',
      );

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
