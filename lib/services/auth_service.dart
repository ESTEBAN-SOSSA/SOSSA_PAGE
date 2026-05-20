import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthService {
  static const String kUserKey = 'sossa_user';
  static const String kIsLoggedInKey = 'sossa_is_logged_in';

  Future<bool> register(User user) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(kUserKey)) {
      return false;
    }
    await prefs.setString(kUserKey, user.toJson());
    return true;
  }

  Future<User?> getStoredUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(kUserKey);
    if (raw == null) return null;
    return User.fromJson(raw);
  }

  Future<bool> login(String emailOrName, String password) async {
    final user = await getStoredUser();
    if (user == null) return false;
    final matchesIdentity =
        user.email.toLowerCase() == emailOrName.toLowerCase() ||
            user.name.toLowerCase() == emailOrName.toLowerCase();
    if (matchesIdentity && user.password == password) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kIsLoggedInKey, true);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kIsLoggedInKey, false);
  }
}
