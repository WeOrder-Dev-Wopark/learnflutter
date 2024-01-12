import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/auth/auth_repository.dart';

final authProvider = Provider<AuthProvider>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthProvider(authRepository);
});

class AuthProvider {
  AuthProvider(AuthRepository authRepository)
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Stream<User?> getAuthState() {
    return _authRepository.authState;
  }

  Future<void> signIn() async {
    return _authRepository.signIn();
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}
