import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/auth/auth_repository.dart';
import 'package:learnflutter/auth/user_provider.dart';
import 'package:learnflutter/models/user.dart';

final authProvider = Provider<AuthProvider>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userInfo = ref.watch(userProvider);
  return AuthProvider(authRepository, userInfo);
});

class AuthProvider {
  AuthProvider(AuthRepository authRepository, UserProvider userProvider)
      : _authRepository = authRepository,
        _userProvider = userProvider;

  final AuthRepository _authRepository;
  final UserProvider _userProvider;

  Future<void> signIn() async {
    final res = await _authRepository.signIn();

    if (res != null) {
      final user = User(name: res.uid, uid: res.uid);

      _userProvider.setCurrentUser(user);
    }
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}
