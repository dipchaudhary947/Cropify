import 'package:flutter/material.dart';

import '../../model/chat_message_model.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSender = message.type == MessageType.sender;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .72,
        ),

        margin: const EdgeInsets.only(bottom: 10),

        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

        decoration: BoxDecoration(
          color: isSender ? const Color(0xff52B447) : Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isSender ? 18 : 4),
            bottomRight: Radius.circular(isSender ? 4 : 18),
          ),

          border: isSender ? null : Border.all(color: Colors.grey.shade300),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 14,
                height: 1.35,
                color: isSender ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              message.time,
              style: TextStyle(
                fontSize: 10,
                color: isSender ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
