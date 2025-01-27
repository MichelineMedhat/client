import 'dart:async';

import '../models/user.dart';
import '../util/auth.dart';

class UserRepository {
  static final Auth _auth = Auth.instance;

  static Future<void> signIn(String nationalId, String password) async {
    await _auth.signIn(nationalId, password);
  }

  static Future<void> signUp(User user) async {
    await _auth.signUp(user);
  }

  static Future<void> signOut() async {
    return _auth.signOut();
  }

  static Future<bool> isSignedIn() async {
    final currentUser = await _auth.currentUser;
    return currentUser != null;
  }

  static Future<User> getUser() async {
    return await _auth.currentUser;
  }
}
