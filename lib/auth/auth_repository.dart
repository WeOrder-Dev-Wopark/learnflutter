import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

class AuthRepository {
  AuthRepository(FirebaseAuth auth) : _auth = auth;

  final FirebaseAuth _auth;

  Future<User?> signIn() async {
    try {
      final res = await _auth.signInAnonymously();

      return res.user;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      log('[SIGNOUT]: signout successed.');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
