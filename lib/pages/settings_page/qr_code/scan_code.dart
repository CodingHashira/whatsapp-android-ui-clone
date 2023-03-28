import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
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
          ),
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
    double r = 25; //<-- corner radius

    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Paint redPaint = Paint()
      ..color = kAccentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      Radius.circular(r),
    );

    Path topRightArc = Path()
      ..moveTo(w - r, 0)
      ..lineTo(w, 0)
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
    canvas.drawPath(topLeftArc, redPaint);
    canvas.drawPath(topRightArc, redPaint);
    canvas.drawPath(bottomLeftArc, redPaint);
    canvas.drawPath(bottomRightArc, redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
