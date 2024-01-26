import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

class AuthRepository {
  AuthRepository(FirebaseAuth auth) : _auth = auth;

  final FirebaseAuth _auth;

  Future<dynamic> signIn() async {
    try {
      final res = await _auth.signInAnonymously();

      log('[SIGNIN]: ${res.toString()}');

      return res;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
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

// final authProvider = StreamProvider((ref) {
//   return FirebaseAuth.instance.authStateChanges();
// });