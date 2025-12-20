import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class AppUser {
  const AppUser({required this.username});
  final String username;
}

class AuthNotifier extends Notifier<AppUser?> {
  @override
  AppUser? build() {
    return null;
  }

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username.isNotEmpty && password.length >= 4) {
      state = AppUser(username: username);
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (username.isNotEmpty && password.length >= 4) {
      state = AppUser(username: username);
      return true;
    }
    return false;
  }

  void logout() {
    state = null;
  }
}

final authProvider = NotifierProvider<AuthNotifier, AppUser?>(AuthNotifier.new);
