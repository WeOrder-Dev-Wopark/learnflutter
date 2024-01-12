import 'package:learnflutter/models/message.dart';
import 'package:learnflutter/models/user.dart';

class Chat {
  String chatId;
  List<User> userList;
  List<Message> messageList;

  Chat({
    required this.chatId,
    required this.userList,
    required this.messageList,
  });
}
