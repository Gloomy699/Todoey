import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey/repository/auth_repository.dart';

class RegistrationController {
  final _authRepository = AuthRepository();
  User? user;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required void Function() navigateToTaskScreen,
  }) async {
    final userCredential = await _authRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    if (user != null) {
      navigateToTaskScreen();
    }
  }
}
