import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey/repository/auth_repository.dart';

class LoginController {
  final _authRepository = AuthRepository();
  User? user;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required void Function() navigateToTaskScreen,
  }) async {
    final userCredential = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    if (user != null) {
      navigateToTaskScreen();
    }
  }
}
