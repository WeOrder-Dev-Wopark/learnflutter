import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/screens/chat/screen/chat_screen.dart';

final helloWorldProvider = Provider((ref) => 'hello world!');

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: "1:1 Chat App",
      home: ChatScreen(),
    );
  }
}
