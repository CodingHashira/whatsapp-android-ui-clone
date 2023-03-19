import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class DeliveryIndicator extends StatelessWidget {
  const DeliveryIndicator({
    super.key,
    this.isDelivered,
    this.isReached,
    this.isSeen,
  });

  final bool? isDelivered;
  final bool? isReached;
  final bool? isSeen;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.2,
      child: Container(
        padding: const EdgeInsets.only(top: 5.0),
        height: 20,
        width: 20,
        child: Stack(
          children: [
            isDelivered == true || isSeen == true
                ? Stack(
                    children: [
                      Positioned(
                        top: 0.5,
                        left: 3.8,
                        child: CustomCheckIcon(isSeen: isSeen),
                      ),
                      const CheckIconOverlay(),
                    ],
                  )
                : const Icon(
                    Icons.check,
                    color: kCheckColor,
                    size: 15.0,
                  ),
            CustomCheckIcon(isSeen: isSeen),
          ],
        ),
      ),
    );
  }
}

class CheckIconOverlay extends StatelessWidget {
  const CheckIconOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3.3,
      left: 3.7,
      child: Transform.rotate(
        angle: 0.8,
        child: Container(
          height: 5.0,
          width: 5.0,
          color: kMyTextBubbleColor,
        ),
      ),
    );
  }
}

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
    required this.isSeen,
  });

  final bool? isSeen;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      size: 15.0,
      color: isSeen == true ? kActiveCheckColor : kCheckColor,
    );
  }
}
