import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import 'actions.dart';
import 'chat_box.dart';
import 'mic_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.darken,
          ),
          child: Image.asset(
            'images/bg.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const CustomAppBar(
                imageUrl: 'images/p3.jpg',
                title: 'Monica',
                isChildWidget: true,
                actions: ChatPageActions(),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    ChatBox(),
                    SizedBox(width: 5.0),
                    MicButton()
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ],
    );
  }
}
