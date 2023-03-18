import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.value,
    this.isReadOnly,
    this.label,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.keyBoardType,
  });
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? value;
  final bool? isReadOnly;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final TextInputType? keyBoardType;

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
      keyboardType: widget.keyBoardType,
      maxLength: widget.maxLength,
      cursorColor: kAccentColor,
      style: const TextStyle(color: Colors.white),
      controller: _controller,
      readOnly: widget.isReadOnly ?? false,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.only(top: 5, bottom: 1.0),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: kSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hoverColor: const Color(0xff757575),
        hintStyle: const TextStyle(color: kSecondaryColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff757575),
            width: 1.5,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff757575),
            width: 1.5,
          ),
        ),
        suffixIconColor: const Color(0xff757575),
        suffixIconConstraints: widget.prefixIcon != null
            ? const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              )
            : const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
        prefixIconConstraints: widget.prefixIcon != null
            ? const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              )
            : const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
      ),
    );
    // return TextField(
    //   readOnly: widget.isReadOnly ?? false,
    //   controller: _controller,
    //   maxLines: null,
    //   cursorColor: kAccentColor,
    //   style: const TextStyle(
    //     fontSize: 18.0,
    //     color: Colors.white,
    //   ),
    //   decoration: InputDecoration(
    //     suffixIconColor: const Color(0xff757575),
    //     label: const Text(
    //       'Country',
    //       style: kInfoTextStyle,
    //     ),
    //     hintText: widget.hintText,
    //     hintStyle: const TextStyle(
    //       height: 1.13,
    //       color: kSecondaryColor,
    //       fontSize: 18.0,
    //     ),
    //     // prefixIconConstraints: widget.prefixIcon != null
    //     //     ? const BoxConstraints(
    //     //         minWidth: 24,
    //     //         minHeight: 24,
    //     //       )
    //     //     : const BoxConstraints(
    //     //         minWidth: 0,
    //     //         minHeight: 0,
    //     //       ),
    //     // prefixIcon: widget.prefixIcon != null
    //     //     ? Icon(
    //     //         widget.prefixIcon,
    //     //         // Icons.mood,
    //     //         color: kSecondaryColor,
    //     //       )
    //     //     : const SizedBox.shrink(),
    //     suffixIcon: Icon(widget.suffixIcon),
    //     // border: InputBorder.none,
    //     border: UnderlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Color(0xff747576),
    //         width: 3.0,
    //       ),
    //     ),
    //     focusedBorder: UnderlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Color(0xff747576),
    //         width: 3.0,
    //       ),
    //     ),
    //   ),
    // );
  }
}

class MyPrefixWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Hello 91');
  }
}
