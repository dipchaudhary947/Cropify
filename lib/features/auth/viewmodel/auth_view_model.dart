import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) => AuthViewModel());

class AuthViewModel {
  void signUp() {
    print("Sign Up Clicked");
  }

  void login() {
    print("Login Clicked");
  }
}
