import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learnflutter/pages/chat/view_model/chat_view_model.dart';

class BottomTextField extends ConsumerStatefulWidget {
  const BottomTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomTextFieldState();
}

class _BottomTextFieldState extends ConsumerState<BottomTextField> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final readProvider = ref.read(chatViewModelProvider);
    final sendMessage = readProvider.sendMessage;

    return SafeArea(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text('logout'),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: _buildChatTextField(),
            ),
          ),
          IconButton(
              onPressed: () {
                sendMessage(text: _textEditingController.text);
                _textEditingController.text = '';
              },
              icon: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.indigo[400],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildChatTextField() {
    return TextField(
      minLines: 1,
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      controller: _textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: '스팟 채팅에 참여해보세요.',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }
}
