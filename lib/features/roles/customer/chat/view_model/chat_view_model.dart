import 'package:flutter_riverpod/legacy.dart';

import '../model/chat_message_model.dart';

final chatProvider =
    StateNotifierProvider<ChatViewModel, List<ChatMessageModel>>(
      (ref) => ChatViewModel(),
    );

class ChatViewModel extends StateNotifier<List<ChatMessageModel>> {
  ChatViewModel()
    : super([
        ChatMessageModel(
          text: "Hi Sarah! Your tomatoes are being packed fresh right now 🍅",
          time: "2:14 PM",
          type: MessageType.receiver,
        ),
        ChatMessageModel(
          text: "Awesome! Are they organic this week?",
          time: "2:15 PM",
          type: MessageType.sender,
        ),
        ChatMessageModel(
          text: "Yes, harvested this morning. No pesticides.",
          time: "2:15 PM",
          type: MessageType.receiver,
        ),
        ChatMessageModel(
          text: "Perfect. Can you add a bunch of basil?",
          time: "2:16 PM",
          type: MessageType.sender,
        ),
        ChatMessageModel(
          text: "Of course — adding it now. \$1.20 extra.",
          time: "2:17 PM",
          type: MessageType.receiver,
        ),
      ]);

  void sendMessage(String message) {
    state = [
      ...state,
      ChatMessageModel(text: message, time: "Now", type: MessageType.sender),
    ];
  }
}
