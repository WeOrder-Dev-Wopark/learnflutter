import 'package:firebase_database/firebase_database.dart';
import 'package:learnflutter/models/user.dart';

class Message {
  /// 작성자
  final User author;

  /// 작성 시간
  final String createAt;

  /// 내용
  final String content;

  /// 읽음 처리
  final bool isRead = false;

  Message({
    required this.author,
    required this.createAt,
    required this.content,
  });

  Message.fromSnapshot(DataSnapshot snapshot)
      : author = (snapshot.value as Map)['author'],
        createAt = (snapshot.value as Map)['createAt'],
        content = (snapshot.value as Map)['content'];

  toJson() {
    return {
      'author': author.toJson(),
      'createAt': createAt,
      'content': content,
    };
  }
}
