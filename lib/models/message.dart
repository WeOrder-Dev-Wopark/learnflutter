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

  factory Message.send({required text}) {
    return Message(
      content: text,
      type: MessageType.sent,
      createAt: DateTime.now(),
    );
  }
}

enum MessageType {
  sent,
  received,
}
