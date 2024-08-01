import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  final String userId;
  final String email;

  LocalUser({required this.userId, required this.email});
}

Future<void> saveUserLocally(LocalUser user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userId', user.userId);
  await prefs.setString('userEmail', user.email);
}

Future<LocalUser?> getUserFromLocal() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('userId');
  final String? userEmail = prefs.getString('userEmail');
  if (userId != null && userEmail != null) {
    return LocalUser(userId: userId, email: userEmail);
  }
  return null;
}

Future<void> removeUserLocally() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userId');
  await prefs.remove('userEmail');
}
