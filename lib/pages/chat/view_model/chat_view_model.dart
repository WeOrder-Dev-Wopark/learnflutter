import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/message.dart';

final chatViewModelProvider = ChangeNotifierProvider((ref) {
  return ChatViewModel();
});

class ChatViewModel extends ChangeNotifier {
  final List<Message> _messageList = [
    Message(createAt: DateTime.now(), content: "hi1", type: MessageType.sent),
    Message(createAt: DateTime.now(), content: "hi2", type: MessageType.sent),
    Message(createAt: DateTime.now(), content: "hi3", type: MessageType.sent),
    Message(createAt: DateTime.now(), content: "hi4", type: MessageType.sent),
    Message(createAt: DateTime.now(), content: "hi5", type: MessageType.sent),
    Message(createAt: DateTime.now(), content: "hi6", type: MessageType.sent),
  ];

  List<Message> get messageList => _messageList;

  void sendMessage({required String text}) {
    final today = DateTime.now();
    final message = Message.send(text: text, time: today);

    _messageList.add(message);

    notifyListeners();
  }
}
