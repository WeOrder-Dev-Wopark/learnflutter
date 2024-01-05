class Message {
  /// 작성 시간
  final DateTime createAt;

  /// 내용
  final String content;

  /// 읽음 처리
  final bool isRead = false;

  /// message 타입
  final MessageType type;

  Message({
    required this.createAt,
    required this.content,
    required this.type,
  });

  factory Message.send({required String text, required DateTime time}) {
    return Message(
      content: text,
      type: MessageType.sent,
      createAt: time,
    );
  }
}

enum MessageType {
  sent,
  received,
}
