import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/custom_round_button.dart';

class AddTextStatusPage extends StatefulWidget {
  const AddTextStatusPage({super.key});

  @override
  State<AddTextStatusPage> createState() => _AddTextStatusPageState();
}

class _AddTextStatusPageState extends State<AddTextStatusPage> {
  final _controller = TextEditingController();

  IconData icon = Icons.mic_rounded;
  int colorIndex = 0;

  final List<Color> scaffoldColors = [
    const Color(0xff26c4dc),
    const Color(0xff8894be),
    const Color(0xfffe7b69),
    const Color(0xff6e257e),
    const Color(0xffc2a142),
    const Color(0xff20343b),
    const Color(0xff792139),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColors[colorIndex],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: CustomTextField(
              hintText: 'Type a status',
              autoFocus: true,
              controller: _controller,
              onChanged: (p0) {
                var textLength = _controller.text.length;
                setState(() {
                  icon =
                      textLength > 0 ? Icons.send_rounded : Icons.mic_rounded;
                });
              },
              hideBorder: true,
              textAlign: TextAlign.center,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
              fontSize: 30.0,
              cursorColor: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.black.withOpacity(0.3),
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 140.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.title_rounded,
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () => setState(() {
                              if (colorIndex != scaffoldColors.length - 1) {
                                colorIndex += 1;
                              } else {
                                colorIndex = 0;
                              }
                            }),
                            icon: const Icon(
                              Icons.color_lens_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 55.0,
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kAppBarColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          children: const [
                            Icon(
                              FeatherIcons.pieChart,
                              color: Colors.white,
                              size: 15.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Status (Contacts)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomRoundButton(
                      icon: icon,
                      iconSize: 25.0,
                      padding: 10.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
