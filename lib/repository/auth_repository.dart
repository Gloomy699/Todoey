import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _authInstance = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
