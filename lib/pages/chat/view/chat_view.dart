import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/message.dart';
import 'package:learnflutter/pages/chat/view_model/chat_view_model.dart';

import 'package:learnflutter/pages/chat/widget/bottom_textfield.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  late List<Message> messageList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(chatViewModelProvider);
    final messageList = provider.messageList;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(messageList[index].content),
                    );
                  }),
            ),
            const BottomTextField(),
          ]),
        ),
      ],
    ));
  }
}
