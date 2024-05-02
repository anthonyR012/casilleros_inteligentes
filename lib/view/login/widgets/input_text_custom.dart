import 'package:casilleros_inteligente/config/theme.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.width,
      required this.textLabel,
      required this.height,
      this.onTapIcon,
      this.onSubmitted,
      this.onChanged,
      this.onFocusListener,
      this.focusNode,
      this.controller,
      this.validator});
  final double width;
  final double? height;
  final void Function()? onTapIcon;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onFocusListener;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        textAlign: TextAlign.start,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        validator: validator,
        style: const TextStyle(
            color: whiteColor,
            fontSize: messageSize),
        decoration: InputDecoration(
          filled: true,
          errorStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: h5Size),
          fillColor: grayColor,
          labelText: textLabel,
          // suffixIcon: const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Icon(Icons.search),
          // ),
          // prefixIcon: iconPrefix,
          labelStyle: const TextStyle(
              color: whiteColor,
              fontSize: bodySize),
        ),
      ),
    );
  }
}
