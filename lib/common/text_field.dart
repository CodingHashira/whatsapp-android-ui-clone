import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.value,
    this.hintText,
    this.isReadOnly,
    this.label,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.keyBoardType,
    this.hideBorder,
    this.textHeight,
    this.onTap,
    this.borderColor,
    this.borderWidth,
    this.textAlign,
    this.autoFocus,
  });
  final String? value;
  final String? hintText;
  final bool? isReadOnly;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? hideBorder;
  final double? textHeight;
  final VoidCallback? onTap;
  final Color? borderColor;
  final double? borderWidth;
  final TextAlign? textAlign;
  final bool? autoFocus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.value != null) _controller.text = widget.value!;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFocus ?? false,
      textAlign: widget.textAlign ?? TextAlign.start,
      onTap: widget.onTap,
      keyboardType: widget.keyBoardType,
      maxLength: widget.maxLength,
      cursorColor: kAccentColor,
      style: const TextStyle(color: Colors.white),
      controller: _controller,
      readOnly: widget.isReadOnly ?? false,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.only(top: 5, bottom: 1.0, right: -5),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: kSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hoverColor: const Color(0xff757575),
        hintStyle: TextStyle(
          color: kSecondaryColor,
          height: widget.textHeight ?? 1.2,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.hideBorder == true
                ? Colors.transparent
                : const Color(0xff757575),
            width: widget.borderWidth ?? 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.hideBorder == true
                ? Colors.transparent
                : widget.borderColor ?? const Color(0xff757575),
            width: widget.borderWidth ?? 1.5,
          ),
        ),
        suffixIconColor: const Color(0xff757575),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
      ),
    );
  }
}
