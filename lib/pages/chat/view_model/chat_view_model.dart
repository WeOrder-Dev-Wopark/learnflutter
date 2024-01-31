import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/auth/user_provider.dart';
import 'package:learnflutter/models/message.dart';
import 'package:learnflutter/pages/chat/repository/chat_repository.dart';

final chatViewModelProvider = Provider<ChatViewModel>((ref) {
  final userInfo = ref.watch(userProvider);
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatViewModel(chatRepository, userInfo);
});

class ChatViewModel {
  ChatViewModel(chatRepository, userInfo)
      : _chatRepository = chatRepository,
        _userInfo = userInfo;

  final ChatRepository _chatRepository;

  final UserProvider _userInfo;

  final List<Message> _messageList = [];

  List<Message> get messageList => _messageList;

  void sendMessage({required String text}) {
    final today = DateTime.now();
    if (_userInfo.currentUser != null) {
      final currentUser = _userInfo.currentUser;

      final message = Message(
        author: currentUser!,
        createAt: today.toString(),
        content: text,
      );

      _chatRepository.sendMessage(message);
    }
  }
}
