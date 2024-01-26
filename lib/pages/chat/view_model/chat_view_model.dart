import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/message.dart';
import 'package:learnflutter/models/user.dart';

final chatViewModelProvider = Provider<ChatViewModel>((ref) {
  return ChatViewModel();
});

class ChatViewModel {
  final List<Message> _messageList = [];

  List<Message> get messageList => _messageList;

  void sendMessage({required String text}) {
    final today = DateTime.now();
    final message = Message.send(
        author: User(uid: "1", name: 'test'), text: text, time: today);

    _messageList.add(message);
  }
}
