import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
bool isfavorite = false;

class CustomImageView extends StatefulWidget {
  const CustomImageView({
    super.key,
    required this.imagePath,
    this.actionsList,
    this.titleWidget,
    required this.title,
    this.uploadTime,
    this.statusText,
    this.userImageUrl,
  });

  final String imagePath;
  final List<Widget>? actionsList;
  final Widget? titleWidget;
  final String title;
  final String? uploadTime;
  final String? statusText;
  final String? userImageUrl;

  @override
  State<CustomImageView> createState() => _CustomImageViewState();
}

class _CustomImageViewState extends State<CustomImageView> {
  double count = 0.0;
  bool isOnHold = false;

  void startCountdown() {
    const duration = Duration(milliseconds: 50);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        !isOnHold ? count += 0.01 : count;
      });
      if (count >= 1.0) {
        Navigator.pop(context);
        timer.cancel();
        count = 1.0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.userImageUrl != null ? startCountdown() : null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                isOnHold
                    ? const SizedBox(height: 58.0)
                    : const SizedBox.shrink(),
                Visibility(
                  visible: isOnHold ? false : true,
                  child: Column(
                    children: [
                      widget.userImageUrl != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 10.0),
                              child: LinearPercentIndicator(
                                padding: EdgeInsets.zero,
                                percent: count,
                                progressColor: Colors.white,
                                backgroundColor: Colors.grey,
                                lineHeight: 2.0,
                              ),
                            )
                          : const SizedBox(
                              height: 15.0,
                            ),
                      Row(
                        children: [
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          widget.userImageUrl != null
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.6,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 17.0,
                                    backgroundImage:
                                        AssetImage(widget.userImageUrl!),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          widget.userImageUrl != null
                              ? const SizedBox(width: 15.0)
                              : const SizedBox.shrink(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: kTitleTextStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              widget.uploadTime != null
                                  ? Text(
                                      widget.uploadTime!,
                                      style: kSubTitleTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: widget.actionsList != null
                                ? widget.actionsList!.length * 40
                                : 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: widget.actionsList ??
                                  [
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        isfavorite = !isfavorite;
                                      }),
                                      child: Icon(
                                        !isfavorite
                                            ? Icons.star_border_rounded
                                            : Icons.star_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.share_rounded,
                                      color: Colors.white,
                                      size: 22.0,
                                    ),
                                    CustomPopupMenuButton(
                                      popupMenuItems:
                                          data.imageViewPopupMenuOptions,
                                      popButtonSize: 24.0,
                                    )
                                  ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onLongPressUp: widget.userImageUrl != null
                  ? () {
                      isOnHold = false;
                    }
                  : null,
              onLongPressDown: widget.userImageUrl != null
                  ? (p0) {
                      isOnHold = true;
                    }
                  : null,
              child: SizedBox(
                child: Image.asset(
                  widget.imagePath,
                ),
              ),
            ),
            widget.statusText != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        Text(
                          widget.statusText!,
                          style: kTitleTextStyle.copyWith(
                            fontSize: 20.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: isOnHold ? 53 : 10.0),
                        Visibility(
                          visible: isOnHold ? false : true,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                'Reply',
                                style: kSubTitleTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
