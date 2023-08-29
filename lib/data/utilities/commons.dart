import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Commons {
  // final prefs = SharedPreferences.getInstance();
  final prefs = SharedPreferences.getInstance();

  Future setUid(
    String token,
  ) async {
    final storage = await prefs;
    await storage.setString("token", token);
  }

  Future<String> getUid() async {
    final storage = await prefs;
    return storage.getString("token") ?? '';
  }

  void setEmail(String email, String token) async {
    final storage = await prefs;
    await storage.setString("email", "token");
  }

  Future<String> getEmail() async {
    final storage = await prefs;
    return storage.getString("email") ?? '';
  }

  Future<bool> removeUid() async {
    final storage = await prefs;
    return storage.remove("token");
  }
  Future<DateTime?> getTokenExpiration() async {
    final storage = await prefs;
    return DateTime.parse(storage.getString('tokenExpiration') ?? '');
  }

  void showSnackbarError(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.error(message: msg));
  }

  void showSnackbarInfo(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.info(message: msg));
  }
}
