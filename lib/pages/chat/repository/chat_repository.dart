import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider = Provider((ref) {
  return ChatRepository();
});

class ChatRepository {
  // final List<Message> _messageList = [
  //   Message(createAt: DateTime.now(), content: "hi1", type: MessageType.sent),
  //   Message(createAt: DateTime.now(), content: "hi2", type: MessageType.sent),
  //   Message(createAt: DateTime.now(), content: "hi3", type: MessageType.sent),
  //   Message(createAt: DateTime.now(), content: "hi4", type: MessageType.sent),
  //   Message(createAt: DateTime.now(), content: "hi5", type: MessageType.sent),
  //   Message(createAt: DateTime.now(), content: "hi6", type: MessageType.sent),
  // ];

  // List<Message> getMessageList() {
  //   return _messageList;
  // }

  // void sendMessage({required String text}) {
  //   DateTime currentTime = DateTime.now();

  //   final message = Message.send(text: text, time: currentTime);

  //   _messageList.insert(0, message);
  // }
}
