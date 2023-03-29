import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060a0d),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.black,
            ),
            height: 320,
            width: 290,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text('Scan a WhatsApp QR code', style: kTitleTextStyle),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.photo_library_rounded,
                  color: Colors.white,
                ),
                Icon(
                  Icons.flash_off_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 30; //<-- corner radius

    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Paint borderPaint = Paint()
      ..color = kAccentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h / 2),
        width: w,
        height: h,
      ),
      Radius.circular(r),
    );

    Path topRightArc = Path()
      ..moveTo(w - r, 0)
      ..lineTo(w, 0)
      ..quadraticBezierTo(w, 0, w, r)
      ..lineTo(w, r);

    Path bottomLeftArc = Path()
      ..moveTo(r, h)
      ..lineTo(0, h)
      ..lineTo(0, h - r);

    Path topLeftArc = Path()
      ..moveTo(0, r)
      ..lineTo(0, 0)
      ..lineTo(r, 0);

    Path bottomRightArc = Path()
      ..moveTo(w - r, h)
      ..lineTo(w, h)
      ..lineTo(w, h - r);

    canvas.drawRRect(fullRect, blackPaint);
    canvas.drawPath(topLeftArc, borderPaint);
    canvas.drawPath(topRightArc, borderPaint);
    canvas.drawPath(bottomLeftArc, borderPaint);
    canvas.drawPath(bottomRightArc, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
