import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('esception ====> $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final res = await FirebaseAuth.instance.signInAnonymously();

                log(res.toString());
              },
              child: const Text("anonymously login"),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await signInWithGoogle();

                log(res.toString());
              },
              child: const Text("google login"),
            ),
          ],
        ),
      ),
    );
  }
}
