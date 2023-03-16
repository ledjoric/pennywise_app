import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;
  final BorderSide? outline;
  final TextStyle? style;

  const AppFilledButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.outline,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: fieldHeight,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          side: outline,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: style ?? kButtonStyle,
        ),
      ),
    );
  }
}
