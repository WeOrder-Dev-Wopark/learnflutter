import 'package:learnflutter/models/user.dart';

class Message {
  /// 작성자
  final User author;

  /// 작성 시간
  final DateTime createAt;

  /// 내용
  final String content;

  /// 읽음 처리
  final bool isRead = false;

  Message({
    required this.author,
    required this.createAt,
    required this.content,
  });

  factory Message.send({
    required User author,
    required String text,
    required DateTime time,
  }) {
    return Message(
      author: author,
      content: text,
      createAt: time,
    );
  }
}
