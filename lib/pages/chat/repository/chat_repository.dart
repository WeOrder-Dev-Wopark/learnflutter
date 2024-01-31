import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/message.dart';

final chatRepositoryProvider = Provider((ref) {
  return ChatRepository();
});

class ChatRepository {
  final FirebaseDatabase _realtimeDatabase = FirebaseDatabase.instance;

  Future<void> sendMessage(Message message) async {
    final DatabaseReference ref = _realtimeDatabase.ref().child('messages');
    await ref.push().set(message.toJson());
  }
}
