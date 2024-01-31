import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/user.dart';

final userProvider = Provider((ref) => UserProvider());

class UserProvider {
  User? _currentUser;
  User? get currentUser => _currentUser;

  void setCurrentUser(User? user) {
    _currentUser ??= user;
  }
}
