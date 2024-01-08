import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/screens/chat/view/chat_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  // 앱이 완전히 초기화되기 전에 서비스 바인딩을 사용하려고할 때 발생하는 에러 방지
  // 아래 메서드는 Flutter 엔진이 완전히 초기화되도록 해줌
  WidgetsFlutterBinding.ensureInitialized();

  _initialLize();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Future<void> _initialLize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: "1:1 Chat App",
      home: ChatView(),
    );
  }
}
