import 'package:cropify_app/features/auth/model/role_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = NotifierProvider<AuthViewModel, RoleType>(
  AuthViewModel.new,
);

class AuthViewModel extends Notifier<RoleType> {
  @override
  RoleType build() {
    return RoleType.buyer;
  }

  void selectRole(RoleType role) {
    state = role;
  }

  void signUp() {
    print("Sign Up Clicked");
  }

  void login() {
    print("Login Clicked");
  }
}
