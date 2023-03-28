import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/custom_round_button.dart';

import 'conversation_page/actions.dart';
import 'conversation_page/chat_box.dart';
import 'conversation_page/conversation_about.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/chat_bubble.dart';

const data = Data();

class ConversationPage extends StatefulWidget {
  const ConversationPage({
    super.key,
    this.iconColor,
    required this.imageUrl,
    required this.userName,
    required this.about,
  });

  final Color? iconColor;
  final String imageUrl;
  final String userName;
  final String about;

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final _controller = TextEditingController();

  var icon = Icons.mic_rounded;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.darken,
          ),
          child: Image.asset(
            'images/bg.jpg',
            height: screenSize.height,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: CustomAppBar(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationAboutPage(
                  title: widget.userName,
                  imageUrl: widget.imageUrl,
                  about: widget.about,
                ),
              ),
            ),
            imageUrl: widget.imageUrl,
            title: widget.userName,
            isChildWidget: true,
            iconColor: widget.iconColor,
            actions: const ChatPageActions(),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomListBuilder(
                      itemCount: data.messageList.length,
                      list: data.messageList,
                      startIndex: 0,
                      returnWidgetType: CustomChatBubble,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    ChatBox(
                      controller: _controller,
                      onChanged: (p0) {
                        var textLength = _controller.text.length;
                        setState(() {
                          icon = textLength > 0
                              ? Icons.send_rounded
                              : Icons.mic_rounded;
                        });
                      },
                    ),
                    const SizedBox(width: 5.0),
                    CustomRoundButton(
                      onTap: () {
                        setState(() {
                          _controller.text = '';
                          icon = Icons.mic_rounded;
                        });
                      },
                      icon: icon,
                      iconSize: 25.0,
                      padding: 10.0,
                    )
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
