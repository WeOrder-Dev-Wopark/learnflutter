import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/screens/chat/widget/bottom_textfield.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: const Column(children: [
            Expanded(
              child: Center(
                child: Text("hi"),
              ),
            ),
            BottomTextField(),
          ]),
        ),
      ],
    ));
  }
}
