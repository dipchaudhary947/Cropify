import 'package:cropify_app/features/roles/customer/chat/view/widgets/chat_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../products/model/product_model.dart';

import '../../view_model/chat_view_model.dart';

import '../widgets/chat_app_bar.dart';
import '../widgets/date_chip.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends ConsumerWidget {
  final ProductModel product;

  const ChatScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatProvider);

    return Scaffold(
      backgroundColor: const Color(0xffE9E4D8),

      /// APP BAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),

        child: Center(child: ChatAppBar(product: product)),
      ),

      /// BODY
      body: Column(
        children: [
          const SizedBox(height: 12),

          /// DATE CHIP
          const DateChip(),

          /// CHAT LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

              itemCount: chats.length,

              itemBuilder: (context, index) {
                return MessageBubble(message: chats[index]);
              },
            ),
          ),

          /// INPUT FIELD
          const MessageInputBar(),
        ],
      ),
    );
  }
}
