import 'package:flutter/material.dart';

import '../../constants.dart';

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
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      height: 20,
      width: 20,
      child: Stack(
        children: [
          isDelivered == true
              ? Stack(
                  children: [
                    Positioned(
                      left: 5.0,
                      child: Icon(
                        Icons.check,
                        size: 15.0,
                        color: isSeen == true ? kActiveCheckColor : kCheckColor,
                      ),
                    ),
                    Positioned(
                      top: 1.7,
                      left: 1,
                      child: Container(
                        height: 5.0,
                        width: 5.0,
                        color: kMyTextBubbleColor,
                        // color: Colors.amber,
                      ),
                    ),
                  ],
                )
              : const Icon(
                  Icons.check,
                  color: kCheckColor,
                  size: 15.0,
                ),
          Positioned(
            // left: -1,
            child: Icon(
              Icons.check,
              size: 15.0,
              color: isSeen == true ? kActiveCheckColor : kCheckColor,
            ),
          ),
        ],
      ),
    );
  }
}
