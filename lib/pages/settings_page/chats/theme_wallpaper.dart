import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import './theme_wallpaper/wallpaper_preview.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class ThemeWallpaperPage extends StatefulWidget {
  const ThemeWallpaperPage({super.key});

  @override
  State<ThemeWallpaperPage> createState() => _ThemeWallpaperPageState();
}

class _ThemeWallpaperPageState extends State<ThemeWallpaperPage> {
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Dark Theme Wallpaper',
          ),
          Center(
            child: Column(
              children: [
                WallpaperPreview(
                  imageOpacity: sliderValue,
                ),
                PaddedSettingsTextInfo(
                  text: 'Change',
                  textStyle: kInfoTextStyle.copyWith(
                    color: kAccentColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const CustomDivider(),
          const PaddedSettingsTextInfo(
            text: 'Wallpaper Dimming',
            textStyle: kInfoTextStyle2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SliderTheme(
              data: const SliderThemeData(
                inactiveTrackColor: Color(0xffe9edf0),
                activeTrackColor: kAccentColor,
                trackHeight: 1.5,
                thumbShape: ThumbIconSliderThumbShape(
                  iconData: Icons.dark_mode_rounded,
                  iconColor: kPrimaryColor,
                ),
              ),
              child: Slider(
                value: sliderValue,
                thumbColor: kAccentColor,
                onChanged: (p0) => setState(() {
                  sliderValue = p0;
                }),
              ),
            ),
          ),
          PaddedSettingsTextInfo(
            text: data.textData['themeWallpaper']![0],
            textStyle: kInfoTextStyle.copyWith(
              fontSize: 14.5,
              height: 0.0,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class ThumbIconSliderThumbShape extends SliderComponentShape {
  final IconData iconData;
  final Color iconColor;

  const ThumbIconSliderThumbShape({
    required this.iconData,
    required this.iconColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(14.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = sliderTheme!.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 12.0, paint);

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    textPainter.text = TextSpan(
      text: String.fromCharCode(iconData.codePoint),
      style: TextStyle(
        fontSize: 20.0,
        color: iconColor,
        fontFamily: iconData.fontFamily,
        package: iconData.fontPackage,
      ),
    );
    textPainter.layout();

    final Offset textOffset =
        center - Offset(textPainter.width / 2.0, textPainter.height / 2.0);

    textPainter.paint(canvas, textOffset);
  }
}
