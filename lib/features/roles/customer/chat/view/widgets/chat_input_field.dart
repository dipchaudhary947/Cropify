import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/chat_view_model.dart';

class MessageInputBar extends ConsumerStatefulWidget {
  const MessageInputBar({super.key});

  @override
  ConsumerState<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends ConsumerState<MessageInputBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      color: const Color(0xffE9E4D8),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xffECE9DC),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Message...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xff43A047),
              child: IconButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;

                  ref.read(chatProvider.notifier).sendMessage(controller.text);

                  controller.clear();
                },
                icon: const Icon(Icons.send, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
