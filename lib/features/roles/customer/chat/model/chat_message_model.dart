enum MessageType { sender, receiver }

class ChatMessageModel {
  final String text;
  final String time;
  final MessageType type;

  ChatMessageModel({
    required this.text,
    required this.time,
    required this.type,
  });
}
