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

  Future<dynamic> signIn() async {
    final res = await _authRepository.signIn();

    User user = res.user;
    return user;
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}
